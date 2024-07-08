# deploy

GitHub Actions で デプロイを行うための再利用可能なワークフロー

<!-- actdocs start -->

## Inputs

| Name | Description | Type | Default | Required |
| :--- | :---------- | :--- | :------ | :------: |
| environment | <code>Required. Specifies the environment where the deployment will occur, such as 'production' or 'staging'.</code> | `string` | n/a | yes |
| s3-sync-command | <code>Required. Defines the command to synchronize build artifacts to an AWS S3 bucket.<br>Include any necessary flags and paths for deployment.<br>Example: "`./dist s3://example-bucket --delete --exclude 'logs/*'`"</code> | `string` | n/a | yes |
| auto-merge-source-ref | <code>Optional. The source reference from which to merge into the target branch if auto-merge is enabled.<br>If not specified, the default is the current GitHub reference.</code> | `string` | `${{ github.head_ref }}` | no |
| auto-merge-target-branch | <code>Optional. Specifies the target branch into which the source will be merged if auto-merge is enabled.<br>When `enable-auto-merge` is enabled, this branch will be used to merge changes and subsequently deploy to the specified environment.</code> | `string` | n/a | no |
| build-command | <code>Optional. Specifies the command to execute for building the project.<br>Adjust according to the scripts defined in your package.json.<br>Default: "generate"<br>Example: "`npm run build` -> `build`"</code> | `string` | `generate` | no |
| build-environments | <code>Optional. Sets the environment variables for the build process.<br>Use the format as specified by the setup-environment-variables action.<br>Example: "KEY='value' ANOTHER_KEY='another value'"</code> | `string` | `` | no |
| checkout-ref | <code>Optional. Determines the specific reference (such as a branch, tag, or commit SHA) to checkout.<br>When `enable-auto-merge` is enabled, this setting is ignored, and `auto-merge-target-branch` is used after the merge.<br>Example: "refs/heads/feature-branch"</code> | `string` | `${{ github.ref }}` | no |
| enable-auto-merge | <code>Optional. Specifies whether to perform an automatic merge before deployment.<br>Default: false</code> | `boolean` | `false` | no |
| enable-aws-deploy | <code>Optional. Determines whether to use AWS credentials for deployment.<br>Set to true to perform deployment or false to only print the deployment command.<br>Default: true</code> | `boolean` | `true` | no |
| node-caching | <code>Optional. Configures caching for Node.js dependencies.<br>Leave this as the default or set to an empty string to disable caching.<br>Default: "npm"<br>Example: "yarn"</code> | `string` | `npm` | no |
| node-version | <code>Optional. Defines the version of Node.js to use.<br>Specify a version number to ensure consistent runtime environments across different executions.<br>Example: "20.x"</code> | `string` | n/a | no |
| node-version-file | <code>Optional. Path to a file containing the Node.js version requirement,<br>overriding the 'node-version' input if both are specified.<br>Default: ".nvmrc"<br>Example: "package.json"</code> | `string` | `.nvmrc` | no |
| npm-install-options | <code>Optional. Additional command-line options to pass to the `npm ci` command during dependencies installation.<br>Example: "--prefer-offline --no-audit"</code> | `string` | n/a | no |
| npm-registry-url | <code>Optional. Sets the npm registry URL, which can be used to define custom registries<br>for npm package installations.<br>Example: "https://npm.pkg.github.com"</code> | `string` | n/a | no |
| npm-scope | <code>Optional. Specifies the scope for npm package installations,<br>affecting where packages are searched for and where they are published.<br>Example: "@myorg"</code> | `string` | n/a | no |
| s3-aws-region | <code>Optional. Specifies the AWS region for the S3 bucket to ensure correct deployment targeting.<br>Default: "ap-northeast-1"</code> | `string` | `ap-northeast-1` | no |
| working-directory | <code>Optional. Specifies the directory where the workflow should execute.<br>Use this to change the default context if your project has a specific structure.<br>Example: "src/app"</code> | `string` | `.` | no |

## Secrets

| Name | Description | Required |
| :--- | :---------- | :------: |
| aws-role-arn | <code>Required. Specify the ARN of your AWS Role for this action.<br>It is recommended to manage the ARN value securely using GitHub Secrets.<br>Reference the secret in your workflow by specifying the secret name in the 'aws-role-arn' field.</code> | yes |
| node-auth-token | <code>Optional. Specifies the authentication token for npm commands.<br>Recommended to use `secrets.GITHUB_TOKEN` for GitHub Packages or `secrets.NPM_AUTH_TOKEN` for private npm registry access.</code> | no |

## Outputs

| Name | Description |
| :--- | :---------- |
| s3-deploy-command | <code>The command used to deploy build artifacts to the S3 URI.<br>Primarily used for debugging purposes.</code> |

<!-- actdocs end -->


