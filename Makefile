targets=syntax/bass.vim ftplugin/bass.vim

.PHONY: all syntax/bass.vim ftplugin/bass.vim

all: $(targets)

syntax/bass.vim: syntax/bass.vim.tmpl gen/main.go go.mod go.sum
	go run ./gen < $< > $@

ftplugin/bass.vim: ftplugin/bass.vim.tmpl gen/main.go go.mod go.sum
	go run ./gen < $< > $@

clean:
	rm -f $(targets)
