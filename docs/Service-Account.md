# Service Account File

[TOC]


The document briefly covers the use of a Service Accounts within the Helm Template.
Processes in containers in Pods that contact the apiServer are authenticated through the use of a Service Account.

The API permissions of the service account depend on the authorization plugin and policy in use.

> **Note:** To learn more about the use of Service Accounts, please refer to the following [Kubernetes Documentation](https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/)



```
apiVersion: v1
kind: ServiceAccount
metadata:
  name: {{ template "eric-assurance-indexer.name" . }}-sa
  labels:
    {{- include "eric-assurance-indexer.labels" .| nindent 4 }}
  annotations:
    {{- include "eric-assurance-indexer.helm-annotations" .| nindent 4 }}
automountServiceAccountToken: false
```


In the example above, we can see a list of parameters that are needed when creating a Secret file:

|Parameter|Description|Default|
|----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
|apiVersion|What version of the Kubernetes API you're using to create the Object|v1|
|kind|Which kind of object you want to create.|Secret|
|metadata|Data that helps uniquely identify the object (Could include name, UID, namespace, labels, annotations etc.)|Attributes of chart are used in: name, labels, annotations (app,chart,release,heritage)|
|automountServiceAccountToken|Allows you to opt in/out of auto-mounting API credentials for a Service Account|false|


Service accounts can be used in deployments, pods and rolebindings OR external applications (like jenkins, prometheus) to access the containers in the application.
Let's consider we create service account named "eric-assurance-indexer-sa".

```
apiVersion: v1
kind: ServiceAccount
metadata:
  name: eric-assurance-indexer-sa
  labels:
    app: eric-assurance-indexer
automountServiceAccountToken: false
```

The above service account will automatically create secrets that contain the token for accessing the application.
