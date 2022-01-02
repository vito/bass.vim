" Vim filetype plugin file
" Language:           Bass
" Maintainer:         Alex Suraci <suraci.alex@gmail.com>
" Former Maintainers: Alex Vear <alex@vear.uk>
"                     Sung Pae <self@sungpae.com>
"                     Meikel Brandmeyer <mb@kotka.de>
" URL:                https://github.com/vito/bass.vim
" License:            Vim (see :h license)
" Last Change:        %%RELEASE_DATE%%

if exists("b:did_ftplugin")
	finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

let b:undo_ftplugin = 'setlocal iskeyword< define< formatoptions< comments< commentstring< lispwords<'

setlocal iskeyword+=?,-,*,!,+,=,<,>,.,$,%,&,\|

" There will be false positives, but this is better than missing the whole set
" of user-defined def* definitions.
setlocal define=\\v\(def(ault)@!\S*

" Remove 't' from 'formatoptions' to avoid auto-wrapping code.
setlocal formatoptions-=t

" Lisp comments are routinely nested (e.g. ;;; SECTION HEADING)
setlocal comments=n:;
setlocal commentstring=;\ %s

" Specially indented symbols from Bass stdlib
"
" Bass forms are indented in the defn style when they:
"
"   * Define vars and anonymous functions
"   * Create new lexical scopes or scopes with altered environments
"   * Create conditional branches from a predicate function or value
"
" The arglists for these functions are generally in the form of [x & body];
" Functions that accept a flat list of forms do not treat the first argument
" specially and hence are not indented specially.
"
" NB: generated via 'go run ./gen -lispwords' and copy-pasted
setlocal lispwords=op,if,defop,fn,defn,let,provide,cond,case,from,cd

" Skip brackets in ignored syntax regions when using the % command
if exists('loaded_matchit')
	let b:match_words = &matchpairs
	let b:match_skip = 's:comment\|string\|regex\|character'
	let b:undo_ftplugin .= ' | unlet! b:match_words b:match_skip'
endif

" Filter files in the browse dialog
if (has("gui_win32") || has("gui_gtk")) && !exists("b:browsefilter")
	let b:browsefilter = "Bass Source Files (*.bass)\t*.bass\n" .
	                   \ "All Files (*.*)\t*.*\n"
	let b:undo_ftplugin .= ' | unlet! b:browsefilter'
endif

let &cpo = s:cpo_save

unlet! s:cpo_save s:setting s:dir

" vim:sts=2:sw=2:ts=2:noet
