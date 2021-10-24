package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"os"

	"github.com/vito/bass"
)

func main() {
	if len(os.Args) == 1 {
		cs, err := allClasses()
		if err != nil {
			fmt.Fprintf(os.Stderr, "error: %s\n", err)
			os.Exit(1)
		}

		fmt.Fprintln(os.Stdout, formatClasses(cs))
		return
	}

	class := os.Args[1]

	names, err := classBindings(class)
	if err != nil {
		fmt.Fprintf(os.Stderr, "error: %s\n", err)
		os.Exit(1)
	}

	fmt.Fprintln(os.Stdout, formatList(names))
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

func formatClasses(cs classes) string {
	buf := new(bytes.Buffer)

	fmt.Fprintln(buf, "{")

	i := 0
	for class, names := range cs {
		if i == 0 {
			fmt.Fprintf(buf, "\t\t\\   '%s': %s", class, formatList(names))
		} else {
			fmt.Fprintf(buf, "\t\t\\ , '%s': %s", class, formatList(names))
		}

		i++
	}

	fmt.Fprintln(buf, "\t\t\\ }")

	return buf.String()
}
