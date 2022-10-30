{{ if 1 }}
{{ $w := "world" }}
{{ else }}
{{ $w := "earth" }}
{{ end }}

Hello, {{ print $w }}!
Goodbye, {{ print $w }}.