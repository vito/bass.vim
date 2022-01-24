package main

import (
	"bytes"
	"encoding/json"
	"io"
	"log"
	"os"
	"strings"
	"text/template"

	"github.com/vito/bass/pkg/bass"
	"github.com/vito/bass/pkg/hl"
)

type BassHL struct {
	LispWords []bass.Symbol
	Classes   []hl.Classification
}

func main() {
	scope := bass.NewStandardScope()

	content, err := io.ReadAll(os.Stdin)
	if err != nil {
		log.Fatalf("read template: %s", err)
	}

	tmpl, err := template.New("stdin").Funcs(template.FuncMap{
		"list":   formatList,
		"commas": commaList,
	}).Parse(string(content))
	if err != nil {
		log.Fatalf("parse template: %s", err)
	}

	err = tmpl.Execute(os.Stdout, BassHL{
		LispWords: hl.LispWords(scope),
		Classes:   hl.Classify(scope),
	})
	if err != nil {
		log.Fatalf("execute template: %s", err)
	}
}

func formatList(names []bass.Symbol) string {
	buf := new(bytes.Buffer)

	// JSON is a good enough approximation for a Vim list since these should all
	// be simple strings
	enc := json.NewEncoder(buf)
	enc.SetEscapeHTML(false) // don't escape names like ->
	enc.Encode(names)

	return buf.String()
}

func commaList(names []bass.Symbol) string {
	strs := make([]string, len(names))
	for i := range names {
		strs[i] = string(names[i])
	}

	return strings.Join(strs, ",")
}
