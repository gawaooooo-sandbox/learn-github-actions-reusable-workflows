# docs-generator

GitHub Actions で ワークフローや action のドキュメントを自動生成するための再利用可能なワークフロー

<!-- actdocs start -->

## Inputs

| Name | Description | Type | Default | Required |
| :--- | :---------- | :--- | :------ | :------: |
| commit-message | <pre>Provide a commit message that describes the documentation updates.</pre> | `string` | n/a | yes |
| doc-type | <pre>Type of documentation to generate: workflow or composite.</pre> | `string` | `workflow` | no |
| ref | <pre>The git ref to check out for documentation generation.</pre> | `string` | n/a | no |

## Secrets

N/A

## Outputs

| Name | Description |
| :--- | :---------- |
| branch | Name of the pushed branch. |

## Permissions

N/A

<!-- actdocs end -->

## 参考

-   [actdocs でアクション／Reusable Workflows のドキュメントを自動生成して、GitHub Actions ライフを快適にする](https://zenn.dev/tmknom/articles/actdocs-github-actions)
-   [Composite Action 実践ガイド：GitHub Actions のメンテナンス性を高める技法 Chapter 07 ドキュメンテーション](https://zenn.dev/tmknom/books/pragmatic-composite-action/viewer/docs)
