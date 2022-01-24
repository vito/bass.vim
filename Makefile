all: syntax/bass.vim ftplugin/bass.vim

syntax/bass.vim: syntax/bass.vim.tmpl
	go run ./gen < $< > $@

ftplugin/bass.vim: ftplugin/bass.vim.tmpl
	go run ./gen < $< > $@
