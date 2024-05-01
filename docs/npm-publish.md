

<!-- actdocs start -->

## Inputs

| Name | Description | Type | Default | Required |
| :--- | :---------- | :--- | :------ | :------: |
| label-name | <pre>バージョンを更新するラベル名<br>release/(patch|minor|major) のいずれかを指定します</pre> | `string` | n/a | yes |
| pr-number | <pre>プルリクエスト番号</pre> | `string` | n/a | yes |
| publish-tag | <pre>npm publish コマンドの --tag オプション。<br>'latest', 'beta', 'alpha', 'next'などがあります。<br>開発中のバージョンをテスト目的で公開する場合は'next'タグが適しています。</pre> | `string` | n/a | yes |
| version-type | <pre>npm version コマンドの引数。<br>'prepatch', 'preminor', 'premajor'などの pre release タイプを指定することを想定。</pre> | `string` | n/a | yes |
| checkout-ref | <pre>チェックアウトするリファレンス</pre> | `string` | `${{ github.head_ref || github.ref }}` | no |
| node-version-file | <pre>Node.jsのバージョンを指定するファイルのパス</pre> | `string` | `.nvmrc` | no |
| npm-install-command | <pre>npm install コマンド</pre> | `string` | `ci` | no |

## Secrets

N/A

## Outputs

N/A

## Permissions

N/A

<!-- actdocs end -->


