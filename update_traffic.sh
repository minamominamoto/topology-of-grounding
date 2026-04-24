#!/usr/bin/env bash
# update_traffic.sh
# GitHub Traffic API からクローン数・ビュー数を取得して index.html を更新する

set -euo pipefail

REPO="minamominamoto/topology-of-grounding"
TOKEN="${GITHUB_TOKEN:-}"
INDEX="$(dirname "$0")/index.html"

if [[ -z "${TOKEN}" ]]; then
  echo "エラー：GITHUB_TOKEN が設定されていません" >&2
  exit 1
fi

if [[ ! -f "${INDEX}" ]]; then
  echo "エラー：index.html が見つかりません: ${INDEX}" >&2
  exit 1
fi

# クローン数取得
CLONES_JSON=$(curl -sf \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "Accept: application/vnd.github+json" \
  "https://api.github.com/repos/${REPO}/traffic/clones")

CLONES=$(echo "${CLONES_JSON}" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['count'])")
UNIQUE=$(echo "${CLONES_JSON}" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['uniques'])")

# ビュー数取得
VIEWS_JSON=$(curl -sf \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "Accept: application/vnd.github+json" \
  "https://api.github.com/repos/${REPO}/traffic/views")

VIEWS=$(echo "${VIEWS_JSON}" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d['count'])")

echo "Clones: ${CLONES}, Unique: ${UNIQUE}, Views: ${VIEWS}"

# index.html の stat-val を置換
# <span class="stat-val" id="clones">...</span>
sed -i.bak \
  -e "s|<span class=\"stat-val\" id=\"clones\">[^<]*</span>|<span class=\"stat-val\" id=\"clones\">${CLONES}</span>|" \
  -e "s|<span class=\"stat-val\" id=\"unique\">[^<]*</span>|<span class=\"stat-val\" id=\"unique\">${UNIQUE}</span>|" \
  -e "s|<span class=\"stat-val\" id=\"views\">[^<]*</span>|<span class=\"stat-val\" id=\"views\">${VIEWS}</span>|" \
  "${INDEX}"

rm -f "${INDEX}.bak"

echo "index.html を更新しました"

# commit & push
cd "$(dirname "$0")"
git add index.html
git commit -m "chore: update traffic stats (clones=${CLONES}, unique=${UNIQUE}, views=${VIEWS})"
git push
