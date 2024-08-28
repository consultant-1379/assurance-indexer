# eric-assurance-indexer

[TOC]

This repo contains the eric-assurance-indexer chart and its associated files. It serves as a template for application developers to follow.
All the files inside the repo are for reference and must be adhered while creating a helm chart.


This is the directory structure of the repo. Below is a description of the contents of each of the upper level directories.

```
assurance-indexer
├── README.md
├── charts
│   └── eric-assurance-indexer
│       ├── Chart.yaml
│       ├── eric-product-info.yaml
│       ├── kubeVersion.yaml
│       ├── optionality.yaml
│       ├── site_values_template.yaml
│       ├── templates
│       │   ├── NOTES.txt
│       │   ├── _helpers.tpl
│       │   ├── configmaps
│       │   │   └── configmap-sample-data.yaml
│       │   ├── hooks
│       │   │   └── hook-sleep.yaml
│       │   ├── ingresses
│       │   │   ├── eric-samplehost-gateway.yaml
│       │   │   ├── eric-samplehost-ingress-iccr.yaml
│       │   │   └── eric-samplehost-virtualservice.yaml
│       │   ├── mesh-resources
│       │   │   └── eric-sm-gas-destinationrule.yaml
│       │   ├── network-policy
│       │   │   ├── eric-default-deny-ingress.yaml
│       │   │   └── eric-pm-server-policy.yaml
│       │   ├── rolebindings
│       │   │   └── role-binding.yaml
│       │   ├── roles
│       │   │   └── role.yaml
│       │   ├── secrets
│       │   │   └── eric-oss-admin-user-secret.yaml
│       │   └── service-accounts
│       │       └── service-account.yaml
│       ├── values.schema.json
│       └── values.yaml
├── ci
│   ├── kubernetes_range_checkers
│   │   ├── deprek8ion.sh
│   │   ├── generate_helm_templates_for_supported_k8s.sh
│   │   ├── kubeval.sh
│   │   └── print_supported_k8s_versions.sh
│   ├── precode.Jenkinsfile
│   └── ruleset2.0.yaml
├── common-properties.yaml
├── contribution.md
├── docs
│   ├── Chart-Hooks.md
│   ├── ConfigMap.md
│   ├── Gateway.md
│   ├── Helpers.md
│   ├── Ingress-Controller.md
│   ├── Network-Policy.md
│   ├── Secret.md
│   ├── Service-Account.md
│   ├── Values_Schema.md
│   ├── Virtual-Service.md
│   ├── chassis-chart.md
│   ├── csar-build.md
│   ├── developer_guide.md
│   ├── eric-product-info.md
│   ├── images
│   │   ├── Ingress.png
│   │   ├── Istio-gateway-traffice.png
│   │   ├── maven-archetype-example.png
│   │   ├── maven-help.png
│   │   └── site_values.png
│   ├── maven-archtype.md
│   ├── optionality.md
│   ├── role-binding.md
│   ├── role.md
│   ├── service-mesh.md
│   ├── site_values.md
│   └── test-suite.md
└── testsuite
    └── helm-chart-validator
        └── site_values_template.yaml
```

>* Note: Please fill out the information down below relevant to your application

This directory contains the eric-assurance-indexer Chart.
See the [Chart documentation](docs/chassis-chart.md) for more details

This directory contains all the documentation describing this repository.

This directory contains the tests created for the OSS Integration chart
See the [OSS Integration chart chassis docs](docs/test-suite.md) for more details.

The details regarding creating a maven archetype project can be found in the [archetype documentation](docs/maven-archtype.md).

Send questions to SubZero-Application-Engineering-Team
[Subzero - General](https://teams.microsoft.com/l/team/19%3aU8EuRwhdzSfSiRKb9uVPYR9Zmx7wAqvBD5zOR2nSV4o1%40thread.tacv2/conversations?groupId=2f7ef799-f4d3-499c-863e-6e4c6d117380&tenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f)
Create new issue on IDUN component and IDUN Team Name as SubZero: Story

We are an inner source project and welcome contributions. See our
[Contributing Guide](contribution.md) for details.


See in [Contributing Guide](contribution.md)

Create a new issue on SubZero-Application-Engineering-Team component:

Report [Support/Bug](https://jira-oss.seli.wh.rnd.internal.ericsson.com/browse/IDUN-40095)

See in [Contributing Guide](contribution.md) for further details

Support is available on our Teams channel:

- Send questions via
[Subzero - General](https://teams.microsoft.com/l/team/19%3aU8EuRwhdzSfSiRKb9uVPYR9Zmx7wAqvBD5zOR2nSV4o1%40thread.tacv2/conversations?groupId=2f7ef799-f4d3-499c-863e-6e4c6d117380&tenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f)
Microsoft Teams channel