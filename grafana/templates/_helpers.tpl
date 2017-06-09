{{define "fullname"}}
{{- $name := default "grafana" .Values.nameOverride -}}
{{printf "%s-%s" .Release.Name $name | trunc 63 -}}
{{end}}
