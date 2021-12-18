# Devops-template

# What is it ?

The purpose of this template is to provide a complete **production-ready** **kubernetes** infrastructure, focused on **automation**, **scalability**, and **monitoring**

It emphasizes on **reproducibility** by describing all the **infrastructure as code**, avoiding any **manual intervention** and reducing **human errors**

> This work is **still in progress** and is subject to many changes

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Getting started

> Coming soon

# Technologies

## Infrastructure

- [Terraform](https://www.terraform.io/) : Infrastructure as code
- [Terraform Cloud](https://www.terraform.io/cloud) : Terraform CD and remote state storage
- [Ansible](https://www.ansible.com/) : Setup automation
- [Vault](https://www.vaultproject.io/) : Secret management
- [Kubernetes](https://kubernetes.io/) : Orchestrator
- [ArgoCD](https://argoproj.github.io/cd/) : K8S CD and cluster management

## Deployment

- [Kubernetes RBAC](https://kubernetes.io/docs/reference/access-authn-authz/rbac/) : Role restrictions
- [Helm](https://helm.sh/) : Kubernetes objects templating
- [Traefik](https://traefik.io/) : Ingress controller and cloud networking
- [Cert manager](https://cert-manager.io/) : SSL certificates management
- [Redis](https://redis.io/) : Data caching
- [PostgreSQL](https://www.postgresql.org/) : Database

## Monitoring

- [Kibana](https://www.elastic.co/fr/kibana/) : Dashboard
- [Elasticsearch](https://www.elastic.co/fr/) : Search engine
- [Logstash](https://www.elastic.co/fr/logstash/) : Log aggregator and data processing
- [Filebeat](https://www.elastic.co/fr/beats/filebeat) : Log shipping
- [Metricbeat](https://www.elastic.co/fr/beats/metricbeat) : Metrics shipping
- [Packetbeat](https://www.elastic.co/fr/beats/packetbeat) : Network data shipping
- [Heartbeat](https://www.elastic.co/fr/beats/heartbeat) : Health check shipping
- [Prisma studio](https://www.prisma.io/studio) : Database visualisation
> and soon alerting !

## Monitoring (alternative)

- [Grafana](https://grafana.com/) : Dashboard
- [Loki](https://grafana.com/oss/loki/) : Logs aggregator
- [Prometheus](https://prometheus.io/) : Metrics aggregator
- [Alert manager](https://prometheus.io/docs/alerting/latest/alertmanager/) : Alerting

...and more

# Documentation

> Coming soon

# How to contribute

1. Fork it (**<https://github.com/LeChatErrant/devops-template/fork>**)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

Issues and comments welcomed ! :wink:

## Contributors

![GitHub Logo](https://github.com/LeChatErrant.png?size=30) &nbsp; **[LeChatErrant](https://github.com/LeChatErrant)** - creator and maintainer
