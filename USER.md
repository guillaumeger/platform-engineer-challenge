# How to use the k8s cluster

1. Request namespace creation
2. Deploy your app
3. ???
4. Profit!

## Namespace creation

- Make a Pull Request on the [values file](./helm/cluster-config/values.yaml)
- It must contain:
  - The name of the namespace
  - The group which will have acces to the namespace
  - The resources (CPU/Memory) limits for the namespace
  - The purpose of the namespace
- Submit the PR and it will be reviewed by a member of the platform team
- Once merged and applied you can use it by setting your context:
  - `kubectl config set-context --cluster=<cluster-name> --namespace=<your-namespace>`

## Access

The group specified in the config file will have read/write access to all the content of the namespace, with the exception of RBAC (permissions) config.

Every user has read access to all namespaces.
