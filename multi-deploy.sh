#! /bin/bash

set -e

action=${1:-dry-run}
kubeconfig=${2:-~/.kube/config}
makePath=./helm/cluster-config

cd $makePath || exit 1
for c in $(kubectl config get-contexts -o name --kubeconfig="$kubeconfig"); do
  kubectl config use-context "$c" --kubeconfig="$kubeconfig"
  echo "-------------------------"
  echo "Running on context $c..."
  echo "-------------------------"
  make "$action"
done
