# kubectl-argo-rollouts

[![Preview](https://argoproj.github.io/argo-rollouts/assets/logo.png)](https://argoproj.github.io/)

GitHub Action for interacting with kubectl-argo-rollouts ([argo-rollouts](https://argoproj.github.io/argo-rollouts))

## Usage
To use kubectl-argo-rollouts put this step into your workflow:

### Authorization with config file
```yaml
- uses: starubiquitous/kubectl-argo-rollouts@master
  env:
    KUBE_CONFIG: ${{ secrets.KUBE_CONFIG }}
  with:
    args: get rollout
```

## Environment variables
All these variables need to authorize to kubernetes cluster.  
I recommend using secrets for this.

### KUBECONFIG file
First options its to use [kubeconfig file](https://kubernetes.io/docs/concepts/configuration/organize-cluster-access-kubeconfig/).  

For this method `KUBE_CONFIG` required.  
You can find it: `cat $HOME/.kube/config | base64 `.

Optionally you can switch the [context](https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/) (the cluster) if you have few in kubeconfig file. Passing specific context to `KUBE_CONTEXT`. To see the list of available contexts do: `kubectl config get-contexts`.

| Variable | Type |
| --- | --- |
| KUBE_CONFIG | string (base64) |


## Example
```yaml
name: Get rollout
on: [push]

jobs:
  deploy:
    name: Deploy
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v1
      - uses: starubiquitous/kubectl-argo-rollouts@master
        env:
          KUBE_CONFIG: ${{ secrets.KUBE_CONFIG }}
        with:
          args: get rollout
```


## Versions
If you need a specific version of kubectl, make a PR with a specific version number.
After accepting PR the new release will be created.   
To use a specific version of kubectl use:

```yaml
- uses: starubiquitous/kubectl-argo-rollouts@1
  env:
    KUBE_CONFIG: ${{ secrets.KUBE_CONFIG }}
  with:
    args: get rollout
```

## Licence
[MIT License](https://github.com/starubiquitous//kubectl-argo-rolloutsblob/master/LICENSE)