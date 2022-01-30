targets=syntax/bass.vim ftplugin/bass.vim

all: $(targets)

syntax/bass.vim: syntax/bass.vim.tmpl gen/main.go
	go run ./gen < $< > $@

ftplugin/bass.vim: ftplugin/bass.vim.tmpl gen/main.go
	go run ./gen < $< > $@

clean:
	rm -f $(targets)
