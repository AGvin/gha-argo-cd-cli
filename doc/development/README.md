# Development

## Local execution

To execute GHA locally needs to install [act](https://nektosact.com/)

### Installation

Installation [instructions](https://nektosact.com/installation/index.html).

#### Installation Windows

- Run PowerShell as Administrator.
- Execute installation

```powershell
choco install act-cli
```

#### Download ubuntu-latest image

To avoid first execution long "freeze" need to download ubuntu-latest image to Your local docker registry.

```shell
docker pull catthehacker/ubuntu:full-latest
```

Custom image

```bash
act --platform ubuntu-latest
```

#### Build Dockerimage

Here is example how to build with multiple images tags

```shell
docker build -t AGvin/gha-argo-cd-cli:latest -t AGvin/gha-argo-cd-cli:v0.0.0 .
```

### Secrets and Vars usage

https://nektosact.com/usage/index.html#secrets
https://nektosact.com/usage/index.html#vars

#### Examples

`my.secrets`:

```env
GHA_ARGO_CD_CLI_SERVER="cd.argo.example.com"
GHA_ARGO_CD_CLI_TOKEN="token-value-here"
```

`my.variables`:

```env
GHA_ARGO_CD_CLI_APP=echo
```

where:

- `echo` - application name in Argo CD

### Execution

```sh
act workflow_dispatch --var-file my.variables --secret-file my.secrets -W '.github/workflows/test-local.yml'
```

#### Options

Runners (Runner images):
`--platform ubuntu-latest` or `-P ubuntu-latest` - [docs](https://nektosact.com/usage/runners.html)

Using local runner images:
`--pull=false` or `--action-offline-mode` - [docs](https://nektosact.com/usage/runners.html#using-local-runner-images)

## Other docs

- A collection of `.gitignore` templates: https://github.com/github/gitignore
- GitHub Actions
  - [GitHub Actions Branding Cheat Sheet](https://haya14busa.github.io/github-action-brandings/)
  - [Creating a Docker container action](https://docs.github.com/en/actions/sharing-automations/creating-actions/creating-a-docker-container-action)
