# Productionize the cluster

For having a robust k8s offering that is ready for production, a couple of enhancements need to be made:

- Security:
  - Network policies: ideally, no communication should happens between namespaces, except when microservices need to talk to each other. In that case **all** communication should be made within the cluster. Network policies should be evaluated on a per-namespace basis, defaulting to deny all.
  - Secret management: secrets need to be stored in a encrypted secret store, such as [Hashicorp Vault](https://www.vaultproject.io/) or cloud providers secret stores. Integration with k8s can be done with [external-secrets](https://external-secrets.io/latest/)
  - Policies: policies need to be implemented in order to ensure that workloads follow security standards.
- Reliability:
  - For providing reliability, the control-plane and the workloads need to be decoupled. Having dedicated nodes for the control-plane and `etcd` will prevent workload impact if the control-plane becomes non-responsive.
  - Control-plane need to run on a odd number of nodes for maximum fault-tolerance
- Observability: A central observability solution is essential for a production setup. Metrics and logs should be considered first, traces later on.
- Disaster recovery:
  - Having a redundent cluster ready to replace a failed cluster. Gitops can help keeping cluster configuration in sync.
  - Backing up `etcd` either using `etcdctl` on a schedule to create a snapshot, or having a scheduled storage snapshot.
  - Having an automated process to restore `etcd` backup that is tested regularly.
  - Use a 3rd party solution like [velero](https://velero.io/).
- Performance:
  - Consider re-evaluating the instance types for worker nodes to maximize performance/cost ration. Also, creating different nodegroups for different types of workloads (CPU bound, memory bound, IO, etc) can optimize performance.
  - Ensure that workloads have resources limits/requests, that can be done with admission controller.

## Next steps

- Deploy [Hashicorp Vault](https://www.vaultproject.io/) and [external-secrets](https://external-secrets.io/latest/) for secret management.
- Deploy [Kyverno](https://kyverno.io/) for policies
- Ensure that the control-plane have a separate nodegroup and runs on a odd number of nodes.
- Deploy the observability stack:
  - [prometheus-operator](https://github.com/prometheus-operator/prometheus-operator) for metrics and alerting
  - [Loki](https://grafana.com/oss/loki/) for log aggregation
  - A log forwarder such as [fluentbit](https://fluentbit.io/) for sending logs to Loki
  - [Grafana](https://grafana.com/oss/grafana/) for visualisation
- Write alerting rules for infrastructure alerts (ressources, cluster components, etc)
- Create dashboards for visualisation
- Deploy [argocd](https://argoproj.github.io/cd/) to implement gitops
