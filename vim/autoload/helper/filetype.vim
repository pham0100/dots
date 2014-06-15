" autoload/helper/filetype.vim - Global helpers for filetype plug-ins
" Maintainer:   Noah Frederick

" Append semicolon or comma to end of line in insert mode
function! helper#filetype#MakeSemicolonMaps()
  call helper#filetype#Map("inoremap", ";;", "<Esc>A;")
  call helper#filetype#Map("inoremap", ",,", "<Esc>A,")
endfunction

" Quickly type hash rockets ("=>")
function! helper#filetype#MakeRocketMaps()
  call helper#filetype#Map("inoremap", "<C-l>", "<Space>=><Space>")
endfunction

function! helper#filetype#MakeXMLMaps()
  " Automatically close tags when typing "</"
  call helper#filetype#Map("inoremap", "</", "</<C-x><C-o>")
endfunction

function! helper#filetype#Map(type, lhs, rhs)
  execute join([a:type, "<buffer>", a:lhs, a:rhs])
  if a:type == "nnoremap" || a:type == "nmap"
    let l:unmap = "nunmap"
  elseif a:type == "noremap" || a:type == "map"
    let l:unmap = "unmap"
  elseif a:type == "xnoremap" || a:type == "xmap"
    let l:unmap = "xunmap"
  elseif a:type == "vnoremap" || a:type == "vmap"
    let l:unmap = "vunmap"
  elseif a:type == "onoremap" || a:type == "omap"
    let l:unmap = "ounmap"
  elseif a:type == "inoremap" || a:type == "imap"
    let l:unmap = "iunmap"
  endif
  let b:undo_ftplugin .= join(["|", l:unmap, "<buffer>", a:lhs])
endfunction

" vim:set et sw=2:
