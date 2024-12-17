# Local kubernetes cluster setup

## Prerequisites

- This guide assumes that you are running on Linux or Mac OS
- [docker](https://docs.docker.com/desktop/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/#kubectl)

## Install minikube

- Follow the [instructions](https://minikube.sigs.k8s.io/docs/start) for your platform
- Run `minikube start` to spin off a local cluster

## Validation

- You should see the following message if bootstrap was successful:
  ```Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default```
- Run `minikube status`:

  ```bash
  minikube
  type: Control Plane
  host: Running
  kubelet: Running
  apiserver: Running
  kubeconfig: Configured
  ```

- Check the nodes: `kubectl get nodes`

  ```bash
  NAME       STATUS   ROLES           AGE   VERSION
  minikube   Ready    control-plane   12m   v1.31.0
  ```

- Check the control plane pods: `kubectl get pods -n kube-system`

  ```bash
  NAME                               READY   STATUS    RESTARTS        AGE
  coredns-6f6b679f8f-7t5k5           1/1     Running   1 (14m ago)     17m
  etcd-minikube                      1/1     Running   1 (14m ago)     17m
  kube-apiserver-minikube            1/1     Running   1 (14m ago)     17m
  kube-controller-manager-minikube   1/1     Running   1 (14m ago)     17m
  kube-proxy-c94kj                   1/1     Running   1 (14m ago)     17m
  kube-scheduler-minikube            1/1     Running   1 (14m ago)     17m
  storage-provisioner                1/1     Running   2 (7m45s ago)   17m
  ```

## Troubleshooting

- Look at the logs by running `minikube logs`
- Check that the minikube container is running: `docker ps`:
- Check the `kubelet` unit status in the container: `docker exec minikube systemctl status kubelet`
- Refer to [this page](https://minikube.sigs.k8s.io/docs/handbook/troubleshooting/) for more
