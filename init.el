;;; init.el -*- lexical-binding: t; -*-

;; Copy this file to ~/.doom.d/init.el or ~/.config/doom/init.el ('doom
;; quickstart' will do this for you). The `doom!' block below controls what
;; modules are enabled and in what order they will be loaded. Remember to run
;; 'doom refresh' after modifying it.
;;
;; More information about these modules (and what flags they support) can be
;; found in modules/README.org.

(doom! :input
       ;;chinese
       ;;japanese
       ;;layout            ; auie,ctsrnm is the superior home row

       :completion
       company          ; the ultimate code completion backend
       ; +auto            ; as-you-type code completion
       (helm             ; the *other* search engine for love and life
         +fuzzy)          ; enable fuzzy search backend for helm
       ;;ido               ; the other *other* search engine...
       ;;(ivy              ; a search engine for love and life
       ;; +fuzzy)          ; enable fuzzy search backend for ivy

       :ui
       deft              ; notational velocity for Emacs
       ;doom              ; what makes DOOM look the way it does
       ; doom-dashboard    ; a nifty splash screen for Emacs
       ; doom-modeline     ; a snazzy Atom-inspired mode-line
       ; doom-quit         ; DOOM quit-message prompts when you quit Emacs
       ; evil-goggles      ; display visual hints when editing in evil
       ;;fci               ; a `fill-column' indicator
       ;;fill-column       ; a `fill-column' indicator
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       ;;hydra
       ;;indent-guides     ; highlighted indent columns
       ;;ligatures         ; ligatures and symbols to make your code pretty again
       ;;minimap           ; show a map of the code on the side
       modeline          ; snazzy, Atom-inspired modeline, plus API
       nav-flash         ; blink the current line after jumping
       ;; neotree           ; a project drawer, like NERDTree for vim
       ophints           ; highlight the region an operation acts on
       (popup            ; tame sudden yet inevitable temporary windows
         +all             ; catch all popups that start with an asterix
         +defaults)       ; default popup rules
       ;;pretty-code       ; replace bits of code with pretty symbols
       ;;tabbar            ; FIXME an (incomplete) tab bar for Emacs
       ;;tabs              ; a tab bar for Emacs
       treemacs          ; a project drawer, like neotree but cooler
       ;;unicode           ; extended unicode support for various languages
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       window-select     ; visually switch windows
       workspaces        ; tab emulation, persistence & separate workspaces
       ;;zen               ; distraction-free coding or writing

       :editor
       (evil +everywhere +commands); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       ;;(format +onsave)  ; automated prettiness
       ;;god               ; run Emacs commands without modifier keys
       ;;lispy             ; vim for lisp, for people who dont like vim
       multiple-cursors  ; editing in many places at once
       ;;objed             ; text object editing for the innocent
       ;;parinfer          ; turn lisp into python, sort of
       rotate-text       ; cycle region at point between text candidates
       snippets          ; my elves. They type so I don't have to
       ;;word-wrap         ; soft wrapping with language-aware indent

       :emacs
       (dired            ; making dired pretty [functional]
         ;;+ranger         ; bringing the goodness of ranger to dired
         ;;+icons          ; colorful icons for dired-mode
         )
       electric          ; smarter, keyword-based electric-indent
       ibuffer           ; interactive buffer management
       undo              ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree

       :term
       ;;eshell            ; the elisp shell that works everywhere
       ;;shell             ; simple shell REPL for Emacs
       ;;term              ; basic terminal emulator for Emacs
       vterm             ; the best terminal emulation in Emacs

       :checkers
       syntax              ; tasing you for every semicolon you forget
       spell             ; tasing you for misspelling mispelling
       grammar           ; tasing grammar mistake every you make

       :tools
       ansible
       (debugger +lsp)          ; FIXME stepping through code, to help you add bugs
       direnv
       docker
       ; editorconfig      ; let someone else argue about tabs vs spaces
       ;;ein               ; tame Jupyter notebooks with emacs
       (eval +overlay)     ; run code, run (also, repls)
       ; flycheck          ; tasing you for every semicolon you forget
       ; flyspell          ; tasing you for misspelling mispelling
       ;;gist              ; interacting with github gists
       (lookup           ; helps you navigate your code and documentation
         +devdocs
         +docsets)        ; ...or in Dash docsets locally
       (lsp +peek)
       magit             ; a git porcelain for Emacs
       ;;make              ; run make tasks from Emacs
       ;;pass              ; password manager for nerds
       pdf               ; pdf enhancements
       prodigy           ; FIXME managing external services & code builders
       ;;rgb               ; creating color strings
       ;;taskrunner        ; taskrunner for all your projects
       terraform         ; infrastructure as code
       ;;tmux              ; an API for interacting with tmux
       ;;upload            ; map local to remote projects via ssh/ftp
       ;;wakatime
       :os
       (:if IS-MAC macos)  ; improve compatibility with macOS
       ;;tty               ; improve the terminal Emacs experience

       :lang
       ;;agda              ; types of types of types of types...
       ;;assembly          ; assembly for fun or debugging
       ; (cc +irony +rtags); C/C++/Obj-C madness
       clojure           ; java with a lisp
       common-lisp       ; if you've seen one lisp, you've seen them all
       ;;coq               ; proofs-as-programs
       ;;crystal           ; ruby at the speed of c
       ;;csharp            ; unity, .NET, and mono shenanigans
       data              ; config/data formats
       ;;(dart +flutter)   ; paint ui and not much else
       ;;elixir            ; erlang done right
       ;;elm               ; care for a cup of TEA?
       emacs-lisp        ; drown in parentheses
       ;;erlang            ; an elegant language for a more civilized age
       ;;ess               ; emacs speaks statistics
       ;;factor
       ;;faust             ; dsp, but you get to keep your soul
       ;;fsharp           ; ML stands for Microsoft's Language
       ;;fstar             ; (dependent) types and (monadic) effects and Z3
       ;;gdscript          ; the language you waited for
       (go +lsp)         ; the hipster dialect
       ;;(haskell +dante)  ; a language that's lazier than I am
       ;;(haskell +intero) ; a language that's lazier than I am
       ;;hy                ; readability of scheme w/ speed of python
       ;;idris             ; a language you can depend on
       ;;json              ; At least it ain't XML
       (java +lsp) ; the poster child for carpal tunnel syndrome
       ;;(java +meghanada) ; the poster child for carpal tunnel syndrome
       javascript        ; all(hope(abandon(ye(who(enter(here))))))
       ;;julia             ; a better, faster MATLAB
       ;;kotlin            ; a better, slicker Java(Script)
       ;;latex             ; writing papers in Emacs has never been so fun
       ;;lean
       ;;factor
       ;;ledger            ; an accounting system in Emacs
       ;;lua               ; one-based indices? one-based indices
       markdown          ; writing docs for people to ignore
       ;;nim               ; python + lisp at the speed of c
       ;;nix               ; I hereby declare "nix geht mehr!"
       ;;ocaml             ; an objective camel
       (org              ; organize your plain life in plain text
        ; +dragndrop       ; file drag & drop support
        +ipython         ; ipython support for babel
        +pandoc          ; pandoc integration into org's exporter
        +present)        ; using Emacs for presentations
         ; +attach          ; custom attachment system
         ; +babel           ; running code in org
         ; +capture         ; org-capture in and outside of Emacs
         ; +export          ; Exporting org to whatever you want
         ; ; +habit           ; Keep track of your habits
         ; +present         ; Emacs for presentations
         ; +protocol)       ; Support for org-protocol:// links
       ;;perl              ; write code no one else can comprehend
       ;;php               ; perl's insecure younger brother
       ;;plantuml          ; diagrams for confusing people more
       ;;purescript        ; javascript, but functional
       python            ; beautiful is better than ugly
       ;;qt                ; the 'cutest' gui framework ever
       racket            ; a DSL for DSLs
       ;;raku              ; the artist formerly known as perl6
       rest              ; Emacs as a REST client
       ;;rst               ; ReST in peace
       ;;(ruby +rails)     ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       ; (rust +lsp)              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       ;;scala             ; java, but good
       ;;scheme            ; a fully conniving family of lisps
       sh                ; she sells {ba,z,fi}sh shells on the C xor
       ;;sml
       ;;solidity          ; do you need a blockchain? No.
       ;;swift             ; who asked for emoji variables?
       ;;terra             ; Earth and Moon in alignment for performance.
       ;;web               ; the tubes
       ;;yaml              ; JSON, but readable

       :email
       ;;(email +gmail)    ; emacs as an email client
       ;;(mu4e +gmail)       ; WIP
       notmuch
       ;;(wanderlust +gmail) ; WIP

       ;; Applications are complex and opinionated modules that transform Emacs
       ;; toward a specific purpose. They may have additional dependencies and
       ;; should be loaded late.
       :app
       ;;calendar
       ;;everywhere        ; *leave* Emacs!? You must be joking
       ;;irc               ; how neckbeards socialize
       ;;(rss +org)        ; emacs as an RSS reader
       ;;twitter           ; twitter client https://twitter.com/vnought
       ;;(write            ; emacs as a word processor (latex + org + markdown)
       ;; +wordnut         ; wordnet (wn) search
       ;; +langtool)       ; a proofreader (grammar/style check) for Emacs

       :collab
       ;;floobits          ; peer programming for a price
       ;;impatient-mode    ; show off code over HTTP

       :config
       ;; For literate config users. This will tangle+compile a config.org
       ;; literate config in your `doom-private-dir' whenever it changes.
       ;;literate

       ;; The default module sets reasonable defaults for Emacs. It also
       ;; provides a Spacemacs-inspired keybinding scheme, a custom yasnippet
       ;; library, and additional ex commands for evil-mode. Use it as a
       ;; reference for your own modules.
       (default +bindings +snippets +evil-commands +smartparens)

       :private
       org-jira
       csv-to-table
       )
