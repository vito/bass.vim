> **work in progress** - expect broken promises until this notice is removed!

# Bass.vim

[Bass][] syntax highlighting for Vim and Neovim.

Provides syntax highlighting and LSP configuration (assuming you have
`bass-lsp` installed).


## Installation

```vim
Plug 'vito/bass.vim'
```

Adjust for whatever flavor of package manager you use - there's not a lot to
set up.

## Configuration

### Folding

Setting `g:bass_fold` to `1` will enable the folding of Bass code.  Any list,
vector or map that extends over more than one line can be folded using the
standard Vim fold commands.

(Note that this option will not work with scripts that redefine the bracket
regions, such as rainbow parenphesis plugins.)


### Syntax options

Syntax highlighting of bindings from the Bass stdlib is provided by default,
but additional symbols can be highlighted by adding them to the
`g:bass_syntax_keywords` variable.

```vim
let g:bass_syntax_keywords = {
    \   'bassOp': ["defn", "defop"],
    \   'bassFn': ["length", "map"]
    \ }
```

(See `s:bass_syntax_keywords` in the [syntax script](syntax/bass.vim) for
a complete example.)

There is also a buffer-local variant of this variable (`b:bass_syntax_keywords`)
that is intended for use by plugin authors to highlight symbols dynamically.

By setting `b:bass_syntax_without_core_keywords`, vars from `bass.core`
will not be highlighted by default.  This is useful for namespaces that have
set `(:refer-bass :only [])`.


### Indent options

Bass indentation differs somewhat from traditional Lisps, due in part to the
use of square and curly brackets, and otherwise by community convention. These
conventions are not universally followed, so the Bass indent script offers a
few configuration options.

(If the current Vim does not include `searchpairpos()`, the indent script falls
back to normal `'lisp'` indenting, and the following options are ignored.)


#### `g:bass_maxlines`

Sets maximum scan distance of `searchpairpos()`.  Larger values trade
performance for correctness when dealing with very long forms.  A value of
0 will scan without limits.  The default is 300.


#### `g:bass_fuzzy_indent`, `g:bass_fuzzy_indent_patterns`, `g:bass_fuzzy_indent_blacklist`

The `'lispwords'` option is a list of comma-separated words that mark special
forms whose subforms should be indented with two spaces.

For example:

```clojure
(defn bad []
      "Incorrect indentation")

(defn good []
  "Correct indentation")
```

If you would like to specify `'lispwords'` with a pattern instead, you can use
the fuzzy indent feature:

```vim
" Default
let g:bass_fuzzy_indent = 1
let g:bass_fuzzy_indent_patterns = ['^with', '^def', '^let']
let g:bass_fuzzy_indent_blacklist = ['-fn$', '\v^with-%(meta|out-str|loading-context)$']
```

`g:bass_fuzzy_indent_patterns` and `g:bass_fuzzy_indent_blacklist` are
lists of patterns that will be matched against the unqualified symbol at the
head of a list.  This means that a pattern like `"^foo"` will match all these
candidates: `foobar`, `my.ns/foobar`, and `#'foobar`.

Each candidate word is tested for special treatment in this order:

1. Return true if word is literally in `'lispwords'`
2. Return false if word matches a pattern in `g:bass_fuzzy_indent_blacklist`
3. Return true if word matches a pattern in `g:bass_fuzzy_indent_patterns`
4. Return false and indent normally otherwise


#### `g:bass_special_indent_words`

Some forms in Bass are indented such that every subform is indented by only two
spaces, regardless of `'lispwords'`.  If you have a custom construct that
should be indented in this idiosyncratic fashion, you can add your symbols to
the default list below.

```vim
" Default
let g:bass_special_indent_words = 'deftype,defrecord,reify,proxy,extend-type,extend-protocol,letfn'
```


#### `g:bass_align_multiline_strings`

Align subsequent lines in multi-line strings to the column after the opening
quote, instead of the same column.

For example:

```clojure
(def default
  "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
  eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
  enim ad minim veniam, quis nostrud exercitation ullamco laboris
  nisi ut aliquip ex ea commodo consequat.")

(def aligned
  "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
   eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
   enim ad minim veniam, quis nostrud exercitation ullamco laboris
   nisi ut aliquip ex ea commodo consequat.")
```


#### `g:bass_align_subforms`

By default, parenthesized compound forms that look like function calls and
whose head subform is on its own line have subsequent subforms indented by
two spaces relative to the opening paren:

```clojure
(foo
  bar
  baz)
```

Setting this option to `1` changes this behaviour so that all subforms are
aligned to the same column, emulating the default behaviour of
[clojure-mode.el](https://github.com/clojure-emacs/clojure-mode):

```clojure
(foo
 bar
 baz)
```


## Contribute

Pull requests are welcome! A healthy `CONTRIBUTING.md` file will be written
once I figure out how to contribute to this myself. Until then, wing it and
open issues if you have any questions. Thanks!


## Acknowledgements

Bass.vim stands on the shoulders of [Clojure.vim][] which has its own history
and acknowledgements.


## License

Bass.vim is forked from [Clojure.vim][] and retains the same [Vim
License](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license).

- Copyright © 2021, Alex Suraci <suraci.alex@gmail.com>
- Copyright © 2020–2021, The clojure-vim contributors.
- Copyright © 2013–2018, Sung Pae.
- Copyright © 2008–2012, Meikel Brandmeyer.
- Copyright © 2007–2008, Toralf Wittner.

See [LICENSE](https://github.com/vito/bass.vim/blob/master/LICENSE)
for more details.


<!-- Links -->

[bass.vim]: https://github.com/vito/bass.vim
[clojure.vim]: https://github.com/clojure-vim/clojure.vim
[bass]: https://vito.github.io/bass

<!-- vim: set tw=79 : -->
