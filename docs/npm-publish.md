

<!-- actdocs start -->

## Inputs

| Name | Description | Type | Default | Required |
| :--- | :---------- | :--- | :------ | :------: |
| label-name | <code>バージョンを更新するラベル名<br>release/(patch|minor|major) のいずれかを指定します</code> | `string` | n/a | yes |
| pr-number | <code>プルリクエスト番号</code> | `string` | n/a | yes |
| publish-tag | <code>npm publish コマンドの --tag オプション。<br>'latest', 'beta', 'alpha', 'next'などがあります。<br>開発中のバージョンをテスト目的で公開する場合は'next'タグが適しています。</code> | `string` | n/a | yes |
| version-type | <code>npm version コマンドの引数。<br>'prepatch', 'preminor', 'premajor'などの pre release タイプを指定することを想定。</code> | `string` | n/a | yes |
| checkout-ref | <code>チェックアウトするリファレンス</code> | `string` | `${{ github.head_ref || github.ref }}` | no |
| node-version-file | <code>Node.jsのバージョンを指定するファイルのパス</code> | `string` | `.nvmrc` | no |
| npm-install-command | <code>npm install コマンド</code> | `string` | `ci` | no |

<!-- actdocs end -->


