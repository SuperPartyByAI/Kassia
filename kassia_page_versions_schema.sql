CREATE TABLE public.kassia_page_versions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    page_id UUID NOT NULL REFERENCES public.kassia_pages(id) ON DELETE CASCADE,
    page_slug TEXT NOT NULL,
    version_number INTEGER NOT NULL,
    snapshot JSONB NOT NULL,
    change_source TEXT NOT NULL,
    change_note TEXT,
    created_by TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT uq_kassia_page_version UNIQUE (page_id, version_number)
);

CREATE INDEX idx_kassia_versions_page_id ON public.kassia_page_versions(page_id);
CREATE INDEX idx_kassia_versions_page_slug ON public.kassia_page_versions(page_slug);
CREATE INDEX idx_kassia_versions_created_at ON public.kassia_page_versions(created_at DESC);
