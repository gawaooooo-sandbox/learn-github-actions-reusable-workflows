# docs-generator

GitHub Actions で ワークフローや action のドキュメントを自動生成するための再利用可能なワークフロー

<!-- actdocs start -->

## Inputs

| Name | Description | Type | Default | Required |
| :--- | :---------- | :--- | :------ | :------: |
| ref | <pre>Required. The git ref (such as a branch, tag, or commit SHA) that the documentation generation should be based on.<br>This ref will be checked out for processing.</pre> | `string` | n/a | yes |
| yaml-file | <pre>Required. Specifies the path to the YAML file of the action or reusable workflow for which the documentation should be generated.</pre> | `string` | n/a | yes |
| markdown-file | <pre>Optional. Specifies the target Markdown file where the generated documentation will be injected.<br>If not specified, 'README.md' is used as default.<br>Default: "README.md"</pre> | `string` | `README.md` | no |

## Secrets

N/A

## Outputs

N/A

## Permissions

N/A

<!-- actdocs end -->

## 参考

-   [actdocs でアクション／Reusable Workflows のドキュメントを自動生成して、GitHub Actions ライフを快適にする](https://zenn.dev/tmknom/articles/actdocs-github-actions)
-   [Composite Action 実践ガイド：GitHub Actions のメンテナンス性を高める技法 Chapter 07 ドキュメンテーション](https://zenn.dev/tmknom/books/pragmatic-composite-action/viewer/docs)
