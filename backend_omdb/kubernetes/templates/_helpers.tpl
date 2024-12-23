{{- define "backend-omdb.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end -}}

{{- define "backend-omdb.name" -}}
{{ .Chart.Name }}
{{- end -}}


{{- define "backend-omdb.chart" -}}
{{- end -}}