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
| checkout-ref | Determines the specific reference (such as a branch, tag, or commit SHA) to checkout. | `string` | `${{ github.head_ref }}` | no |
| enable-format-check | Enables a format check step within the workflow.<br>Set to true to activate this step. | `boolean` | `false` | no |
| enable-lint | Activates the linting step.<br>Set to true to run lint checks. | `boolean` | `true` | no |
| enable-type-check | Turns on type checking as part of the workflow.<br>Set to true to enforce type validations. | `boolean` | `false` | no |
| format-check-script | The npm script to run for formatting checks.<br>This is only used if `enable-format-check` is true. | `string` | `npm run format:check` | no |
| lint-script | The npm script to run for linting.<br>This is used if `enable-lint` is true. | `string` | `npm run lint` | no |
| node-caching | Configures caching for Node.js dependencies.<br>Leave this as the default or set to an empty string to disable caching. | `string` | `npm` | no |
| node-version | Defines the version of Node.js to use.<br>Specify a version number to ensure consistent runtime environments across different executions. | `string` | n/a | no |
| node-version-file | Path to a file containing the Node.js version requirement,<br>overriding the 'node-version' input if both are specified. | `string` | `.nvmrc` | no |
| npm-install-options | Additional command-line options to pass to the `npm ci` command during dependencies installation. | `string` | n/a | no |
| npm-registry-url | Sets the npm registry URL, which can be used to define custom registries for npm package installations. | `string` | n/a | no |
| npm-scope | Specifies the scope for npm package installations, affecting where packages are searched for and where they are published. | `string` | n/a | no |
| typecheck-script | The npm script to run for type checks.<br>This is used if `enable-type-check` is true. | `string` | `npm run type-check` | no |
| working-directory | Specifies the directory where the workflow should execute.<br>Use this to change the default context if your project has a specific structure. | `string` | `.` | no |

## Secrets

| Name | Description | Required |
| :--- | :---------- | :------: |
| node-auth-token | Authentication token used for npm commands, especially when accessing private packages or registries. | no |

<!-- actdocs end -->

{% endraw %}
