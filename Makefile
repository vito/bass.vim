all: syntax/bass.vim ftplugin/bass.vim

syntax/bass.vim: syntax/bass.vim.tmpl gen/main.go
	go run ./gen < $< > $@

ftplugin/bass.vim: ftplugin/bass.vim.tmpl gen/main.go
	go run ./gen < $< > $@
