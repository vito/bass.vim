" Vim syntax file
" Language:           Bass
" Maintainer:         Alex Suraci <suraci.alex@gmail.com>
" Former Maintainers: Alex Vear <alex@vear.uk>
"                     Sung Pae <self@sungpae.com>
"                     Meikel Brandmeyer <mb@kotka.de>
"                     Toralf Wittner <toralf.wittner@gmail.com>
" Contributors:       Joel Holdbrooks <cjholdbrooks@gmail.com>
" URL:                https://github.com/vito/bass.vim
" License:            Vim (see :h license)
" Last Change:        %%RELEASE_DATE%%

if exists("b:current_syntax")
	finish
endif

let s:cpo_sav = &cpo
set cpo&vim

if has("folding") && exists("g:bass_fold") && g:bass_fold > 0
	setlocal foldmethod=syntax
endif

" NB: generated via 'go run ./gen' and copy-pasted
let s:bass_syntax_keywords = {
		\   'bassVar': ["*dir*","*args*","*stdin*","*stdout*"]
		\ , 'bassBool': ["true","false"]
		\ , 'bassCond': ["case","cond"]
		\ , 'bassConst': ["null","_"]
		\ , 'bassDef': ["def","defop","defn"]
		\ , 'bassFn': ["null?","ignore?","boolean?","number?","string?","symbol?","scope?","sink?","source?","list?","pair?","applicative?","operative?","combiner?","path?","empty?","thunk?","dump","log","logf","now","error","errorf","cons","wrap","unwrap","eval","make-scope","bind","with-meta","meta","+","*","-","max","min","=",">",">=","<","<=","list->source","emit","next","reduce-kv","assoc","symbol->string","string->symbol","str","substring","trim","scope->list","string->fs-path","string->cmd-path","string->dir","merge","path","subpath","name","in-image","in-dir","with-mount","with-args","with-stdin","with-env","with-insecure","wrap-cmd","with-label","thunk-cmd","load","resolve","run","succeeds?","read","list","list*","first","rest","length","second","third","map","map-pairs","apply","id","values","keys","foldr","foldl","append","filter","conj","list->scope","last","take","arg","arg?","insecure!","linux","from","cd","not"]
		\ , 'bassOp': ["op","fn","get-current-scope","quote","let","import","provide","use","or","and","->","$"]
		\ , 'bassRepeat': ["each"]
		\ , 'bassSpecial': ["time","do","doc","if"]
		\ }

function! s:syntax_keyword(dict)
	for key in keys(a:dict)
		execute 'syntax keyword' key join(a:dict[key], ' ')
	endfor
endfunction

if exists('b:bass_syntax_without_core_keywords') && b:bass_syntax_without_core_keywords
	" Only match language specials and primitives
	for s:key in ['bassBool', 'bassConst', 'bassSpecial']
		execute 'syntax keyword' s:key join(s:bass_syntax_keywords[s:key], ' ')
	endfor
else
	call s:syntax_keyword(s:bass_syntax_keywords)
endif

if exists('g:bass_syntax_keywords')
	call s:syntax_keyword(g:bass_syntax_keywords)
endif

if exists('b:bass_syntax_keywords')
	call s:syntax_keyword(b:bass_syntax_keywords)
endif

unlet! s:key
delfunction s:syntax_keyword

syntax match bassKeyword "\v:([a-zA-Z!$&*_+=|<.>?-]+)"

syntax match bassSymbol "\v%([a-zA-Z!$&*_+=|<.>?-]+)"

syntax match bassStringEscape "\v\\%([\\btnfr"]|u\x{4}|[0-3]\o{2}|\o{1,2})" contained

syntax region bassString matchgroup=bassStringDelimiter start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=bassStringEscape,@Spell

" NB. Correct matching of radix literals was removed for better performance.
syntax match bassNumber "\v<[-+]?%(0o?\o+|0x\x+|\d+)>"

syntax match bassVarArg "&"

syntax match bassQuote "\v['`]"
syntax match bassUnquote "\v\~\@?"
syntax match bassMeta "\^"
syntax match bassDeref "@"
syntax match bassDispatch "\v#[\^'=<_]?"

syntax keyword bassCommentTodo contained FIXME XXX TODO BUG NOTE HACK FIXME: XXX: TODO: BUG: NOTE: HACK:

syntax match bassComment ";.*$" contains=bassCommentTodo,@Spell
syntax match bassComment "#!.*$"
syntax match bassComment ","

" -*- TOP CLUSTER -*-
syntax cluster bassTop contains=@Spell,bassBool,bassComment,bassCond,bassConst,bassDef,bassDeref,bassDispatch,bassError,bassFn,bassKeyword,bassOp,bassScope,bassMeta,bassNumber,bassQuote,bassRepeat,bassSexp,bassSpecial,bassString,bassSymbol,bassUnquote,bassVarArg,bassVar,bassCons

syntax region bassSexp   matchgroup=bassParen start="("  end=")" contains=@bassTop fold
syntax region bassCons   matchgroup=bassParen start="\[" end="]" contains=@bassTop fold
syntax region bassScope  matchgroup=bassParen start="{"  end="}" contains=@bassTop fold

" Highlight superfluous closing parens, brackets and braces.
syntax match bassError "]\|}\|)"

syntax sync fromstart

highlight default link bassConst                     Constant
highlight default link bassBool                      Boolean
highlight default link bassKeyword                   Keyword
highlight default link bassNumber                    Number
highlight default link bassString                    String
highlight default link bassStringDelimiter           String
highlight default link bassStringEscape              Character

highlight default link bassVar                       Identifier
highlight default link bassCond                      Conditional
highlight default link bassDef                       Define
highlight default link bassFn                        Function
highlight default link bassOp                        Macro
highlight default link bassRepeat                    Repeat

highlight default link bassSpecial                   Special
highlight default link bassVarArg                    Special
highlight default link bassQuote                     SpecialChar
highlight default link bassUnquote                   SpecialChar
highlight default link bassMeta                      SpecialChar
highlight default link bassDeref                     SpecialChar
highlight default link bassDispatch                  SpecialChar

highlight default link bassComment                   Comment
highlight default link bassCommentTodo               Todo

highlight default link bassError                     Error

highlight default link bassParen                     Delimiter

let b:current_syntax = "bass"

let &cpo = s:cpo_sav
unlet! s:cpo_sav

" vim:sts=2:sw=2:ts=2:noet
