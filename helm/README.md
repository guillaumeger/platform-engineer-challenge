# Cluster configuration

The `cluster-config` helm chart contains aditionnal configuration for the cluster.

It includes:

- Namespace creation
- RBAC by namespace
- Resource quotas by namespace

A [Makefile](./cluster-config/Makefile) is provided fo easy deployment of the helm chart.

- `make dry-run`: shows a diff of what would be deployed
- `make install`: shows a diff, asks for confirmation and install the chart
- `make delete`: deletes the helm release

The [values file](./cluster-config/values.yaml) contains the specifics for each namespace.

*Note*: Helm will always install namespaces first so you don't need to worry about the order. ([ref](https://helm.sh/docs/intro/using_helm/#helm-install-installing-a-package))
