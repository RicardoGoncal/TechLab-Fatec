{{- define "backend-poke.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end -}}

{{- define "backend-poke.name" -}}
{{ .Chart.Name }}
{{- end -}}


{{- define "backend-poke.chart" -}}
{{- end -}}