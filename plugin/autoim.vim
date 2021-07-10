if !has('mac')
  finish
endif

if version < 802 
  echoerr "macos-autoim: 请把升级到8.2"
  finish
endif

if exists('g:loaded_macos_autoim_vim')
  finish
endif
const g:loaded_macos_autoim_vim = 1

let s:root = expand('<sfile>:p:h:h')
let s:saved_input = 0

function! s:is_abc()
  let res = system(s:root . '/bin/is_abc.sh')
  if trim(res) != ''
    return 1
  else
    return 0
  endif
endfunction

function! s:im(event)
  let cur_input = <SID>is_abc()
  let switch = 0
  if a:event == 'leave'
    if !cur_input
      " switch to abc input method
      let switch = 1
    endif
  else
    if cur_input && !s:saved_input
      " switch to the saved input method
      let switch = 1
    endif
  endif
  let s:saved_input = cur_input
  if switch
    exec printf('silent !osascript %s/bin/ctrl_space.scpt', s:root)
    redraw!
  endif
endfunction

augroup macos_autoim
  au!
  autocmd VimEnter * let s:saved_input = <SID>is_abc()
  autocmd InsertEnter * call <sid>im('enter')
  autocmd InsertLeave * call <sid>im('leave')
augroup END
