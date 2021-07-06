" clear cache so this reloads changes.
" useful for development
" lua package.loaded['bogster'] = nil
" lua package.loaded['bogster.theme'] = nil
" lua package.loaded['bogster.colors'] = nil
" lua package.loaded['bogster.util'] = nil
lua package.loaded['bogster.config'] = nil

lua require('bogster').colorscheme()
