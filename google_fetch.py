import urllib.request
import urllib.parse
from bs4 import BeautifulSoup
import time

queries = [
    "animatori copii Voluntari",
    "animatori petreceri copii Voluntari",
    "animatori copii Pipera"
]

headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36'
}

for query in queries:
    print(f"\n--- QUERY: {query} ---")
    url = f"https://www.google.ro/search?q={urllib.parse.quote(query)}&gl=ro&hl=ro&num=15"
    try:
        req = urllib.request.Request(url, headers=headers)
        html = urllib.request.urlopen(req).read().decode('utf-8')
        soup = BeautifulSoup(html, 'html.parser')
        
        results = soup.select('div.g')
        for idx, result in enumerate(results[:10]):
            a_tag = result.select_one('a')
            if a_tag and a_tag.has_attr('href'):
                href = a_tag['href']
                title_tag = result.select_one('h3')
                title = title_tag.text if title_tag else "No title"
                snippet_tag = result.select_one('div[style="-webkit-line-clamp:2"]') or result.select_one('.VwiC3b')
                snippet = snippet_tag.text if snippet_tag else "No snippet"
                print(f"[{idx+1}] TITLE: {title}\n    URL: {href}\n    SNIPPET: {snippet}\n")
    except Exception as e:
        print(f"Error fetching {query}: {e}")
    time.sleep(2)
