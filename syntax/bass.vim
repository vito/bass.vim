" Vim syntax file
" Language:           Bass
" Maintainer:         Alex Suraci <suraci.alex@gmail.com>
" Former Maintainers: Alex Vear <alex@vear.uk>
"                     Sung Pae <self@sungpae.com>
"                     Meikel Brandmeyer <mb@kotka.de>
"                     Toralf Wittner <toralf.wittner@gmail.com>
" Contributors:       Joel Holdbrooks <cjholdbrooks@gmail.com> (Regexp support, bug fixes)
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

syntax match  bassRegexpEscape "\v\\%([\\tnrfae.()\[\]{}^$*?+]|c\u|0[0-3]?\o{1,2}|x%(\x{2}|\{\x{1,6}\})|u\x{4})" contained display
syntax region bassRegexpQuoted start=/\\Q/ms=e+1 skip=/\\\\\|\\"/ end=/\\E/me=s-1 end=/"/me=s-1 contained
syntax region bassRegexpQuote  start=/\\Q/       skip=/\\\\\|\\"/ end=/\\E/       end=/"/me=s-1 contains=bassRegexpQuoted keepend contained

" -*- CHARACTER PROPERTY CLASSES -*-
" TODO: generate
" Java version 15.0.2
syntax match bassRegexpPosixCharClass "\v\\[pP]\{%(Cntrl|A%(l%(pha|num)|SCII)|Space|Graph|Upper|P%(rint|unct)|Blank|XDigit|Digit|Lower)\}" contained display
syntax match bassRegexpJavaCharClass "\v\\[pP]\{java%(Whitespace|JavaIdentifier%(Part|Start)|SpaceChar|Mirrored|TitleCase|I%(SOControl|de%(ographic|ntifierIgnorable))|D%(efined|igit)|U%(pperCase|nicodeIdentifier%(Part|Start))|L%(etter%(OrDigit)?|owerCase)|Alphabetic)\}" contained display
syntax match bassRegexpUnicodeCharClass "\v\\[pP]\{\cIs%(l%(owercase|etter)|hex%(digit|_digit)|w%(hite%(_space|space)|ord)|noncharacter%(_code_point|codepoint)|p%(rint|unctuation)|ideographic|graph|a%(l%(num|phabetic)|ssigned)|uppercase|join%(control|_control)|titlecase|blank|digit|control)\}" contained display
syntax match bassRegexpUnicodeCharClass "\v\\[pP][NSCMZPL]" contained display
syntax match bassRegexpUnicodeCharClass "\v\\[pP]\{%(N[dlo]?|P[dcifeos]?|C[ncfos]?|M[nce]?|Z[lsp]?|S[mcko]?|L[muCDlto]?)\}" contained display
syntax match bassRegexpUnicodeCharClass "\v\\[pP]\{%(Is|gc\=|general_category\=)?%(N[dlo]?|P[dcifeos]?|C[ncfos]?|M[nce]?|Z[lsp]?|S[mcko]?|L[muCDlto]?)\}" contained display
syntax match bassRegexpUnicodeCharClass "\v\\[pP]\{\c%(Is|sc\=|script\=)%(k%(its|h%(oj%(ki)?|m%(r|er)|itan_small_script|udawadi|ar%(oshthi)?)|a%(li|n%(a|nada)|takana%(_or_hiragana)?|yah_li|ithi)|nda|thi)|r%(ohg|un%(ic|r)|ejang|jng)|l%(epc%(ha)?|i%(mbu?|n%([ab]|ear_[ab])|su)|y%([dc]i%(an)?)|a%(t%(n|in)|na|oo?))|t%(elu%(gu)?|ha%(i|a%(na)?)|i%(finagh|rh%(uta)?|b%(t|etan))|fng|glg|a%(i_%(le|tham|viet)|g%(alog|b%(anwa)?)|vt|kri?|ng%(ut)?|l[ue]|m%(il|l)))|vaii?|y%(i%(ii)?|ezi%(di)?)|e%(thi%(opic)?|l%(ym%(aic)?|ba%(san)?)|gyp%(tian_hieroglyphs)?)|u%(gar%(itic)?|nknown)|h%(ung|ira%(gana)?|rkt|mn[gp]|a%(n%(i%(fi_rohingya)?|unoo|o|g%(ul)?)?|tr%(an)?)|luw|ebr%(ew)?)|g%(r%(e%(k|ek)|an%(tha)?)|lag%(olitic)?|eor%(gian)?|o%(n[mg]|th%(ic)?)|u%(j%(arati|r)|r%(u|mukhi)|njala_gondi))|m%(lym|a%(n%(d%(aic)?|i%(chaean)?)|saram_gondi|h%(ajani|j)|ka%(sar)?|rc%(hen)?|layalam)|o%(di|ng%(olian)?)|e%(r%(c|o%(itic_%(hieroglyphs|cursive))?)|etei_mayek|nd%(e_kikakui)?|d%(f|efaidrin))|roo?|y%(anmar|mr)|tei|iao|ult%(ani)?)|d%(upl%(oyan)?|srt|i%(ak|ves_akuru)|ogra?|e%(seret|va%(nagari)?))|z%(an%(abazar_square|b)|inh|yyy|zzz)|n%(yiakeng_puachue_hmong|bat|koo?|ew%(_tai_lue|a)|ushu|shu|a%(bataean|rb|nd%(inagari)?))|s%(h%(rd|a%(vian|rada|w))|o%(yo%(mbo)?|g%(d%(ian)?|o)|ra%(_sompeng)?)|i%(n%(d|h%(ala)?)|dd%(ham)?|gnwriting)|a%(ur%(ashtra)?|m%(r|aritan)|rb)|y%(r%(c|iac)|lo%(ti_nagri)?)|und%(anese)?|gnw)|w%(cho|a%(ncho|ra%(ng_citi)?))|c%(y%(priot|r%(l|illic))|h%(er%(okee)?|a%(m|kma)|rs|orasmian)|a%(km|ucasian_albanian|n%(adian_aboriginal|s)|ri%(an)?)|prt|uneiform|o%(pt%(ic)?|mmon))|i%(n%(scriptional_pa%(rthian|hlavi)|herited)|mperial_aramaic|tal)|p%(h%(l[ip]|oenician|ag%(s_pa)?|nx)|a%(lm%(yrene)?|u%(_cin_hau|c)|hawh_hmong)|rti|salter_pahlavi|lrd|erm)|x%(peo|sux)|b%(eng%(ali)?|ra%(i%(lle)?|h%(mi)?)|opo%(mofo)?|u%(gi%(nese)?|h%(d|id))|h%(ks|aiksuki)|a%(ss%(a_vah)?|t%(ak|k)|li%(nese)?|mum?))|java%(nese)?|o%(g%(am|ham)|s%(age|ge|ma%(nya)?)|l%(d_%(hungarian|north_arabian|so%(gdian|uth_arabian)|per%(mic|sian)|italic|turkic)|ck|_chiki)|r%(iya|kh|ya))|a%(r%(ab%(ic)?|m%([ni]|enian))|dl%(m|am)|natolian_hieroglyphs|hom|v%(st|estan)|ghb))\}" contained display
syntax match bassRegexpUnicodeCharClass "\v\\[pP]\{\c%(In|blk\=|block\=)%(zanabazar%([ _]square|square)|javanese|h%(a%(lfwidth%( and fullwidth forms|andfullwidthforms|_and_fullwidth_forms)|tran|n%(unoo|gul%(compatibilityjamo|syllables|jamo%(extended\-[ab])?|_%(syllables|jamo%(_extended_[ab])?|compatibility_jamo)| %(syllables|compatibility jamo|jamo%( extended\-[ab])?))|ifi%([_ ]rohingya|rohingya)))|i%(ragana|gh%( %(private use surrogates|surrogates)|_%(private_use_surrogates|surrogates)|surrogates|privateusesurrogates))|ebrew)|i%(pa%([ _]extensions|extensions)|n%(scriptional%(%([ _]pa%(rthian|hlavi))|pa%(rthian|hlavi))|dic%(siyaqnumbers|_siyaq_numbers| siyaq numbers))|deographic%(symbolsandpunctuation|_%(description_characters|symbols_and_punctuation)| %(description characters|symbols and punctuation)|descriptioncharacters)|mperial%(aramaic|[_ ]aramaic))|c%(o%(ntrol%(pictures|[ _]pictures)|ptic%(epactnumbers|_epact_numbers| epact numbers)?|m%(mon%(_indic_number_forms|indicnumberforms| indic number forms)|bining%(halfmarks|_%(diacritical_marks%(_%(supplement|for_symbols|extended))?|marks_for_symbols|half_marks)| %(half marks|diacritical marks%( %(supplement|for symbols|extended))?|marks for symbols)|diacriticalmarks%(supplement|forsymbols|extended)?|marksforsymbols))|unting%( rod numerals|_rod_numerals|rodnumerals))|a%(rian|ucasian%([ _]albanian|albanian))|jk%(unifiedideographs%(extension[dgacfbe])?|s%(ymbolsandpunctuation|trokes)|_%(s%(trokes|ymbols_and_punctuation)|radicals_supplement|unified_ideographs%(_extension_[dgacfbe])?|compatibility%(_%(forms|ideographs%(_supplement)?))?)|compatibility%(forms|ideographs%(supplement)?)?|radicalssupplement| %(compatibility%( %(ideographs%( supplement)?|forms))?|unified ideographs%( extension [dgacfbe])?|radicals supplement|s%(ymbols and punctuation|trokes)))|y%(rillic%(supplement%(ary)?| %(supplement%(ary)?|extended\-[acb])|extended\-[acb]|_%(extended_[acb]|supplement%(ary)?))?|priot%(syllabary|[ _]syllabary))|u%(rrency%([_ ]symbols|symbols)|neiform%(_numbers_and_punctuation|numbersandpunctuation| numbers and punctuation)?)|h%(e%(ss%([_ ]symbols|symbols)|rokee%(supplement|[ _]supplement)?)|a%(m|kma)|orasmian))|g%(othic|u%(njala%(gondi|[_ ]gondi)|jarati|rmukhi)|lagolitic%(supplement|[ _]supplement)?|e%(o%(rgian%(supplement|%([_ ]%(supplement|extended))|extended)?|metric%( shapes%( extended)?|shapes%(extended)?|_shapes%(_extended)?))|neral%([_ ]punctuation|punctuation))|r%(eek%( %(and coptic|extended)|andcoptic|_%(and_coptic|extended)|extended)?|antha))|s%(h%(orthand%( format controls|_format_controls|formatcontrols)|a%(vian|rada))|u%(ndanese%(supplement|[ _]supplement)?|p%(erscripts%(_and_subscripts|andsubscripts| and subscripts)|plementa%(ry%(_private_use_area_[ab]|privateusearea\-[ab]| private use area\-[ab])|l%( %(mathematical operators|symbols and pictographs|punctuation|arrows\-[acb])|symbolsandpictographs|mathematicaloperators|punctuation|arrows\-[acb]|_%(arrows_[acb]|symbols_and_pictographs|mathematical_operators|punctuation))))|tton%(signwriting|[_ ]signwriting))|i%(nhala%( archaic numbers|archaicnumbers|_archaic_numbers)?|ddham)|y%(loti%([_ ]nagri|nagri)|mbols%( %(for legacy computing|and pictographs extended\-a)|forlegacycomputing|andpictographsextended\-a|_%(and_pictographs_extended_a|for_legacy_computing))|riac%(supplement|[ _]supplement)?)|p%(acing%(_modifier_letters| modifier letters|modifierletters)|ecials)|a%(maritan|urashtra)|o%(yombo|gdian|ra%(sompeng|[ _]sompeng))|mall%(kanaextension| %(kana extension|form variants)|_%(kana_extension|form_variants)|formvariants))|y%(i%(syllables|%([_ ]%(syllables|radicals))|radicals|jing%(hexagramsymbols| hexagram symbols|_hexagram_symbols))|ezidi)|p%(h%(o%(enician|netic%( extensions%( supplement)?|extensions%(supplement)?|_extensions%(_supplement)?))|a%(istos%([ _]disc|disc)|gs[_\-]pa))|laying%(cards|[_ ]cards)|rivate%(usearea| use area|_use_area)|a%(hawh%(hmong|[_ ]hmong)|u%(_cin_hau|cinhau| cin hau)|lmyrene)|salter%(pahlavi|[ _]pahlavi))|e%(l%(basan|ymaic)|arly%(_dynastic_cuneiform|dynasticcuneiform| dynastic cuneiform)|moticons|gyptian%(hieroglyph%(formatcontrols|s)| hieroglyph%( format controls|s)|_hieroglyph%(_format_controls|s))|nclosed%( %(cjk letters and months|ideographic supplement|alphanumeric%( supplement|s))|cjklettersandmonths|_%(ideographic_supplement|alphanumeric%(_supplement|s)|cjk_letters_and_months)|alphanumerics%(upplement)?|ideographicsupplement)|thiopic%(supplement|_%(supplement|extended%(_a)?)| %(supplement|extended%(\-a)?)|extended%(\-a)?)?)|r%(u%(nic|mi%(numeralsymbols| numeral symbols|_numeral_symbols))|ejang)|d%(o%(gra|mino%([ _]tiles|tiles))|e%(seret|vanagari%([ _]extended|extended)?)|uployan|i%(ngbats|ves%([_ ]akuru|akuru)))|m%(e%(defaidrin|nde%([ _]kikakui|kikakui)|etei%(mayek%(extensions)?|_mayek%(_extensions)?| mayek%( extensions)?)|roitic%(hieroglyphs|%([_ ]%(hieroglyphs|cursive))|cursive))|o%(ngolian%(supplement|[ _]supplement)?|di%(fier%(_tone_letters| tone letters|toneletters))?)|ro|u%(ltani|sical%([_ ]symbols|symbols))|i%(ao|scellaneous%(technical|symbols%(and%(pictographs|arrows))?|mathematicalsymbols\-[ab]| %(technical|mathematical symbols\-[ab]|symbols%( and %(pictographs|arrows))?)|_%(technical|symbols%(_and_%(pictographs|arrows))?|mathematical_symbols_[ab])))|yanmar%( extended\-[ab]|extended\-[ab]|_extended_[ab])?|a%(h%(ajani|jong%([ _]tiles|tiles))|rchen|n%(daic|ichaean)|yan%([_ ]numerals|numerals)|saram%(gondi|[_ ]gondi)|layalam|thematical%(alphanumericsymbols| %(alphanumeric symbols|operators)|_%(alphanumeric_symbols|operators)|operators)|kasar))|o%(s%(age|manya)|ttoman%(siyaqnumbers|_siyaq_numbers| siyaq numbers)|r%(namental%([ _]dingbats|dingbats)|iya)|ptical%( character recognition|_character_recognition|characterrecognition)|gham|l%([ _]chiki|d%(hungarian| %(hungarian|so%(uth arabian|gdian)|per%(mic|sian)|north arabian|italic|turkic)|per%(mic|sian)|so%(utharabian|gdian)|italic|turkic|_%(hungarian|north_arabian|so%(gdian|uth_arabian)|per%(mic|sian)|italic|turkic)|northarabian)|chiki))|n%(ew%(_tai_lue|a|tailue| tai lue)|ko|yiakeng%( puachue hmong|puachuehmong|_puachue_hmong)|a%(bataean|ndinagari)|u%(shu|mber%(forms|[ _]forms)))|b%(u%(ginese|hid)|a%(s%(sa%([ _]vah|vah)|ic%([ _]latin|latin))|linese|mum%(supplement|[ _]supplement)?|tak)|ra%(hmi|ille%(patterns|[_ ]patterns))|o%(x%([ _]drawing|drawing)|pomofo%([ _]extended|extended)?)|lock%([ _]elements|elements)|haiksuki|yzantine%( musical symbols|musicalsymbols|_musical_symbols)|engali)|l%(i%(mbu|near%(a| %(a|b %(ideograms|syllabary))|b%(ideograms|syllabary)|_%(a|b_%(ideograms|syllabary)))|su%(supplement|[ _]supplement)?)|a%(tin%(extended%(\-[dacbe]|additional)|_%(extended_%([dcbe]|a%(dditional)?)|1_supplement)|\-1%(supplement| supplement)| extended%(\-[dacbe]| additional))|o)|e%(tterlike%([_ ]symbols|symbols)|pcha)|ow%([_ ]surrogates|surrogates)|y[cd]ian)|k%(h%(aroshthi|ojki|mer%([_ ]symbols|symbols)?|udawadi|itan%( small script|smallscript|_small_script))|a%(takana%(_phonetic_extensions|phoneticextensions| phonetic extensions)?|n%(gxi%([_ ]radicals|radicals)|a%(extended\-a|supplement| %(extended\-a|supplement)|_%(supplement|extended_a))|bun|nada)|ithi|yah%([ _]li|li)))|wa%(ncho|rang%(citi|[ _]citi))|t%(elugu|ransport%( and map symbols|_and_map_symbols|andmapsymbols)|i%(rhuta|betan|finagh)|a%(mil%(supplement|[ _]supplement)?|kri|ngut%(supplement|%([ _]%(supplement|components))|components)?|i%(xuanjingsymbols|_%(le|xuan_jing_symbols|tham|viet)|le| %(xuan jing symbols|le|tham|viet)|tham|viet)|g%(alog|s|banwa))|ha%(i|ana))|a%(l%(chemical%([_ ]symbols|symbols)|phabetic%( presentation forms|_presentation_forms|presentationforms))|n%(cient%(_%(greek_%(musical_notation|numbers)|symbols)|greek%(numbers|musicalnotation)| %(greek %(numbers|musical notation)|symbols)|symbols)|atolian%([ _]hieroglyphs|hieroglyphs))|dlam|r%(menian|abic%(extended\-a|mathematicalalphabeticsymbols|supplement|_%(presentation_forms_[ab]|supplement|extended_a|mathematical_alphabetic_symbols)| %(extended\-a|mathematical alphabetic symbols|supplement|presentation forms\-[ab])|presentationforms\-[ab])?|rows)|egean%(numbers|[ _]numbers)|vestan|hom)|u%(garitic|nified%(canadianaboriginalsyllabics%(extended)?|_canadian_aboriginal_syllabics%(_extended)?| canadian aboriginal syllabics%( extended)?))|v%(a%(i|riation%( selectors%( supplement)?|selectors%(supplement)?|_selectors%(_supplement)?))|e%(rtical%(forms|[ _]forms)|dic%([ _]extensions|extensions))))\}" contained display

syntax match   bassRegexpPredefinedCharClass "\v%(\\[dDsSwW]|\.)" contained display
syntax cluster bassRegexpCharPropertyClasses contains=bassRegexpPosixCharClass,bassRegexpJavaCharClass,bassRegexpUnicodeCharClass
syntax cluster bassRegexpCharClasses         contains=bassRegexpPredefinedCharClass,bassRegexpCharClass,@bassRegexpCharPropertyClasses
syntax region  bassRegexpCharClass           start="\[" skip=/\\\\\|\\]/ end="]" contained contains=bassRegexpPredefinedCharClass,@bassRegexpCharPropertyClasses
syntax match   bassRegexpBoundary            "\\[bBAGZz]" contained display
syntax match   bassRegexpBoundary            "[$^]" contained display
syntax match   bassRegexpQuantifier          "[?*+][?+]\=" contained display
syntax match   bassRegexpQuantifier          "\v\{\d+%(,|,\d+)?}\??" contained display
syntax match   bassRegexpOr                  "|" contained display
syntax match   bassRegexpBackRef             "\v\\%([1-9]\d*|k\<[[:alpha:]]+\>)" contained display

" Mode modifiers, mode-modified spans, lookaround, regular and atomic
" grouping, and named-capturing.
syntax match bassRegexpMod "\v\(@<=\?:" contained display
syntax match bassRegexpMod "\v\(@<=\?[xdsmiuU]*-?[xdsmiuU]+:?" contained display
syntax match bassRegexpMod "\v\(@<=\?%(\<?[=!]|\>)" contained display
syntax match bassRegexpMod "\v\(@<=\?\<[[:alpha:]]+\>" contained display

syntax region bassRegexpGroup start="(" skip=/\\\\\|\\)/ end=")" matchgroup=bassRegexpGroup contained contains=bassRegexpMod,bassRegexpQuantifier,bassRegexpBoundary,bassRegexpEscape,@bassRegexpCharClasses
syntax region bassRegexp start=/\#"/ skip=/\\\\\|\\"/ end=/"/ contains=@bassRegexpCharClasses,bassRegexpEscape,bassRegexpQuote,bassRegexpBoundary,bassRegexpQuantifier,bassRegexpOr,bassRegexpBackRef,bassRegexpGroup keepend

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
syntax cluster bassTop contains=@Spell,bassBoolean,bassCharacter,bassComment,bassCond,bassConstant,bassDefine,bassDeref,bassDispatch,bassError,bassException,bassFunc,bassKeyword,bassMacro,bassMap,bassMeta,bassNumber,bassQuote,bassRegexp,bassRepeat,bassSexp,bassSpecial,bassString,bassSymbol,bassUnquote,bassVarArg,bassVariable,bassVector,bassDiscard

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

highlight default link bassRegexp                    Constant
highlight default link bassRegexpEscape              Character
highlight default link bassRegexpCharClass           SpecialChar
highlight default link bassRegexpPosixCharClass      bassRegexpCharClass
highlight default link bassRegexpJavaCharClass       bassRegexpCharClass
highlight default link bassRegexpUnicodeCharClass    bassRegexpCharClass
highlight default link bassRegexpPredefinedCharClass bassRegexpCharClass
highlight default link bassRegexpBoundary            SpecialChar
highlight default link bassRegexpQuantifier          SpecialChar
highlight default link bassRegexpMod                 SpecialChar
highlight default link bassRegexpOr                  SpecialChar
highlight default link bassRegexpBackRef             SpecialChar
highlight default link bassRegexpGroup               bassRegexp
highlight default link bassRegexpQuoted              bassString
highlight default link bassRegexpQuote               bassRegexpBoundary

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
