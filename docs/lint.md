---
title: lint
layout: default
---

# lint
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description

GitHub Actions で 静的解析・フォーマットチェック・型チェックを行うための再利用可能なワークフロー

{% raw %}

<!-- actdocs start -->

## Inputs

| Name | Description | Type | Default | Required |
| :--- | :---------- | :--- | :------ | :------: |
| checkout-ref | Optional. Determines the specific reference (such as a branch, tag, or commit SHA) to checkout.<br>Example: "refs/heads/feature-branch" | `string` | `${{ github.head_ref }}` | no |
| enable-format-check | Optional. Enables a format check step within the workflow.<br>Set to true to activate this step.<br>Default: false | `boolean` | `false` | no |
| enable-lint | Optional. Activates the linting step.<br>Set to true to run lint checks.<br>Default: true | `boolean` | `true` | no |
| enable-type-check | Optional. Turns on type checking as part of the workflow.<br>Set to true to enforce type validations.<br>Default: false | `boolean` | `false` | no |
| format-check-script | Optional. The npm script to run for formatting checks.<br>This is only used if 'enable-format-check' is true.<br>Default: "npm run format:check" | `string` | `npm run format:check` | no |
| lint-script | Optional. The npm script to run for linting.<br>This is used if 'enable-lint' is true.<br>Default: "npm run lint" | `string` | `npm run lint` | no |
| node-caching | Optional. Configures caching for Node.js dependencies.<br>Leave this as the default or set to an empty string to disable caching.<br>Default: "npm"<br>Example: "yarn" | `string` | `npm` | no |
| node-version | Optional. Defines the version of Node.js to use.<br>Specify a version number to ensure consistent runtime environments across different executions.<br>Example: "20.x" | `string` | n/a | no |
| node-version-file | Optional. Path to a file containing the Node.js version requirement,<br>overriding the 'node-version' input if both are specified.<br>Default: ".nvmrc"<br>Example: "package.json" | `string` | `.nvmrc` | no |
| npm-install-options | Optional. Additional command-line options to pass to the `npm ci` command during dependencies installation.<br>Example: "--prefer-offline --no-audit" | `string` | n/a | no |
| npm-registry-url | Optional. Sets the npm registry URL, which can be used to define custom registries<br>for npm package installations.<br>Example: "https://npm.pkg.github.com" | `string` | n/a | no |
| npm-scope | Optional. Specifies the scope for npm package installations,<br>affecting where packages are searched for and where they are published.<br>Example: "@myorg" | `string` | n/a | no |
| typecheck-script | Optional. The npm script to run for type checks.<br>This is used if 'enable-type-check' is true.<br>Default: "npm run type-check" | `string` | `npm run type-check` | no |
| working-directory | Optional. Specifies the directory where the workflow should execute.<br>Use this to change the default context if your project has a specific structure.<br>Example: "src/app" | `string` | `.` | no |

## Secrets

| Name | Description | Required |
| :--- | :---------- | :------: |
| node-auth-token | Optional. Authentication token used for npm commands,<br>especially when accessing private packages or registries.<br>Example: Use `secrets.GITHUB_TOKEN` for GitHub Packages or<br>`secrets.NPM_AUTH_TOKEN` for private npm registry access. | no |

<!-- actdocs end -->

{% endraw %}
