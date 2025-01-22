{{- define "vue-frontend.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end -}}

{{- define "vue-frontend.name" -}}
{{ .Chart.Name }}
{{- end -}}


{{- define "vue-frontend.chart" -}}
{{- end -}}