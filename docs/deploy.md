---
title: deploy
layout: default
---

# deploy
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description
GitHub Actions で デプロイを行うための再利用可能なワークフロー

{% raw %}

<!-- actdocs start -->

## Inputs

| Name | Description | Type | Default | Required |
| :--- | :---------- | :--- | :------ | :------: |
| environment | Specifies the environment where the deployment will occur, such as `production` or `staging`. | `string` | n/a | yes |
| s3-sync-command | Defines the command to synchronize build artifacts to an AWS S3 bucket.<br>Include any necessary flags and paths for deployment.<br><br>Example: `"./dist s3://example-bucket --delete --exclude 'logs/*'"` | `string` | n/a | yes |
| auto-merge-source-ref | The source reference from which to merge into the target branch if auto-merge is enabled.<br>If not specified, the default is the current GitHub reference. | `string` | `${{ github.head_ref }}` | no |
| auto-merge-target-branch | Specifies the target branch into which the source will be merged if auto-merge is enabled.<br>When `enable-auto-merge` is enabled, this branch will be used to merge changes and subsequently deploy to the specified environment. | `string` | n/a | no |
| build-command | Specifies the command to execute for building the project.<br>Adjust according to the scripts defined in your `package.json`. | `string` | `generate` | no |
| build-environments | Sets the environment variables for the build process.<br>Use the format as specified by the `setup-environment-variables` action.<br><br>Example: `"KEY='value' ANOTHER_KEY='another value'"` | `string` | `` | no |
| checkout-ref | Determines the specific reference (such as a branch, tag, or commit SHA) to checkout.<br>When `enable-auto-merge` is enabled, this setting is ignored, and `auto-merge-target-branch` is used after the merge. | `string` | `${{ github.ref }}` | no |
| enable-auto-merge | Specifies whether to perform an automatic merge before deployment. | `boolean` | `false` | no |
| enable-aws-deploy | Determines whether to use AWS credentials for deployment.<br>Set to true to perform deployment or false to only print the deployment command. | `boolean` | `true` | no |
| node-caching | Configures caching for Node.js dependencies.<br>Leave this as the default or set to an empty string to disable caching. | `string` | `npm` | no |
| node-version | Defines the version of Node.js to use.<br>Specify a version number to ensure consistent runtime environments across different executions. | `string` | n/a | no |
| node-version-file | Path to a file containing the Node.js version requirement,<br>overriding the 'node-version' input if both are specified. | `string` | `.nvmrc` | no |
| npm-install-options | Additional command-line options to pass to the `npm ci` command during dependencies installation.<br><br>Example: `"--prefer-offline --no-audit"` | `string` | n/a | no |
| npm-registry-url | Sets the npm registry URL, which can be used to define custom registries for npm package installations.<br><br>Example: `"https://npm.pkg.github.com"` | `string` | n/a | no |
| npm-scope | Specifies the scope for npm package installations, affecting where packages are searched for and where they are published.<br><br>Example: `"@myorg"` | `string` | n/a | no |
| s3-aws-region | Specifies the AWS region for the S3 bucket to ensure correct deployment targeting. | `string` | `ap-northeast-1` | no |
| working-directory | Specifies the directory where the workflow should execute.<br>Use this to change the default context if your project has a specific structure.<br><br>Example: `"src/app"` | `string` | `.` | no |

## Secrets

| Name | Description | Required |
| :--- | :---------- | :------: |
| aws-role-arn | Specify the ARN of your AWS Role for this action.<br>It is recommended to manage the ARN value securely using GitHub Secrets.<br>Reference the secret in your workflow by specifying the secret name in the `aws-role-arn` field. | yes |
| node-auth-token | Specifies the authentication token for npm commands.<br>Recommended to use `secrets.GITHUB_TOKEN` for GitHub Packages or `secrets.NPM_AUTH_TOKEN` for private npm registry access. | no |

## Outputs

| Name | Description |
| :--- | :---------- |
| s3-deploy-command | The command used to deploy build artifacts to the S3 URI.<br>Primarily used for debugging purposes. |

<!-- actdocs end -->

{% endraw %}
