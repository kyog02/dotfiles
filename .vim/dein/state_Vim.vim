if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/Kyog02/.vimrc'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/Kyog02/dotfiles/.vim/dein'
let g:dein#_runtime_path = '/Users/Kyog02/dotfiles/.vim/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/Users/Kyog02/dotfiles/.vim/dein/.cache/.vimrc'
let &runtimepath = '/Users/Kyog02/.vim,/Users/Kyog02/dotfiles/.vim/dein/repos/github.com/Shougo/vimproc.vim,/Users/Kyog02/dotfiles/.vim/dein//repos/github.com/Shougo/dein.vim,/Users/Kyog02/dotfiles/.vim/dein/.cache/.vimrc/.dein,/Applications/MacVim.app/Contents/Resources/vim/vimfiles,/Applications/MacVim.app/Contents/Resources/vim/runtime,/Applications/MacVim.app/Contents/Resources/vim/vimfiles/after,/Users/Kyog02/.vim/after,/Applications/MacVim.app/Contents/Resources/vim/plugins/autofmt,/Applications/MacVim.app/Contents/Resources/vim/plugins/golang,/Applications/MacVim.app/Contents/Resources/vim/plugins/kaoriya,/Applications/MacVim.app/Contents/Resources/vim/plugins/vimdoc-ja,/Applications/MacVim.app/Contents/Resources/vim/plugins/vimproc,/Users/Kyog02/dotfiles/.vim/dein/.cache/.vimrc/.dein/after'
filetype off
