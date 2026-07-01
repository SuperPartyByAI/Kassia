import { createClient } from '@supabase/supabase-js';

export async function create_kassia_page_version(supabase, page_slug, change_source, change_note, created_by = 'system', options = {}) {
  const { data: page, error: pageError } = await supabase.from('kassia_pages').select('*').eq('slug', page_slug).single();
  if (pageError || !page) {
    throw new Error(`Page not found for slug: ${page_slug}`);
  }

  const { data: sections } = await supabase.from('kassia_page_sections').select('*').eq('page_id', page.id).order('order_index', { ascending: true });
  const { data: faqs } = await supabase.from('kassia_faqs').select('*').eq('page_id', page.id).order('order_index', { ascending: true });
  
  const galleryRes = await supabase.from('kassia_gallery_items').select('*').eq('page_id', page.id).order('order_index', { ascending: true });
  const gallery = galleryRes.data || [];
  
  const linksRes = await supabase.from('kassia_internal_links').select('*').or(`source_page_id.eq.${page.id},target_page_id.eq.${page.id}`);
  const internal_links = linksRes.data || [];

  const { data: latestVersion, error: vError } = await supabase
    .from('kassia_page_versions')
    .select('version_number')
    .eq('page_id', page.id)
    .order('version_number', { ascending: false })
    .limit(1)
    .single();

  if (vError && vError.code === '42P01') {
    throw new Error('Table kassia_page_versions does not exist yet.');
  }

  let nextVersionNumber = 1;
  if (!vError && latestVersion) {
    nextVersionNumber = latestVersion.version_number + 1;
  }

  const snapshot = {
    snapshot_schema_version: 1,
    created_context: {
      change_source,
      change_note,
      created_by
    },
    page: page,
    sections: sections || [],
    faqs: faqs || [],
    gallery: gallery || [],
    internal_links: internal_links || []
  };

  if (options.dryRun) {
    return { success: true, version_number: nextVersionNumber, snapshot, dryRun: true };
  }

  const { data: inserted, error: insertError } = await supabase.from('kassia_page_versions').insert({
    page_id: page.id,
    page_slug: page.slug,
    version_number: nextVersionNumber,
    snapshot: snapshot,
    change_source,
    change_note,
    created_by
  }).select().single();

  if (insertError) {
    throw new Error(`Failed to insert page version: ${insertError.message}`);
  }

  return { success: true, version_number: nextVersionNumber, snapshot, inserted };
}

export async function restore_kassia_page_version(supabase, version_id, options = { dryRun: true }) {
  const { data: version, error: versionError } = await supabase
    .from('kassia_page_versions')
    .select('*')
    .eq('id', version_id)
    .single();

  if (versionError || !version) {
    throw new Error(`Snapshot not found for ID: ${version_id}`);
  }

  const snapshot = version.snapshot;
  
  if (!snapshot || snapshot.snapshot_schema_version !== 1) {
    throw new Error('Invalid or unsupported snapshot schema.');
  }

  const pageId = snapshot.page.id;

  const { data: currentPage } = await supabase.from('kassia_pages').select('*').eq('id', pageId).single();
  const { data: currentSections } = await supabase.from('kassia_page_sections').select('id').eq('page_id', pageId);
  const { data: currentFaqs } = await supabase.from('kassia_faqs').select('id').eq('page_id', pageId);
  const currentGalleryRes = await supabase.from('kassia_gallery_items').select('id').eq('page_id', pageId);
  const currentGallery = currentGalleryRes.data || [];
  const currentLinksRes = await supabase.from('kassia_internal_links').select('id, source_page_id, target_page_id').or(`source_page_id.eq.${pageId},target_page_id.eq.${pageId}`);
  const currentLinks = currentLinksRes.data || [];

  let scopedValid = true;
  for (const link of snapshot.internal_links) {
    if (link.source_page_id !== pageId && link.target_page_id !== pageId) {
      scopedValid = false;
      break;
    }
  }

  if (!scopedValid) {
    throw new Error('Snapshot contains internal_links that are NOT scoped to this page.');
  }

  const conflicts = [];

  const checkConflicts = async (tableName, snapshotItems) => {
    if (!snapshotItems || snapshotItems.length === 0) return 0;
    const ids = snapshotItems.map(item => item.id);
    const { data: existingRows, error } = await supabase
      .from(tableName)
      .select('id, page_id')
      .in('id', ids);
    
    if (error) return 0;

    let conflictCount = 0;
    existingRows.forEach(row => {
      if (row.page_id !== pageId) {
        conflicts.push({ table: tableName, id: row.id, reason: `ID exists and is tied to page_id ${row.page_id} instead of ${pageId}` });
        conflictCount++;
      }
    });
    return conflictCount;
  };

  const checkLinksConflicts = async (snapshotLinks) => {
    if (!snapshotLinks || snapshotLinks.length === 0) return 0;
    const ids = snapshotLinks.map(l => l.id);
    const { data: existingLinks, error } = await supabase
      .from('kassia_internal_links')
      .select('id, source_page_id, target_page_id')
      .in('id', ids);

    if (error) return 0;

    let conflictCount = 0;
    existingLinks.forEach(row => {
      if (row.source_page_id !== pageId && row.target_page_id !== pageId) {
        conflicts.push({ table: 'kassia_internal_links', id: row.id, reason: `ID exists but neither source nor target is ${pageId}` });
        conflictCount++;
      }
    });
    return conflictCount;
  };

  const sectionsConflictsCount = await checkConflicts('kassia_page_sections', snapshot.sections);
  const faqsConflictsCount = await checkConflicts('kassia_faqs', snapshot.faqs);
  const galleryConflictsCount = await checkConflicts('kassia_gallery_items', snapshot.gallery);
  const linksConflictsCount = await checkLinksConflicts(snapshot.internal_links);

  const totalConflicts = sectionsConflictsCount + faqsConflictsCount + galleryConflictsCount + linksConflictsCount;

  const diffSummary = {
    targetVersionRead: true,
    snapshotValid: true,
    currentPageLoaded: !!currentPage,
    pageRowWouldRestore: true,
    wouldDelete: {
      sections: currentSections ? currentSections.length : 0,
      faqs: currentFaqs ? currentFaqs.length : 0,
      gallery: currentGallery ? currentGallery.length : 0,
      internal_links: currentLinks ? currentLinks.length : 0
    },
    wouldInsert: {
      sections: snapshot.sections.length,
      faqs: snapshot.faqs.length,
      gallery: snapshot.gallery.length,
      internal_links: snapshot.internal_links.length
    },
    conflictsDetail: conflicts,
    idConflictsDetected: totalConflicts,
    scopedLinksValid: scopedValid
  };

  if (options.dryRun) {
    return { 
      success: true,
      dryRun: true,
      diffSummary
    };
  }

  throw new Error('Real restore is not yet approved or implemented.');
}
