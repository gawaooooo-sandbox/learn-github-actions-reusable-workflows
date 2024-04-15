# deploy

GitHub Actions で デプロイを行うための再利用可能なワークフロー

<!-- actdocs start -->

## Inputs

| Name | Description | Type | Default | Required |
| :--- | :---------- | :--- | :------ | :------: |
| environment | <pre>Required. Specifies the environment where the deployment will occur, such as 'production' or 'staging'.</pre> | `string` | n/a | yes |
| s3-sync-command | <pre>Required. Defines the command to synchronize build artifacts to an AWS S3 bucket.<br>Include any necessary flags and paths for deployment.<br>Example: "`./dist s3://example-bucket --delete --exclude 'logs/*'`"</pre> | `string` | n/a | yes |
| auto-merge-source-ref | <pre>Optional. The source reference from which to merge into the target branch if auto-merge is enabled.<br>If not specified, the default is the current GitHub reference.</pre> | `string` | `${{ github.ref }}` | no |
| auto-merge-target-branch | <pre>Optional. The target branch into which the source will be merged if auto-merge is enabled.</pre> | `string` | n/a | no |
| build-command | <pre>Optional. Specifies the command to execute for building the project.<br>Adjust according to the scripts defined in your package.json.<br>Default: "generate"<br>Example: "`npm run build` -> `build`"</pre> | `string` | `generate` | no |
| build-environments | <pre>Optional. Sets the environment variables for the build process.<br>Use the format as specified by the setup-environment-variables action.<br>Example: "KEY='value' ANOTHER_KEY='another value'"</pre> | `string` | `` | no |
| checkout-ref | <pre>Optional. Determines the specific reference (such as a branch, tag, or commit SHA) to checkout.<br>Example: "refs/heads/feature-branch"</pre> | `string` | `${{ github.head_ref }}` | no |
| enable-auto-merge | <pre>Optional. Specifies whether to perform an automatic merge before deployment.<br>Default: false</pre> | `boolean` | `false` | no |
| enable-aws-deploy | <pre>Optional. Determines whether to use AWS credentials for deployment.<br>Set to true to perform deployment or false to only print the deployment command.<br>Default: true</pre> | `boolean` | `true` | no |
| node-caching | <pre>Optional. Configures caching for Node.js dependencies.<br>Leave this as the default or set to an empty string to disable caching.<br>Default: "npm"<br>Example: "yarn"</pre> | `string` | `npm` | no |
| node-version | <pre>Optional. Defines the version of Node.js to use.<br>Specify a version number to ensure consistent runtime environments across different executions.<br>Example: "20.x"</pre> | `string` | n/a | no |
| node-version-file | <pre>Optional. Path to a file containing the Node.js version requirement,<br>overriding the 'node-version' input if both are specified.<br>Default: ".nvmrc"<br>Example: "package.json"</pre> | `string` | `.nvmrc` | no |
| npm-install-options | <pre>Optional. Additional command-line options to pass to the `npm ci` command during dependencies installation.<br>Example: "--prefer-offline --no-audit"</pre> | `string` | n/a | no |
| npm-registry-url | <pre>Optional. Sets the npm registry URL, which can be used to define custom registries<br>for npm package installations.<br>Example: "https://npm.pkg.github.com"</pre> | `string` | n/a | no |
| npm-scope | <pre>Optional. Specifies the scope for npm package installations,<br>affecting where packages are searched for and where they are published.<br>Example: "@myorg"</pre> | `string` | n/a | no |
| s3-aws-region | <pre>Optional. Specifies the AWS region for the S3 bucket to ensure correct deployment targeting.<br>Default: "ap-northeast-1"</pre> | `string` | `ap-northeast-1` | no |
| working-directory | <pre>Optional. Specifies the directory where the workflow should execute.<br>Use this to change the default context if your project has a specific structure.<br>Example: "src/app"</pre> | `string` | `.` | no |

## Secrets

| Name | Description | Required |
| :--- | :---------- | :------: |
| aws-role-arn | <pre>Required. Specify the ARN of your AWS Role for this action.<br>It is recommended to manage the ARN value securely using GitHub Secrets.<br>Reference the secret in your workflow by specifying the secret name in the 'aws-role-arn' field.</pre> | yes |
| github-token | <pre>Optional. Specifies the GitHub token to use for the auto merge process.</pre> | no |
| node-auth-token | <pre>Optional. Specifies the authentication token for npm commands.<br>Recommended to use `secrets.GITHUB_TOKEN` for GitHub Packages or `secrets.NPM_AUTH_TOKEN` for private npm registry access.</pre> | no |

## Outputs

| Name | Description |
| :--- | :---------- |
| s3-deploy-command | <pre>The command used to deploy build artifacts to the S3 URI.<br>Primarily used for debugging purposes.</pre> |

## Permissions

N/A

<!-- actdocs end -->


