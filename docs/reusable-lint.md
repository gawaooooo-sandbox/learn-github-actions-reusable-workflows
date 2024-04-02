# reusable-lint

GitHub Actions で 静的解析・フォーマットチェック・型チェックを行うための再利用可能なワークフロー

<!-- actdocs start -->

## Inputs

| Name | Description | Type | Default | Required |
| :--- | :---------- | :--- | :------ | :------: |
| checkout-ref | <pre>Optional input to set the ref to checkout.<br>The input syntax corresponds to the actions/checkout's one.</pre> | `string` | `${{ github.head_ref }}` | no |
| enable-format-check | <pre>Optional input to enable the format check.</pre> | `boolean` | `false` | no |
| enable-lint | <pre>Optional input to enable the lint.</pre> | `boolean` | `true` | no |
| enable-type-check | <pre>Optional input to enable the type check.</pre> | `boolean` | `false` | no |
| format-check-script | <pre>Optional input to set the script to run the format check.</pre> | `string` | `npm run format:check` | no |
| install-options | <pre>Optional input to set the options to pass to the `npm ci` command.</pre> | `string` | n/a | no |
| lint-script | <pre>Optional input to set the script to run the lint.</pre> | `string` | `npm run lint` | no |
| node-caching | <pre>Optional input to set up caching for the setup-node action.<br>The input syntax corresponds to the setup-node's one.<br>Set to an empty string if caching isn't needed.</pre> | `string` | `npm` | no |
| node-version | <pre>Optional input to set the version of Node.js used to build the project.<br>The input syntax corresponds to the setup-node's one.</pre> | `string` | n/a | no |
| node-version-file | <pre>Optional input to set the file that contains the version of Node.js used to build the project.<br>The input syntax corresponds to the setup-node's one.</pre> | `string` | `.nvmrc` | no |
| typecheck-script | <pre>Optional input to set the script to run the type check.</pre> | `string` | `npm run type-check` | no |

## Secrets

N/A

## Outputs

N/A

## Permissions

N/A

<!-- actdocs end -->


