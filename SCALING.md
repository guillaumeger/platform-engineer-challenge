# Scaling

## Assumptions

- We want all the clusters to de identical in terms of infra/configuration
- All the configured contexts in the kubeconfig file will be used for infra deployment

## Deployment

- The [cluster-config](./helm/cluster-config/) chart will be deployed on all configured clusters in the kubeconfig file
- A specific kubeconfig file can be passed to the script as an argument

### Usage

`./multi-deploy.sh [install|dry-run (default dry-run)] [kubeconfig path (default ~/.kube/config)]`

## Next steps

- Run the script with `dry-run` on a schedule and send the diff so any potential drift can be catched
- Implement a gitops tool such as [argocd](https://argoproj.github.io/cd/) to automatically apply changes from the repo
