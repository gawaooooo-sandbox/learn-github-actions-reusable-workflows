# label

GitHub Actions で ラベルの設定を行うための再利用可能なワークフロー

`actions/labeler` を利用してラベルの設定を行う

<!-- actdocs start -->

## Inputs

| Name               | Description                                                                                                | Type      | Default               | Required |
| :----------------- | :--------------------------------------------------------------------------------------------------------- | :-------- | :-------------------- | :------: |
| configuration-path | <pre>The path to the label configuration file.</pre>                                                       | `string`  | `.github/labeler.yml` |    no    |
| sync-labels        | <pre>Whether or not to remove labels when matching files are reverted or no longer changed by the PR</pre> | `boolean` | `true`                |    no    |

## Secrets

| Name       | Description                                                                              | Required |
| :--------- | :--------------------------------------------------------------------------------------- | :------: |
| repo-token | <pre>Token to use to authorize label changes.<br>Typically the GITHUB_TOKEN secret</pre> |   yes    |

## Outputs

N/A

## Permissions

N/A

<!-- actdocs end -->
