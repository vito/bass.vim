package main

import (
	"github.com/vito/bass"
)

func lispWords() ([]string, error) {
	scope := bass.NewStandardScope()

	names := []string{}
	_ = scope.Each(func(s bass.Symbol, v bass.Value) error {
		var ann bass.Annotated
		if v.Decode(&ann) != nil {
			return nil
		}

		var indent bool
		if ann.Meta.GetDecode("indent", &indent) != nil {
			return nil
		}

		names = append(names, s.String())

		return nil
	})

	return names, nil
}
