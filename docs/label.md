---
title: label
layout: default
---

# label
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description
GitHub Actions で ラベルの設定を行うための再利用可能なワークフロー

`actions/labeler` を利用してラベルの設定を行う

{% raw %}

<!-- actdocs start -->

## Inputs

| Name | Description | Type | Default | Required |
| :--- | :---------- | :--- | :------ | :------: |
| configuration-path | Optional. Specifies the path to the label configuration file where label rules are defined.<br>This file determines which labels should be applied based on file paths changed in the pull request.<br>Default: .github/labeler.yml | `string` | `.github/labeler.yml` | no |
| sync-labels | Optional. Controls whether labels should be removed if matching files are reverted or no longer changed by the pull request.<br>Set to true to enable this behavior.<br>Default: true | `boolean` | `true` | no |

<!-- actdocs end -->

{% endraw %}
