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

" -*- KEYWORDS -*-
" TODO: generate
let s:bass_syntax_keywords = {
    \   'bassBoolean': ["false","true"]
    \ , 'bassCond': ["case","cond","cond","cond->","cond->>","condp","if-let","if-not","if-some","when","when-first","when-let","when-not","when-some"]
    \ , 'bassConstant': ["nil"]
    \ , 'bassDefine': ["definline","definterface","defmacro","defmethod","defmulti","defn","defn-","defonce","defprotocol","defrecord","defstruct","deftype"]
    \ , 'bassException': ["catch","finally","throw","try"]
    \ , 'bassFunc': ["*","*'","+","+'","-","-'","->ArrayChunk","->Eduction","->Vec","->VecNode","->VecSeq","-cache-protocol-fn","-reset-methods","/","<","<=","=","==",">",">=","PrintWriter-on","StackTraceElement->vec","Throwable->map","accessor","aclone","add-classpath","add-tap","add-watch","agent","agent-error","agent-errors","aget","alength","alias","all-ns","alter","alter-meta!","alter-var-root","ancestors","any?","apply","array-map","aset","aset-boolean","aset-byte","aset-char","aset-double","aset-float","aset-int","aset-long","aset-short","assoc","assoc!","assoc-in","associative?","atom","await","await-for","await1","bases","bean","bigdec","bigint","biginteger","bit-and","bit-and-not","bit-clear","bit-flip","bit-not","bit-or","bit-set","bit-shift-left","bit-shift-right","bit-test","bit-xor","boolean","boolean-array","boolean?","booleans","bound-fn*","bound?","bounded-count","butlast","byte","byte-array","bytes","bytes?","case-fallthrough-err-impl","cast","cat","char","char-array","char?","chars","chunk","chunk-append","chunk-buffer","chunk-cons","chunk-first","chunk-next","chunk-rest","chunked-seq?","class","class?","clear-agent-errors","coll?","commute","comp","comparator","compare","compare-and-set!","compile","complement","completing","concat","conj","conj!","cons","constantly","construct-proxy","contains?","count","counted?","create-ns","create-struct","cycle","dec","dec'","decimal?","dedupe","delay?","deliver","denominator","deref","derive","descendants","destructure","disj","disj!","dissoc","dissoc!","distinct","distinct?","doall","dorun","double","double-array","double?","doubles","drop","drop-last","drop-while","eduction","empty","empty?","ensure","ensure-reduced","enumeration-seq","error-handler","error-mode","eval","even?","every-pred","every?","ex-cause","ex-data","ex-info","ex-message","extend","extenders","extends?","false?","ffirst","file-seq","filter","filterv","find","find-keyword","find-ns","find-protocol-impl","find-protocol-method","find-var","first","flatten","float","float-array","float?","floats","flush","fn?","fnext","fnil","force","format","frequencies","future-call","future-cancel","future-cancelled?","future-done?","future?","gensym","get","get-in","get-method","get-proxy-class","get-thread-bindings","get-validator","group-by","halt-when","hash","hash-combine","hash-map","hash-ordered-coll","hash-set","hash-unordered-coll","ident?","identical?","identity","ifn?","in-ns","inc","inc'","indexed?","init-proxy","inst-ms","inst-ms*","inst?","instance?","int","int-array","int?","integer?","interleave","intern","interpose","into","into-array","ints","isa?","iterate","iterator-seq","juxt","keep","keep-indexed","key","keys","keyword","keyword?","last","line-seq","list","list*","list?","load","load-file","load-reader","load-string","loaded-libs","long","long-array","longs","macroexpand","macroexpand-1","make-array","make-hierarchy","map","map-entry?","map-indexed","map?","mapcat","mapv","max","max-key","memoize","merge","merge-with","meta","method-sig","methods","min","min-key","mix-collection-hash","mod","munge","name","namespace","namespace-munge","nat-int?","neg-int?","neg?","newline","next","nfirst","nil?","nnext","not","not-any?","not-empty","not-every?","not=","ns-aliases","ns-imports","ns-interns","ns-map","ns-name","ns-publics","ns-refers","ns-resolve","ns-unalias","ns-unmap","nth","nthnext","nthrest","num","number?","numerator","object-array","odd?","parents","partial","partition","partition-all","partition-by","pcalls","peek","persistent!","pmap","pop","pop!","pop-thread-bindings","pos-int?","pos?","pr","pr-str","prefer-method","prefers","print","print-ctor","print-dup","print-method","print-simple","print-str","printf","println","println-str","prn","prn-str","promise","proxy-call-with-super","proxy-mappings","proxy-name","push-thread-bindings","qualified-ident?","qualified-keyword?","qualified-symbol?","quot","rand","rand-int","rand-nth","random-sample","range","ratio?","rational?","rationalize","re-find","re-groups","re-matcher","re-matches","re-pattern","re-seq","read","read+string","read-line","read-string","reader-conditional","reader-conditional?","realized?","record?","reduce","reduce-kv","reduced","reduced?","reductions","ref","ref-history-count","ref-max-history","ref-min-history","ref-set","refer","release-pending-sends","rem","remove","remove-all-methods","remove-method","remove-ns","remove-tap","remove-watch","repeat","repeatedly","replace","replicate","require","requiring-resolve","reset!","reset-meta!","reset-vals!","resolve","rest","restart-agent","resultset-seq","reverse","reversible?","rseq","rsubseq","run!","satisfies?","second","select-keys","send","send-off","send-via","seq","seq?","seqable?","seque","sequence","sequential?","set","set-agent-send-executor!","set-agent-send-off-executor!","set-error-handler!","set-error-mode!","set-validator!","set?","short","short-array","shorts","shuffle","shutdown-agents","simple-ident?","simple-keyword?","simple-symbol?","slurp","some","some-fn","some?","sort","sort-by","sorted-map","sorted-map-by","sorted-set","sorted-set-by","sorted?","special-symbol?","spit","split-at","split-with","str","string?","struct","struct-map","subs","subseq","subvec","supers","swap!","swap-vals!","symbol","symbol?","tagged-literal","tagged-literal?","take","take-last","take-nth","take-while","tap>","test","the-ns","thread-bound?","to-array","to-array-2d","trampoline","transduce","transient","tree-seq","true?","type","unchecked-add","unchecked-add-int","unchecked-byte","unchecked-char","unchecked-dec","unchecked-dec-int","unchecked-divide-int","unchecked-double","unchecked-float","unchecked-inc","unchecked-inc-int","unchecked-int","unchecked-long","unchecked-multiply","unchecked-multiply-int","unchecked-negate","unchecked-negate-int","unchecked-remainder-int","unchecked-short","unchecked-subtract","unchecked-subtract-int","underive","unreduced","unsigned-bit-shift-right","update","update-in","update-proxy","uri?","use","uuid?","val","vals","var-get","var-set","var?","vary-meta","vec","vector","vector-of","vector?","volatile!","volatile?","vreset!","with-bindings*","with-meta","with-redefs-fn","xml-seq","zero?","zipmap"]
    \ , 'bassMacro': ["->","->>","..","amap","and","areduce","as->","assert","binding","bound-fn","comment","declare","delay","dosync","doto","extend-protocol","extend-type","for","future","gen-class","gen-interface","import","io!","lazy-cat","lazy-seq","letfn","locking","memfn","ns","or","proxy","proxy-super","pvalues","reify","some->","some->>","sync","time","vswap!","with-bindings","with-in-str","with-loading-context","with-local-vars","with-open","with-out-str","with-precision","with-redefs"]
    \ , 'bassRepeat': ["doseq","dotimes","while"]
    \ , 'bassSpecial': [".","def","do","fn","if","let","loop","monitor-enter","monitor-exit","new","quote","recur","set!","var"]
    \ , 'bassVariable': ["*1","*2","*3","*agent*","*allow-unresolved-vars*","*assert*","*bass-version*","*command-line-args*","*compile-files*","*compile-path*","*compiler-options*","*data-readers*","*default-data-reader-fn*","*e","*err*","*file*","*flush-on-newline*","*fn-loader*","*in*","*math-context*","*ns*","*out*","*print-dup*","*print-length*","*print-level*","*print-meta*","*print-namespace-maps*","*print-readably*","*read-eval*","*reader-resolver*","*source-path*","*suppress-read*","*unchecked-math*","*use-context-classloader*","*verbose-defrecords*","*warn-on-reflection*","EMPTY-NODE","Inst","char-escape-string","char-name-string","default-data-readers","primitives-classnames","unquote","unquote-splicing"]
    \ }

function! s:syntax_keyword(dict)
	for key in keys(a:dict)
		execute 'syntax keyword' key join(a:dict[key], ' ')
	endfor
endfunction

if exists('b:bass_syntax_without_core_keywords') && b:bass_syntax_without_core_keywords
	" Only match language specials and primitives
	for s:key in ['bassBoolean', 'bassConstant', 'bassException', 'bassSpecial']
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

" Keywords are symbols:
"   static Pattern symbolPat = Pattern.compile("[:]?([\\D&&[^/]].*/)?([\\D&&[^/]][^/]*)");
" But they:
"   * Must not end in a : or /
"   * Must not have two adjacent colons except at the beginning
"   * Must not contain any reader metacharacters except for ' and #
syntax match bassKeyword "\v<:{1,2}([^ \n\r\t()\[\]{}";@^`~\\/]+/)*[^ \n\r\t()\[\]{}";@^`~\\/]+:@1<!>"

syntax match bassStringEscape "\v\\%([\\btnfr"]|u\x{4}|[0-3]\o{2}|\o{1,2})" contained

syntax region bassString matchgroup=bassStringDelimiter start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=bassStringEscape,@Spell

syntax match bassCharacter "\v\\%(o%([0-3]\o{2}|\o{1,2})|u\x{4}|newline|tab|space|return|backspace|formfeed|.)"

syntax match bassSymbol "\v%([a-zA-Z!$&*_+=|<.>?-]|[^\x00-\x7F])+%(:?%([a-zA-Z0-9!#$%&*_+=|'<.>/?-]|[^\x00-\x7F]))*[#:]@1<!"

" NB. Correct matching of radix literals was removed for better performance.
syntax match bassNumber "\v<[-+]?%(%([2-9]|[12]\d|3[0-6])[rR][[:alnum:]]+|%(0\o*|0x\x+|[1-9]\d*)N?|%(0|[1-9]\d*|%(0|[1-9]\d*)\.\d*)%(M|[eE][-+]?\d+)?|%(0|[1-9]\d*)/%(0|[1-9]\d*))>"

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

" Comment out discarded forms.  <https://bass.org/guides/weird_characters#_discard>
" TODO: stacking support and/or option to enable/disable this.
syntax region bassDiscard matchgroup=bassDiscard start=/#_[ ,\t\n`'~]*/   end=/[, \t\n()\[\]{}";]/me=e-1
syntax region bassDiscard matchgroup=bassDiscard start=/#_[ ,\t\n`'~]*"/  skip=/\\[\\"]/ end=/"/
syntax region bassDiscard matchgroup=bassDiscard start=/#_[ ,\t\n`'~]*(/  end=/)/  contains=bassDiscardForm
syntax region bassDiscard matchgroup=bassDiscard start=/#_[ ,\t\n`'~]*\[/ end=/\]/ contains=bassDiscardForm
syntax region bassDiscard matchgroup=bassDiscard start=/#_[ ,\t\n`'~]*{/  end=/}/  contains=bassDiscardForm

syntax region bassDiscardForm start="("  end=")"  contained contains=bassDiscardForm
syntax region bassDiscardForm start="{"  end="}"  contained contains=bassDiscardForm
syntax region bassDiscardForm start="\[" end="\]" contained contains=bassDiscardForm

" -*- TOP CLUSTER -*-
" TODO: generate
syntax cluster bassTop contains=@Spell,bassBoolean,bassCharacter,bassComment,bassCond,bassConstant,bassDefine,bassDeref,bassDispatch,bassError,bassException,bassFunc,bassKeyword,bassMacro,bassMap,bassMeta,bassNumber,bassQuote,bassRepeat,bassSexp,bassSpecial,bassString,bassSymbol,bassUnquote,bassVarArg,bassVariable,bassVector,bassDiscard

syntax region bassSexp   matchgroup=bassParen start="("  end=")" contains=@bassTop fold
syntax region bassVector matchgroup=bassParen start="\[" end="]" contains=@bassTop fold
syntax region bassMap    matchgroup=bassParen start="{"  end="}" contains=@bassTop fold

" Highlight superfluous closing parens, brackets and braces.
syntax match bassError "]\|}\|)"

syntax sync fromstart

highlight default link bassConstant                  Constant
highlight default link bassBoolean                   Boolean
highlight default link bassCharacter                 Character
highlight default link bassKeyword                   Keyword
highlight default link bassNumber                    Number
highlight default link bassString                    String
highlight default link bassStringDelimiter           String
highlight default link bassStringEscape              Character

highlight default link bassVariable                  Identifier
highlight default link bassCond                      Conditional
highlight default link bassDefine                    Define
highlight default link bassException                 Exception
highlight default link bassFunc                      Function
highlight default link bassMacro                     Macro
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
highlight default link bassDiscard                   bassComment
highlight default link bassDiscardForm               bassDiscard

highlight default link bassError                     Error

highlight default link bassParen                     Delimiter

let b:current_syntax = "bass"

let &cpo = s:cpo_sav
unlet! s:cpo_sav

" vim:sts=2:sw=2:ts=2:noet
