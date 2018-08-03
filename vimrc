"" custom kew bindings:
"
" key 		mode 	function
"
" C-t		N/I	toggle tagbar
" `		All	toggle NERDTree
" C-u		N	toggle undotree
"
" F2		N/I	follow symbol under cursor (list matching symbols)
" C-]		All	follow symbol under cursor (first matching symbol)
" F3		All	jump back
" C-b		All	jump back
" F7		N/I	jump to previous matching symbol
" F8		N/I	jump to next matching symbol
"
" Mouse X1	All	jump back
" Mouse X2	All	jump forward
"
" [1		N/V	highlight w/ marker 1
" [2		N/V	highlight w/ marker 2
" [3		N/V	highlight w/ marker 3
" [4		N/V	highlight w/ marker 4
" \1		N	cancel highlight 1
" \2		N	cancel highlight 2
" \3		N	cancel highlight 3
" \4		N	cancel highlight 4
" \0		N	cancel all highlights
" [s		N/V	replace marker 1 with marker 2
"
" F9		All	open C reference documentation fo symbol under cursor
"
" F4		N	swirch to header/source
" \o		N	open file under cursor
"
" A-PgDown	All	split vertically
" A-PgUp	All	split horizontally
" A-Direction	All	go to split in Direction
" C-n		All	split vertically
" C-i		All	split horizontally
" C-[hjkl]	All	go to split in Direction
""
" \Tab		N/I	go to next tab
" \S-Tab	N/I	go to previous tab
" C-q		All	close current tab (quit when there is only one tab)

" used to skip vim partial emulation
let realvim=1

if exists("realvim")
    """ VUNDLE STUFF
    " should stay on top

    " disable vi compatibility
    set nocompatible
    " disable automatic syntax highlighting, needed by plugins
    filetype off

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    """ enable plugins

    Plugin 'tpope/vim-sensible' " basic common vim settings
    Plugin 'scrooloose/nerdcommenter' " fast comments
    Plugin 'Raimondi/delimitMate' " delimiters pairing
    Plugin 'a.vim' " alternate quickly between .h and .c
    Plugin 'ctrlpvim/ctrlp.vim' " fuzzy finder
    Plugin 'mileszs/ack.vim' " ack interface
    Plugin 'miconda/tagspot.vim' " prioritize nearby tags
    Plugin 'exvim/ex-utility' " exvim base library
    Plugin 'exvim/ex-tags' " enhanced tag listing
    Plugin 'exvim/ex-searchcompl' " tab suggestions in search bar
    Plugin 'exvim/ex-easyhl' " fast highlighting and replacement
    Plugin 'exvim/ex-minibufexpl' " open buffers bar

    if ! exists("g:gui_oni")
        Plugin 'scrooloose/nerdtree' " file browser
        Plugin 'Shougo/neocomplete' " autocomplete
        Plugin 'majutsushi/tagbar' " current file's tags sorted by scope
    endif

    " optional plugins
    Plugin 'mbbill/undotree' " history tree viewer
    Plugin 'tpope/vim-fugitive' " git wrapper
    Plugin 'fatih/vim-go' " go support
    Plugin 'exvim/ex-cref' " C reference manual quick access
    if ! exists("g:gui_oni")
        Plugin 'vim-airline/vim-airline' " status bar
        Plugin 'vim-airline/vim-airline-themes'
    endif

    " heavy wight plugins VVV
    Plugin 'Shougo/vimproc.vim'
    Plugin 'highwaynoise/chuck.vim'
    Plugin 'airblade/vim-gitgutter' " git diff in gutter (line no) bar
    Plugin 'ludovicchabant/vim-gutentags' " automatic tagger
    if ! exists("g:gui_oni")
        Plugin 'Shougo/neoinclude.vim' " autocomplete from include files
        Plugin 'Shougo/neco-syntax' " autocomplete syntax aware
    endif
    " Plugin 'scrooloose/syntastic' " syntax checking
    " Plugin 'myint/syntastic-extras' " syntax checker addons (make, json, politer python)

    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required


    """ plugins configs

    if ! exists("g:gui_oni")
        "" Airline
        let g:airline_theme='aurora'
        let g:airline_powerline_fonts=1
    endif

    "" Nerdcommenter
    let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default

    "" ctrlp - fast open
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlPMixed'
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " ignore files from .gitignore

    "" syntastic
    " set statusline+=%#warningmsg#
    " set statusline+=%{SyntasticStatuslineFlag()}
    " set statusline+=%*

    " let g:syntastic_always_populate_loc_list = 1
    " let g:syntastic_auto_loc_list = 1 " don't want it to show at startup
    " let g:syntastic_check_on_open = 1
    " let g:syntastic_check_on_wq = 0

    " let g:syntastic_cpp_check_header = 1
    " let g:syntastic_cpp_no_default_include_dirs = 1
    " let g:syntastic_cpp_remove_include_errors = 1

    " let g:syntastic_c_check_header = 1
    " let g:syntastic_c_no_default_include_dirs = 1
    " let g:syntastic_c_remove_include_errors = 1

    "" alternate
    let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:../libs,sfr:libs,sfr:include,wdr:include,wdr:source'


    if ! exists("g:gui_oni")
        "" neocomplete
        " Disable AutoComplPop.
        let g:acp_enableAtStartup = 0
        " Use neocomplete.
        let g:neocomplete#enable_at_startup = 1
        " Use smartcase.
        let g:neocomplete#enable_smart_case = 1
        " Set minimum syntax keyword length.
        let g:neocomplete#sources#syntax#min_keyword_length = 3
        " Set tag file max size (won't be read if bigger)
        let g:neocomplete#sources#buffer#cache_limit_size = 1000000

        " Define dictionary.
        let g:neocomplete#sources#dictionary#dictionaries = {
                    \ 'default' : '',
                    \ 'vimshell' : $HOME.'/.vimshell_hist',
                    \ 'scheme' : $HOME.'/.gosh_completions'
                    \ }

        " Define keyword.
        if !exists('g:neocomplete#keyword_patterns')
            let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns['default'] = '\h\w*'

        " Enable omni completion.
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

        " <CR>: close popup and save indent.
        inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
        function! s:my_cr_function()
            return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
            " For no inserting <CR> key.
            "return pumvisible() ? "\<C-y>" : "\<CR>"
        endfunction
        inoremap <expr><CR> pumvisible()? "\<C-y>" : "\<CR>"

        " <TAB>: completion.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    endif

    "" gutententags

    function Setup_gutentags(bn)
        let ext=system("basename ".a:bn." | egrep -o '[.][^.]+$' | tr -d '\n'")

        if (strlen(ext) <= 0)
            return 0
        endif

        if (match(['.c', '.h', '.cpp', '.hpp', '.cc'], ext) > -1)
            let ext="c"
            let g:gutentags_ctags_filter = '[.][ch][cp]?[p]?\$'
        elseif (match('.java', ext) > -1)
            let ext="java"
            let g:gutentags_ctags_filter = '[.][j][a][v][a]\$'
        else
            " generic filetype
            let filter = ""

            let c = 0
            while c < strchars(ext)
                if exists('strcharpart')
                    let filter .= "[".strcharpart(ext, c, 1)."]"
                else
                    let filter .= "[".strpart(ext, c, 1)."]"
                endif
                let c += 1
            endwhile

            let g:gutentags_ctags_filter = filter.'\$'

            let ext=substitute(ext, "[.]", "", "")
        endif

        let g:gutentags_ctags_tagfile = "tags_".ext
        let g:gutentags_file_list_command = "echo \"$(git ls-files 2> /dev/null)$(svn ls -R 2>/dev/null)\" | egrep '".g:gutentags_ctags_filter."' | grep -v 'match-overrun.c'"

        return 1
    endfunction

    let g:gutentags_init_user_func = "Setup_gutentags"

    "" undotree

    let g:undotree_SetFocusWhenToggle = 1
    let g:undotree_WindowLayout = 4
    let g:undotree_TreeNodeShape = "o"

    "" extags

    let g:ex_tags_ignore_case = 0


    "" mbe

    let g:miniBufExplCycleArround = 1
    let g:miniBufExplUseSingleClick = 1
    let g:miniBufExplShowBufNumbers = 0
    let g:miniBufExplBuffersNeeded = 0

    """ NON VUNDLE STUFF

    " Convenient command to see the difference between the current buffer and the
    " file it was loaded from, thus the changes you made.
    " Only define it when not defined already.
    if !exists(":DiffOrig")
        command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                    \ | wincmd p | diffthis
    endif

    " Return to last edit position when opening files
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif

    autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
    autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR


    if ! exists("g:gui_oni")
        "" NERDTree automatic following opened buffer
        " Check if NERDTree is open or active
        function! IsNERDTreeOpen()        
            return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
        endfunction

        " Call NERDTreeFind current window contains a modifiable file, and we're not in vimdiff
        function! SyncTree()
        endfunction

        function ToggleNERDTree()
            if(IsNERDTreeOpen())
                NERDTreeClose
            else
                if &modifiable && strlen(expand('%')) > 0 && !&diff
                    if (g:lastbuf == g:curbuf)
                        NERDTreeToggle
                    else
                        NERDTreeFind
                        let g:lastbuf = g:curbuf
                    endif
                else
                    NERDTreeToggle
                endif
            endif
        endfunction

        let g:lastbuf = ""


        "" A standalone function to set the working directory to the project's root, or 
        " to the parent directory of the current file if a root can't be found
        function! s:setcwd()
            let cph = expand('%:p:h', 1)
            if cph =~ '^.\+://' | retu | en
            for mkr in ['.git/', '.hg/', '.svn/', '.bzr/', '_darcs/', '.vimprojects']
                let wd = call('find'.(mkr =~ '/$' ? 'dir' : 'file'), [mkr, cph.';'])
                if wd != '' | let &acd = 0 | brea | en
            endfo
            exe 'lc!' fnameescape(wd == '' ? cph : substitute(wd, mkr.'$', '.', ''))
            let g:curbuf = bufname('$')
        endfunction

        autocmd BufEnter * call s:setcwd()
    endif

    function SmartClose()

        let wcount = winnr('$')

        for i in range(1, wcount)
            if getwinvar(i, '&buftype') == 'nofile' && getwinvar(i, '&filetype') == 'minibufexpl'
                let wcount = wcount-1
            endif
        endfor

        if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) <= 1  || &buftype != ''
            quit
        else
            MBEbd
            if wcount > 1
                quit
            endif
        endif

    endfunction

    """ misc stuff

    " color scheme
    set background=light
    "set t_Co=256
    colorscheme summerfruit256

    if &term =~ '256color'
        " Disable Background Color Erase (BCE) so that color schemes
        " work properly when Vim is used inside tmux and GNU screen.
        set t_ut=
    endif

    " mouse support
    if has('mouse')
        set mouse=a
    endif

    if(! &diff)
        set colorcolumn=80
    endif
    set ruler
    set number
    set scrolloff=3
    set whichwrap+=<,>,h,l
    set smartcase
    set gdefault
    set hlsearch
    set splitright

    " tabs
    :set tabstop=4
    :set shiftwidth=4
    :set expandtab


    """ key mappings
endif

if ! exists("g:gui_oni")

    if exists("realvim")
        " force neocomplete completion with Ctrl-n
        inoremap <expr><C-n>	neocomplete#start_manual_complete()

        " toggle tagbar with Ctrl-t
        nnoremap <C-t>		:TagbarToggle<CR>
        inoremap <C-t>		<Esc>:TagbarToggle<CR>i

        " toggle nerdtree with backtick (`)
        map ` :call ToggleNERDTree()<CR>

        nnoremap <Leader><Tab>		:MBEbn<CR>
        inoremap <Leader><Tab>		<Esc>:MBEbn<CR>i
        nnoremap <Leader><S-Tab>	:MBEbp<CR>
        inoremap <Leader><S-Tab>	<Esc>:MBEbp<CR>i
    endif

    noremap <A-Right>	<C-w><Right>
    noremap <A-Left>	<C-w><Left>
    noremap <A-Down>	<C-w><Down>
    noremap <A-Up>		<C-w><Up>
    noremap <C-l>		<C-w><Right>
    noremap <C-h>		<C-w><Left>
    noremap <C-j>		<C-w><Down>
    noremap <C-k>		<C-w><Up>

endif

if exists("realvim")
    " F2 and CTRL-b act as 'follow symbol' and 'go back' (CTRL-], CTRL-o)
    nnoremap <F2>	:EXTagsCWord<CR>
    inoremap <F2>	<Esc>:EXTagsCWord<CR>


    noremap [1	:EasyhlWord 1<CR>
    noremap [2	:EasyhlWord 2<CR>
    noremap [3	:EasyhlWord 3<CR>
    noremap [4	:EasyhlWord 4<CR>

    map [s		<Leader>sub

    map <F9>	<Leader>cr

    nnoremap <C-u>		:UndotreeToggle<CR>

    nnoremap <F4>	:A<CR>
    nnoremap <Leader>o	:IH<CR>

    " CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
    " so that you can undo CTRL-U after inserting a line break.
    inoremap <C-U> <C-G>u<C-U>

    nnoremap <F7>	:tp<CR>
    inoremap <F7>	<Esc>:tp<CR>i
    nnoremap <F8>	:tn<CR>
    inoremap <F8>	<Esc>:tn<CR>i

    noremap <C-q>		:call SmartClose()<CR>
endif

noremap <F3>	<C-o>
noremap <C-b>	<C-o>

noremap <X1Mouse> <C-o>
noremap <X2Mouse> <C-i>

noremap <A-PageDown>	:vs<CR>
noremap <A-PageUp>	:sp<CR>

noremap <C-n>		:vs<CR>
noremap <C-b>		:sp<CR>

