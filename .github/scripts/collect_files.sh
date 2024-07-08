#!/usr/bin/env bash
set -xeu

echo "::group::Collect YAML and Markdown files"

DOC_TYPE=$1

if [ "${DOC_TYPE}" == "workflow" ]; then
  # Find all YAML files in the workflows directory
  yaml_files=$(find .github/workflows -name '*.yml' -not -path '*internal*' | jq -R . | jq -s .)
#   yaml_files="$(find .github/workflows -name '*.yml' -not -path '*internal*')"

  # path/to/file1.yml → docs/file1.md
#   markdown_files="${yaml_files//.github\/workflows\//docs/}"
#   markdown_files="${markdown_files//.yml/.md}"
  markdown_files=$(echo "$yaml_files" | jq -r 'map(gsub(".github/workflows/"; "docs/") | gsub(".yml"; ".md"))')

elif [ "${DOC_TYPE}" == "composite" ]; then
  # Find all YAML files in the composite directory
#   yaml_files="$(find composite -name 'action.yml')"
  yaml_files=$(find composite -name 'action.yml' | jq -R . | jq -s .)

  # composite/path/to/file1/action.yml → docs/path/to/file1.md
#   markdown_files="${yaml_files//composite\//docs/}"
#   markdown_files="${markdown_files//\/action.yml/.md}"
  markdown_files=$(echo "$yaml_files" | jq -r 'map(gsub("composite/"; "docs/") | gsub("/action.yml"; ".md"))')

else
  echo "::error::Invalid doc-type value '${DOC_TYPE}'. It must be either 'workflow' or 'composite'."
  exit 1
fi

# Output the YAML and Markdown files as JSON arrays
# echo "yaml-files=$(echo "$yaml_files" | jq -Rsc 'split("\n") | map(select(. != ""))')" >> "$GITHUB_OUTPUT"
# echo "markdown-files=$(echo "$markdown_files" | jq -Rsc 'split("\n") | map(select(. != ""))')" >> "$GITHUB_OUTPUT"

# Remove newlines and output as single line
yaml_files_single_line=$(echo "$yaml_files" | jq -c .)
markdown_files_single_line=$(echo "$markdown_files" | jq -c .)

echo "yaml-files=$yaml_files_single_line" >> "$GITHUB_OUTPUT"
echo "markdown-files=$markdown_files_single_line" >> "$GITHUB_OUTPUT"

echo "::endgroup::"
