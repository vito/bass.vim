package main

import (
	"fmt"
	"strings"

	"github.com/vito/bass"
)

type classes map[string][]bass.Symbol

var staticClasses = classes{
	"bassBool":   {"true", "false"},
	"bassConst":  {"null", "_"},
	"bassCond":   {"case", "cond"},
	"bassRepeat": {"each"},
	"bassVar":    {"*dir*", "*args*", "*stdin*", "*stdout*"},
}

type classifyFunc func(bass.Symbol, bass.Value) bool

var dynamicClasses = map[string]classifyFunc{
	"bassDef": func(s bass.Symbol, _ bass.Value) bool {
		return !isStatic(s) && isDefine(s)
	},
	"bassFn": func(s bass.Symbol, v bass.Value) bool {
		return !isStatic(s) && bass.IsApplicative(v)
	},
	"bassOp": func(s bass.Symbol, v bass.Value) bool {
		// must not include builtin ops so that bassSpecial takes precedence
		var op *bass.Operative
		return !isStatic(s) && !isDefine(s) && v.Decode(&op) == nil
	},
	"bassSpecial": func(s bass.Symbol, v bass.Value) bool {
		var builtin *bass.Builtin
		return !isStatic(s) && v.Decode(&builtin) == nil
	},
}

var classNames []string

func init() {
	for class := range staticClasses {
		classNames = append(classNames, class)
	}

	for class := range dynamicClasses {
		classNames = append(classNames, class)
	}
}

func isDefine(s bass.Symbol) bool {
	return strings.HasPrefix(s.String(), "def")
}

func isStatic(s bass.Symbol) bool {
	for _, names := range staticClasses {
		for _, n := range names {
			if n == s {
				return true
			}
		}
	}

	return false
}

func classBindings(class string) ([]bass.Symbol, error) {
	if names, found := staticClasses[class]; found {
		return names, nil
	}

	scope := bass.NewStandardScope()

	fn, found := dynamicClasses[class]
	if !found {
		return nil, fmt.Errorf("unknown class: %s (need one of %s)", class, strings.Join(classNames, ", "))
	}

	names := []bass.Symbol{}
	_ = scope.Each(func(s bass.Symbol, v bass.Value) error {
		if fn(s, v) {
			names = append(names, s)
		}

		return nil
	})

	return names, nil
}

func allClasses() (classes, error) {
	cs := classes{}

	for class, names := range staticClasses {
		cs[class] = names
	}

	for class := range dynamicClasses {
		names, err := classBindings(class)
		if err != nil {
			return nil, fmt.Errorf("bindings for %s: %w", class, err)
		}

		cs[class] = names
	}

	return cs, nil
}
