# Ops

> Kubectl cheat sheet

Everybody have the right to have a little help...

## Auto complete

#### Bash

Add autocomplete permanently to your bash shell

```bash
echo "source <(kubectl completion bash)" >> ~/.bashrc
```

#### Zsh

Add autocomplete permanently to your zsh shell

```bash
echo "[[ $commands[kubectl] ]] && source <(kubectl completion zsh)" >> ~/.zshrc
```

## Shortcut

Add this to your bashrc to have a shortcut to  `kubectl` on `k`

```bash
alias k=kubectl
complete -F __start_kubectl k
```

## Change kubectl config

```bash
export KUBECONFIG=~/ops/my_cluster/kubeconfig
```

## Commands

### Basics

List resources in default namespace

```bash
k get all
```

List resources in all namespaces

```bash
k get all --all-namespaces
```

List resources in a specific namespace

```bash
k get all -n kube-system
```

List specific resource

```bash
k get [RESOURCE] # Example: k get pods
```

List a particular resource

```bash
k get [RESOURCE] [NAME] # Example: k get pods backend
k get [RESOURCE]/[NAME] # Example: k get pods/backend
```

> Every time, you can choose between using [RESOURCE] [NAME] of [RESOURCE]/[NAME]
>
> [RESOURCE] [NAME] is specially usefull to provide auto completion on specific resource (eg: type `k get pods` and press tab to see available pods)
>
> [RESOURCE]/[NAME] is specially usefull after listing because outputs will already be of form [RESOURCE]/[NAME] (for example, after `k get all` you would like to read logs of your crashed pod, you would type `k logs` and paste the pod name)

Describe a particular resource (provide a lot of useful infos)

```bash
k describe [RESOURCE] [NAME] # Example: k describe nodes worker-1
```

Get logs of a pod

```bash
k logs my-pod
```

Get logs of specific container in pod (multi container case)

```bash
k logs my-pod -c my-container
```

Execute command in pod

```bash
k exec my-pod -- ls -la
```

Execute command in specific container in pod (multi container case)

```bash
k exec my-pod -c my-container -- ls -la
```

Open interactive shell in pod

```bash
k exec my-pod -it -- sh
```

Get events

```bash
k get events
```

Proxy

```
k proxy
```

### Nodes

Check nodes IP

```
k get nodes -o wide
```

### Labels

Label resource

```bash
k label pods my-pod app=backend
```

Unlabel resource

```bash
k label pods my-pod app-
```

Filter with labels

```bash
k get pods -l app=backend
```

Filter resources which HAVE the label

```bash
k get pods -l app
```

### Port forwarding

Access service locally

```
k port-forward service/traefik-dashboard-service :8080
```

Access pod locally

```
k port-forward pods/redis-master-765d459796-258hz :6379
```

### Yaml files

Deploy kubernetes object stored in yaml file

```bash
k apply -f filename
```

Deploy all kubernetes objects stored in directory

```bash
k apply -f directory
```

Redeploy a changed kubernetes object that has been already deployed

```bash
k apply -f filename
```

Delete a kubernetes object

```bash
k delete -f filename
```

Compare cluster state with file state
```bash
k diff -f filename
```

### Output formating

Additional informations

```bash
k get nodes -o wide
```

Format output as yaml

```bash
k get service kubernetes -o yaml
```

Format output as json

```bash
k get service kubernetes -o json
```

Format output

```bash
# Here, we only retrieve node's internal ip
k get nodes -o jsonpath='{ $.items[*].status.addresses[?(@.type=="InternalIP")].address }'
```

### Metrics

If you have metrics-server installed on your cluster (example in [02_monitoring/](https://github.com/LeChatErrant/ops/tree/master/02_monitoring)), you can retrieve pods / nodes metrics

All nodes metrics

```bash
k top nodes
```

Specific node metrics

```bash
k top nodes my-node
```

All pods metrics

```bash
k top pods --containers
```

Specific pod metrics

```bash
k top pods my-pod --containers
```

### Contributors

![GitHub Logo](https://github.com/LeChatErrant.png?size=30) &nbsp; [LeChatErrant](https://github.com/LeChatErrant) - creator and maintainer
