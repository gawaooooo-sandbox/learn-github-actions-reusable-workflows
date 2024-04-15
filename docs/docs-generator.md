# docs-generator

GitHub Actions で ワークフローや action のドキュメントを自動生成するための再利用可能なワークフロー

<!-- actdocs start -->

## Inputs

| Name | Description | Type | Default | Required |
| :--- | :---------- | :--- | :------ | :------: |
| commit-message | <pre>The commit message.</pre> | `string` | n/a | yes |
| markdown-files | <pre>A JSON array of Markdown file paths where documentation should be injected.</pre> | `string` | n/a | yes |
| yaml-files | <pre>A JSON array of YAML file paths for documentation generation.</pre> | `string` | n/a | yes |

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
