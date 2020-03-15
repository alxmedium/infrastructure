# Infrastructure

IaC of the alxmedium project.

[![CircleCI](https://circleci.com/gh/alxmedium/infrastructure/tree/master.svg?style=svg)](https://circleci.com/gh/alxmedium/infrastructure/tree/master)

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Enable conection with the Cluster](#enable-conection-with-the-cluster)
- [Futher Reading](#futher-reading)
- [Contributing](#contributing)
- [License](#license)

## Requirements

- [Terraform](https://www.terraform.io/downloads.html) >= _v0.12.19_
- [aws-iam-authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html) >= _v0.5.0_

## Installation

1. Clone the repository.

```sh
git clone git@github.com:alxmedium/infrastructure.git
```

2. Init the terraform project.

```sh
terraform init
```

## Usage

### Format the Terraform file

```sh
terraform fmt
```

### Show the Terraform Plan

```sh
terraform plan
```

### Apply the Terraform Plan

```sh
terraform apply
```

## Enable conection with the Cluster

1. Set the value of the `ip_connection_machine` variable with `YOUR.IP.ADRESS.HERE/32`

2. Update your `kubeconfig` file with the following:

**Note**: I use a multi-cluster configuration you can use another one.

- Add a Cluster

```yml

clusters:
- cluster:
    certificate-authority-data: YOUR-CERTIFICATE
    server: YOUR-SERVER-URL
  name: alxmedium_eks_cluster

```

- Add a Context

```yml

contexts:
- context:
    cluster: alxmedium_eks_cluster
    user: user@alxmedium_eks_cluster
  name: context@alxmedium_eks_cluster

```

- Add an User

```yml

users:
- name: user@alxmedium_eks_cluster
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      args:
      - token
      - -i
      - alxmedium_eks_cluster
      command: aws-iam-authenticator
      env:
      - name: AWS_STS_REGIONAL_ENDPOINTS
        value: regional
      - name: AWS_DEFAULT_REGION
        value: us-east-1
      - name: AWS_PROFILE
        value: YOUR-AWS-PROFILE-NAME

```

## Futher Reading

- [Multi-Cluster Configuration: Configure Access to Multiple Clusters](https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/)

## Contributing

Please check the the [CONTRIBUTING](https://github.com/alxmedium/alxmedium/blob/master/CONTRIBUTING.md) guide before to:

- Open an issue to _Report a Bug_ or _Request a New Feature_
- Make a new _Pull Request_

## License

**alxmedium** is licensed under [Apache License, Version 2.0](https://github.com/alxmedium/alxmedium/blob/master/LICENSE).
