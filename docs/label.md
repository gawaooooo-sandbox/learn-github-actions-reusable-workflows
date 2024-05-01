# label

GitHub Actions で ラベルの設定を行うための再利用可能なワークフロー

`actions/labeler` を利用してラベルの設定を行う

<!-- actdocs start -->

## Inputs

| Name | Description | Type | Default | Required |
| :--- | :---------- | :--- | :------ | :------: |
| configuration-path | <pre>Optional. Specifies the path to the label configuration file where label rules are defined.<br>This file determines which labels should be applied based on file paths changed in the pull request.<br>Default: .github/labeler.yml</pre> | `string` | `.github/labeler.yml` | no |
| sync-labels | <pre>Optional. Controls whether labels should be removed if matching files are reverted or no longer changed by the pull request.<br>Set to true to enable this behavior.<br>Default: true</pre> | `boolean` | `true` | no |

## Secrets

N/A

## Outputs

N/A

## Permissions

N/A

<!-- actdocs end -->


