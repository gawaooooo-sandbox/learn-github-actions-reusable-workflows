#!/usr/bin/env bash
set -xeu

echo "::group::Collect YAML and Markdown files"

DOC_TYPE=$1

if [ "${DOC_TYPE}" == "workflow" ]; then
  # Find all YAML files in the workflows directory
#   yaml_files="$(find .github/workflows -name '*.yml' -not -path '*internal*')"
  yaml_files=$(find .github/workflows -name '*.yml' -not -path '*internal*' | paste -sd "," -)

  # path/to/file1.yml → docs/file1.md
#   markdown_files="${yaml_files//.github\/workflows\//docs/}"
#   markdown_files="${markdown_files//.yml/.md}"
  markdown_files=$(echo "$yaml_files" | sed 's/.github\/workflows\//docs\//g' | sed 's/.yml/.md/g')

elif [ "${DOC_TYPE}" == "composite" ]; then
  # Find all YAML files in the composite directory
#   yaml_files="$(find composite -name 'action.yml')"
  yaml_files=$(find composite -name 'action.yml' | paste -sd "," -)

  # composite/path/to/file1/action.yml → docs/path/to/file1.md
#   markdown_files="${yaml_files//composite\//docs/}"
#   markdown_files="${markdown_files//\/action.yml/.md}"
  markdown_files=$(echo "$yaml_files" | sed 's/composite\//docs\//g' | sed 's/\/action.yml/.md/g')

else
  echo "::error::Invalid doc-type value '${DOC_TYPE}'. It must be either 'workflow' or 'composite'."
  exit 1
fi

# Output the YAML and Markdown files as JSON arrays
# echo "yaml-files=$(echo "$yaml_files" | jq -Rsc 'split("\n") | map(select(. != ""))')" >> "$GITHUB_OUTPUT"
# echo "markdown-files=$(echo "$markdown_files" | jq -Rsc 'split("\n") | map(select(. != ""))')" >> "$GITHUB_OUTPUT"

echo "yaml-files=$yaml_files" >> "$GITHUB_OUTPUT"
echo "markdown-files=$markdown_files" >> "$GITHUB_OUTPUT"

echo "::endgroup::"