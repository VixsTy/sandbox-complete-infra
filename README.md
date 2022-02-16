# Infra - GCP - Complete

This repositories will be use to learn things around Creation and Operation of a cluster Kubernetes into Google Cloud Platform

## Getting started

Before starting, you will need to following [pre-requisite](infra/README.md#pre-requisite)

```
# Define the GOOGLE_PROJECT and GOOGLE_APPLICATION_CREDENTIALS environment variable.
Λ\: export GOOGLE_PROJECT=$(gcloud config get-value project)
Λ\: gcloud iam service-accounts keys create terraform-dev.json --iam-account terraform-dev@$GOOGLE_PROJECT.iam.gserviceaccount.com
Λ\: export GOOGLE_APPLICATION_CREDENTIALS=$PWD/terraform-dev.json
# OPTIONAL
Λ\: export GOOGLE_REGION=$(gcloud config get-value compute/region)
Λ\: export GOOGLE_ZONE=$(gcloud config get-value compute/zone)
# deploy infra
Λ\: infra/deploy.sh
```

## TODO

* [x] Automated Kubernetes cluster provisioning on GCP with GKE
* [ ] [Kubeseal](https://github.com/bitnami-labs/sealed-secrets) with GPG out of cluster
* [ ] Deploy [ArgoCD](https://argoproj.github.io/argo-cd/), with static configuration
* [ ] Ingress / Mesh : [Traefik](https://traefik.io/), [Istio](https://istio.io/), [Contour](https://projectcontour.io/)
* [ ] [CertManager](https://cert-manager.io/) & [external-dns](https://github.com/kubernetes-sigs/external-dns)
* [ ] Demo APP Stateless [Docker wordsmith](https://github.com/dockersamples/k8s-wordsmith-demo.git), [Hipster shop](https://github.com/GoogleCloudPlatform/microservices-demo)
* [ ] Monitoring 1 : [Prom](https://prometheus.io/) +  [Grafana](https://grafana.com/) + [Jaeger](https://www.jaegertracing.io/)
* [ ] Monitoring 2 : [Beat agents](https://www.elastic.co/fr/beats/) + [Metrics](https://www.elastic.co/fr/infrastructure-monitoring) More : [Kubernetes monitoring](https://www.elastic.co/fr/what-is/kubernetes-monitoring)
* [ ] [Chaos Mesh](https://chaos-mesh.org/)
* [ ] [Harbor](https://goharbor.io/)
* [ ] [Open Policy Agent](https://www.openpolicyagent.org/) vs [Kyverno](https://kyverno.io/)
* [ ] [Knative](https://knative.dev/)

## Tips Link

* [See the Google Cloud resources Config Connector can manage](https://cloud.google.com/config-connector/docs/reference/overview)
