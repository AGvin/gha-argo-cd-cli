# GitHub Actions for Argo CD CLI

- [ArgoCD CLI documentation](https://argo-cd.readthedocs.io/en/stable/user-guide/commands/argocd/)
- [GitHub Action Development](./doc/development/README.md)

## Example of usage

### Get application status

```yaml
- name: Check ArgoCD application status
  uses: AGvin/gha-argo-cd-cli@v1.1
  with:
    server: ${{ secrets.GHA_ARGO_CD_CLI_SERVER }}
    token: ${{ secrets.GHA_ARGO_CD_CLI_TOKEN }}
    app: ${{ vars.GHA_ARGO_CD_CLI_APP }}
    grpc_web: true
    command: "app get"
```

### Sync application

```yaml
- name: Execute sync for ArgoCD application
  uses: AGvin/gha-argo-cd-cli@v1.1
  with:
    server: ${{ secrets.GHA_ARGO_CD_CLI_SERVER }}
    token: ${{ secrets.GHA_ARGO_CD_CLI_TOKEN }}
    app: ${{ vars.GHA_ARGO_CD_CLI_APP }}
    grpc_web: true
    command: "app sync"
    args: "--prune"
```

### Change helm application image parameter

```yaml
- name: Change Helm image parameter
  uses: AGvin/gha-argo-cd-cli@v1.1
  with:
    server: ${{ secrets.GHA_ARGO_CD_CLI_SERVER }}
    token: ${{ secrets.GHA_ARGO_CD_CLI_TOKEN }}
    app: ${{ vars.GHA_ARGO_CD_CLI_APP }}
    grpc_web: true
    command: "app set"
    args: "--parameter spec.image=lmmendes/http-hello-world:1.0"
```
