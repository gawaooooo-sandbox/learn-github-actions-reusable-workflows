# docs-generator

GitHub Actions で ワークフローや action のドキュメントを自動生成するための再利用可能なワークフロー

<!-- actdocs start -->

## Inputs

| Name | Description | Type | Default | Required |
| :--- | :---------- | :--- | :------ | :------: |
| commit-message | Provide a commit message that describes the documentation updates. | `string` | n/a | yes |
| doc-type | Type of documentation to generate: workflow or composite. | `string` | `workflow` | no |
| ref | The git ref to check out for documentation generation. | `string` | n/a | no |
| remove-pre-tags | Remove  tags from the generated Markdown files. | `boolean` | `true` | no |

## Outputs

| Name | Description |
| :--- | :---------- |
| branch | Name of the pushed branch. |

<!-- actdocs end -->

## 参考

-   [actdocs でアクション／Reusable Workflows のドキュメントを自動生成して、GitHub Actions ライフを快適にする](https://zenn.dev/tmknom/articles/actdocs-github-actions)
-   [Composite Action 実践ガイド：GitHub Actions のメンテナンス性を高める技法 Chapter 07 ドキュメンテーション](https://zenn.dev/tmknom/books/pragmatic-composite-action/viewer/docs)
