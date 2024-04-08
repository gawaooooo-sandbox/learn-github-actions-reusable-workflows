# reusable-deploy

GitHub Actions で デプロイを行うための再利用可能なワークフロー

<!-- actdocs start -->

## Inputs

| Name | Description | Type | Default | Required |
| :--- | :---------- | :--- | :------ | :------: |
| environment | <pre>Required input to set the environment to deploy.</pre> | `string` | n/a | yes |
| s3-uri | <pre>Required input to set the S3 URI to deploy the build artifacts.</pre> | `string` | n/a | yes |
| build-command | <pre>Optional input to set the build command to run.<br>`npm run build` -> `build`<br>`npm run generate` -> `generate` (default)</pre> | `string` | `generate` | no |
| build-environments | <pre>Optional input to set the environment variables to set for the build command.<br>This needs to be specified in JSON string format.<br>e.g. `'{"BASE_URL": "https://example.com"}'`</pre> | `string` | `{}` | no |
| checkout-ref | <pre>Optional input to set the ref to checkout.<br>The input syntax corresponds to the actions/checkout's one.</pre> | `string` | `${{ github.head_ref }}` | no |
| dist-dir | <pre>Optional input to set the directory to deploy.</pre> | `string` | `./dist` | no |
| node-caching | <pre>Optional input to set up caching for the setup-node action.<br>The input syntax corresponds to the setup-node's one.<br>Set to an empty string if caching isn't needed.</pre> | `string` | `npm` | no |
| node-version | <pre>Optional input to set the version of Node.js used to build the project.<br>The input syntax corresponds to the setup-node's one.</pre> | `string` | n/a | no |
| node-version-file | <pre>Optional input to set the file that contains the version of Node.js used to build the project.<br>The input syntax corresponds to the setup-node's one.</pre> | `string` | `.nvmrc` | no |
| npm-install-options | <pre>Optional input to set the options to pass to the `npm ci` command.</pre> | `string` | n/a | no |
| npm-registry-url | <pre>Optional input to set the registry URL to use for the npm commands.<br>The input syntax corresponds to the setup-node's one.<br>When using GitHub Packages, specify `https://npm.pkg.github.com`</pre> | `string` | n/a | no |
| npm-scope | <pre>Optional input to set the scope to use for the npm commands.<br>The input syntax corresponds to the setup-node's one.<br>`hoge package` -> `@hoge`<br>GitHub Packages -> `@owner` (use `github.repository_owner`)</pre> | `string` | n/a | no |
| s3-aws-region | <pre>Optional input to set the AWS region to deploy the build artifacts.</pre> | `string` | `ap-northeast-1` | no |
| s3-sync-options | <pre>Optional input to set the options to pass to the `aws s3 sync` command.<br>e.g. `-delete --exclude "hoge/*"`</pre> | `string` | n/a | no |
| use-aws | <pre>Optional input to set whether to use AWS credentials for the deployment and the command to deploy the build artifacts to the S3 URI.<br>`true` -> use AWS credentials and deploy the build artifacts to the S3 URI<br>`false` -> print the command to deploy the build artifacts to the S3 URI<br>**Note**: When using `false`, the deployment won't be executed.</pre> | `boolean` | `true` | no |
| working-directory | <pre>Optional input to set the working directory.</pre> | `string` | `.` | no |

## Secrets

| Name | Description | Required |
| :--- | :---------- | :------: |
| aws-role-arn | <pre>Required secret to set the AWS IAM Role ARN to assume for the deployment.</pre> | yes |
| node-auth-token | <pre>Optional secret to set the authentication token to use for the npm commands.<br>The input syntax corresponds to the setup-node's one.<br>When using GitHub Packages, specify `secrets.GITHUB_TOKEN`<br>When using npm, specify `secrets.NPM_AUTH_TOKEN`</pre> | no |

## Outputs

| Name | Description |
| :--- | :---------- |
| s3-deploy-command | <pre>The command to deploy the build artifacts to the S3 URI.</pre> |

## Permissions

N/A

<!-- actdocs end -->


