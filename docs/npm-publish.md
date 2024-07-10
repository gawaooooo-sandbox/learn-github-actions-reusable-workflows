---
title: npm-publish
layout: default
---

# npm-publish
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Description
GitHub Packages publish workflow

{% raw %}

<!-- actdocs start -->

## Inputs

| Name | Description | Type | Default | Required |
| :--- | :---------- | :--- | :------ | :------: |
| label-name | バージョンを更新するラベル名<br>release/(patch|minor|major) のいずれかを指定します | `string` | n/a | yes |
| pr-number | プルリクエスト番号 | `string` | n/a | yes |
| publish-tag | npm publish コマンドの --tag オプション。<br>'latest', 'beta', 'alpha', 'next'などがあります。<br>開発中のバージョンをテスト目的で公開する場合は'next'タグが適しています。 | `string` | n/a | yes |
| version-type | npm version コマンドの引数。<br>'prepatch', 'preminor', 'premajor'などの pre release タイプを指定することを想定。 | `string` | n/a | yes |
| checkout-ref | チェックアウトするリファレンス | `string` | `${{ github.head_ref || github.ref }}` | no |
| node-version-file | Node.jsのバージョンを指定するファイルのパス | `string` | `.nvmrc` | no |
| npm-install-command | npm install コマンド | `string` | `ci` | no |

<!-- actdocs end -->

{% endraw %}
