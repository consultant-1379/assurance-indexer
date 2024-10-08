# Role binding File

[TOC]


The document briefly covers the use of a Rolebinding within the Helm Template.

A rolebinding grants the permissions defined in a role to a user or set of users.
There must be one role and one subject (e.g. service-account) present before creating rolebindings.
It assigns roles to subject for the specified objects.

> **Note:** To learn more about the use of Rolebindings, please refer to the following [Kubernetes Documentation](https://kubernetes.io/docs/reference/access-authn-authz/rbac/#rolebinding-and-clusterrolebinding)


```
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: {{ template "eric-assurance-indexer.name" . }}-gas-patcher-namespaced-binding
  labels:
    {{- include "eric-assurance-indexer.labels" .| nindent 4 }}
  annotations:
    {{- include "eric-assurance-indexer.helm-annotations" .| nindent 4 }}
roleRef:
  kind: Role
  name: {{ template "eric-assurance-indexer.release.name" . }}-gas-patcher-policy
  apiGroup: rbac.authorization.k8s.io
subjects:
  - kind: ServiceAccount
    name: {{ template "eric-assurance-indexer.name" . }}-gas-patcher-sa
```


In the example above, we can see a list of parameters that are needed when creating a Secret file:

| Parameter   | Description                                                                                                                                    |
|-------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| apiVersion  | What version of the Kubernetes API you're using to create the Object                                                                           |
| kind        | Which kind of object you want to create.                                                                                                       |
| metadata    | Data that helps uniquely identify the object (Could include name, UID, namespace, labels, annotations etc.)                                    |
| roleRef     | It has mainly 3 keys. kind: The cluster role. name: Name of the cluster role. apigroup: The name of group of api that cluster role belongs to. |
| subjects    | It has 2 keys. kind: Service account. name: Name of the service account                                                                        |


It's a pre-requisite that there must be one service-account and one role present before creating role-binding.
For e.g.
**service-account name:** eric-assurance-indexer-chassis-sa
**role name:** eric-assurance-indexer-role
**rolebinding name:** eric-assurance-indexer-binding

We will now bind service-account with the role using rolebinding.

```
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: eric-assurance-indexer-binding
  labels:
    app: eric-assurance-indexer
roleRef:
  kind: Role
  name: eric-assurance-indexer-role
  apiGroup: rbac.authorization.k8s.io
subjects:
  - kind: ServiceAccount
    name: eric-assurance-indexer-sa
```


All available list of API groups can be found in [Kubernetes documentation](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.24/#-strong-api-groups-strong-).
