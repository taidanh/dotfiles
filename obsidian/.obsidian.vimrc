" DIDN'T WORK ~~operate on full words instead of "programming words"~~
" " nmap w W
" " nmap W w

" " nnoremap <expr> w (v:count == 0 ? 'W' : 'w')
" " nnoremap <expr> W (v:count == 0 ? 'w' : 'W')

" " vnoremap w W
" " vnoremap W w

" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk

" Go to beginning/end of line
nmap gh ^
nmap gl $

" Cycle between tabs
exmap tabprev obcommand workspace:previous-tab
nmap H :tabprev<CR>
exmap tabnext obcommand workspace:next-tab
nmap L :tabnext<CR>

" Focus on splits
exmap ftop obcommand editor:focus-top
nmap <C-k> :ftop<CR>
exmap fbottom obcommand editor:focus-bottom
nmap <C-j> :fbottom<CR>
exmap fleft obcommand editor:focus-left
nmap <C-h> :fleft<CR>
exmap fright obcommand editor:focus-right
nmap <C-l> :fright<CR>

" Have to unmap space to use it
unmap <Space>

" Save file
exmap save obcommand editor:save-file
nmap <Space>w :save<CR>

" Go to link
exmap follow obcommand editor:follow-link
nmap gD :follow<CR>

" Open link in tab
exmap openintab obcommand editor:open-link-in-new-leaf
nmap gd :openintab<CR>

" Rename title
exmap rename obcommand workspace:edit-file-title
nmap <Space>r :rename<CR>

" Insert templates
exmap ins_temp obcommand templater-obsidian:insert-templater
nmap <Space>t :ins_temp<CR>

" Toggle zen mode
exmap zen obcommand obsidian-prozen:zenmode
nmap <Space>z :zen<CR>

" Toggle file explorer
exmap tleftbar obcommand app:toggle-left-sidebar
nmap <Space>e :tleftbar<CR>

" Toggle calendar
exmap trightbar obcommand app:toggle-right-sidebar
nmap <Space>E :trightbar<CR>

" Open today's note
exmap daily obcommand daily-notes
nmap <Space>d :daily<CR>

" Open cmd palette
exmap cmd obcommand command-palette:open
nmap <Space>sc :cmd<CR>

" Open file search
exmap fileSearch obcommand switcher:open
nmap <Space>sf :fileSearch<CR>

" Focus on global search input
exmap globalSearch obcommand global-search:open
nmap <Space>sg :globalSearch<CR>

" Close current tab
exmap close obcommand workspace:close
nmap <Space>c :close<CR>

" Paste into selection (for creating links)
map <Space>p :pasteinto<CR>

" Quickly remove search highlights
nmap <Space>h :nohl<CR>

" Splits
exmap vsplit obcommand workspace:split-vertical
nmap <Space>v :vsplit<CR>
exmap hsplit obcommand workspace:split-horizontal
nmap <Space>V :hsplit<CR>

" Surround
exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_backticks surround ` `
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }

map [[ :surround_wiki<CR>
nunmap s
vunmap s
map s" :surround_double_quotes<CR>
map s' :surround_single_quotes<CR>
map s` :surround_backticks<CR>
map sb :surround_brackets<CR>
map s( :surround_brackets<CR>
map s) :surround_brackets<CR>
map s[ :surround_square_brackets<CR>
map s] :surround_square_brackets<CR>
map s{ :surround_curly_brackets<CR>
map s} :surround_curly_brackets<CR>

" MY CHANGES

imap jk <Esc>
imap kj <Esc>

nmap j gj
nmap k gk

" unmap gJ
" exmap prevLinked obcommand breadcrumbs:
" nmap gJ

