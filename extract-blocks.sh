#!/bin/bash
set -euo pipefail
source .venv/bin/activate
python <<'PY'
import requests
from bs4 import BeautifulSoup
from pathlib import Path

html = requests.get('https://aminrj.com/posts/deploy-n8n-on-kubernetes-with-tf-argocd/', timeout=30).text
soup = BeautifulSoup(html, 'lxml')
blocks = []
for idx, div in enumerate(soup.select('div.highlight'), 1):
    text = div.get_text('\n').strip('\n')
    blocks.append(f'--- BLOCK {idx} ---\n{text}\n')
Path('amine-article-blocks.txt').write_text('\n'.join(blocks))
PY
