#!/usr/bin/env bash
set -xeu

echo "::group::Convert <pre> to <code> in Markdown files"

MARKDOWN_FILES=$1

# カンマ区切りの文字列を配列に変換
IFS=',' read -r -a markdown_files <<< "$MARKDOWN_FILES"

for markdown_file in "${markdown_files[@]}"; do
  sed -i 's/<pre>/<code>/g' "$markdown_file"
  sed -i 's#</pre>#</code>#g' "$markdown_file"
done

echo "::endgroup::"
