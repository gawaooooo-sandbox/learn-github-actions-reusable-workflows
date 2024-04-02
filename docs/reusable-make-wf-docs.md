# reusable-make-wf-docs

GitHub Actions で ワークフローや action のドキュメントを自動生成するための再利用可能なワークフロー

<!-- actdocs start -->

## Inputs

| Name | Description | Type | Default | Required |
| :--- | :---------- | :--- | :------ | :------: |
| ref | The git ref | `string` | n/a | yes |
| yaml-file | The YAML file for the action or the reusable workflow | `string` | n/a | yes |
| markdown-file | The Markdown file for the injection target | `string` | `README.md` | no |

## Secrets

N/A

## Outputs

N/A

## Permissions

| Scope | Access |
| :--- | :---- |
| contents | write |

<!-- actdocs end -->

## 参考

-   [actdocs でアクション／Reusable Workflows のドキュメントを自動生成して、GitHub Actions ライフを快適にする](https://zenn.dev/tmknom/articles/actdocs-github-actions)
-   [Composite Action 実践ガイド：GitHub Actions のメンテナンス性を高める技法 Chapter 07 ドキュメンテーション](https://zenn.dev/tmknom/books/pragmatic-composite-action/viewer/docs)
