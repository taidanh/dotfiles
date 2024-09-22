"
" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk

" Go to beginning/end of line
nmap gh ^
nmap gl $

" Cycle between tabs
exmap tabprev obcommand workspace:previous-tab
nmap H :tabprev
exmap tabnext obcommand workspace:next-tab
nmap L :tabnext

" Focus on splits
exmap ftop obcommand editor:focus-top
nmap <C-k> :ftop
exmap fbottom obcommand editor:focus-bottom
nmap <C-j> :fbottom
exmap fleft obcommand editor:focus-left
nmap <C-h> :fleft
exmap fright obcommand editor:focus-right
nmap <C-l> :fright

" Have to unmap space to use it
unmap <Space>

" Save file
exmap save obcommand editor:save-file
nmap <Space>w :save

" Go to link
exmap follow obcommand editor:follow-link
" nmap gd :follow

" Open link in tab
exmap openintab obcommand editor:open-link-in-new-leaf
nmap gd :openintab

" Rename title
exmap rename obcommand workspace:edit-file-title
nmap <Space>r :rename

" Insert templates
exmap ins_temp obcommand templater-obsidian:insert-templater
nmap <Space>t :ins_temp

" Toggle zen mode
exmap zen obcommand obsidian-prozen:zenmode
nmap <Space>z :zen

" Toggle file explorer
exmap tleftbar obcommand app:toggle-left-sidebar
nmap <Space>e :tleftbar

" Toggle calendar
exmap trightbar obcommand app:toggle-right-sidebar
nmap <Space>E :trightbar

" Open today's note
exmap daily obcommand daily-notes
nmap <Space>d :daily

" Open cmd palette
exmap cmd obcommand command-palette:open
nmap <Space>sc :cmd

" Open file search
exmap fileSearch obcommand switcher:open
nmap <Space>sf :fileSearch

" Focus on global search input
exmap globalSearch obcommand global-search:open
nmap <Space>sg :globalSearch

" Close current tab
exmap close obcommand workspace:close
nmap <Space>c :close

" Paste into selection (for creating links)
map <Space>p :pasteinto

" Quickly remove search highlights
nmap <Space>h :nohl

" Splits
exmap vsplit obcommand workspace:split-vertical
nmap <Space>v :vsplit
exmap hsplit obcommand workspace:split-horizontal
nmap <Space>V :hsplit

" Surround
exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_backticks surround ` `
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }

map [[ :surround_wiki
nunmap s
vunmap s
map s" :surround_double_quotes
map s' :surround_single_quotes
map s` :surround_backticks
map sb :surround_brackets
map s( :surround_brackets
map s) :surround_brackets
map s[ :surround_square_brackets
map s] :surround_square_brackets
map s{ :surround_curly_brackets
map s} :surround_curly_brackets

" MY CHANGES

imap jk <Esc>
imap kj <Esc>

nmap j gj
nmap k gk

" unmap gJ
" exmap prevLinked obcommand breadcrumbs:
" nmap gJ

