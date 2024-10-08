
# # This file is used to define functions than can be re-used inside the helm templates/chart.
# # In the example below, it can be seen that two keys i.e. product-name and product-number are being referred from eric-product-info.yaml file.
# # The name of the function is "helm-annotations" that can be called from within the chart.
# # Detailed explanation of this file can be found in docs/Helper.md

{{/*
Expand the name of the chart.
*/}}
{{- define "eric-assurance-indexer.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create Ericsson product labels info
*/}}
{{- define "eric-assurance-indexer.labels" -}}
app.kubernetes.io/name: {{ include "eric-assurance-indexer.name" . }}
app.kubernetes.io/version: {{ .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- if .Values.labels }}
  {{ toYaml .Values.labels }}
{{- end}}
{{- end -}}

{{/*
Create Ericsson Product Info
*/}}
{{- define "eric-assurance-indexer.helm-annotations" -}}
ericsson.com/product-name: {{ (fromYaml (.Files.Get "eric-product-info.yaml")).productName | quote }}
ericsson.com/product-number: {{ (fromYaml (.Files.Get "eric-product-info.yaml")).productNumber | quote }}
ericsson.com/product-revision: {{ regexReplaceAll "(.*)[+|-].*" .Chart.Version "${1}" | quote }}
{{- if .Values.annotations }}
  {{ toYaml .Values.annotations }}
{{- end }}
{{- end -}}

{{/*
Create a map from ".Values.global" with defaults if missing in values file.
This hides defaults from values file.
*/}}
{{ define "eric-assurance-indexer.global" }}
  {{- $globalDefaults := dict "security" (dict "tls" (dict "enabled" true)) -}}
  {{- $globalDefaults := merge $globalDefaults (dict "nodeSelector" (dict)) -}}
  {{- $globalDefaults := merge $globalDefaults (dict "registry" (dict "url" "armdocker.rnd.ericsson.se")) -}}
  {{- $globalDefaults := merge $globalDefaults (dict "pullSecret" "") -}}
  {{ if .Values.global }}
    {{- mergeOverwrite $globalDefaults .Values.global | toJson -}}
  {{ else }}
    {{- $globalDefaults | toJson -}}
  {{ end }}
{{ end }}

{{/*
Create release name used for cluster role.
*/}}
{{- define "eric-assurance-indexer.release.name" -}}
{{- default .Release.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
  Create Service Mesh enabling option
*/}}
{{- define "eric-assurance-indexer.service-mesh.enabled" }}
  {{- $globalMeshEnabled := "false" -}}
  {{- if .Values.global -}}
    {{- if .Values.global.serviceMesh -}}
        {{- $globalMeshEnabled = .Values.global.serviceMesh.enabled -}}
    {{- end -}}
  {{- end -}}
  {{- $globalMeshEnabled -}}
{{- end -}}

{{/*
    Create Service Mesh Ingress enabling option
*/}}
{{- define "eric-assurance-indexer.service-mesh-ingress.enabled" -}}
{{ if .Values.global.serviceMesh }}
  {{ if .Values.global.serviceMesh.ingress }}
    {{ if .Values.global.serviceMesh.ingress.enabled }}
      {{- print "true" -}}
    {{ else }}
      {{- print "false" -}}
    {{- end -}}
  {{ else }}
    {{- print "false" -}}
  {{- end -}}
{{ else }}
  {{- print "false" -}}
{{ end }}
{{- end -}}

# Below function is referring to the values.yaml file of this chat. But it is recommended to make changes in the gotmpl files as mentioned in documentation
{{/*
    check global.security.tls.enabled since it is removed from values.yaml
*/}}
{{- define "eric-assurance-indexer.global-security-tls-enabled" -}}
{{- if  .Values.global -}}
  {{- if  .Values.global.security -}}
    {{- if  .Values.global.security.tls -}}
        {{- .Values.global.security.tls.enabled | toString -}}
    {{- else -}}
        {{- "false" -}}
    {{- end -}}
  {{- else -}}
      {{- "false" -}}
  {{- end -}}
{{- else -}}
  {{- "false" -}}
{{- end -}}
{{- end -}}