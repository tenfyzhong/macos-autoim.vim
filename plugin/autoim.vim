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

function! s:im(event)
  if a:event == 'leave'
    call system('open -g "hammerspoon://saveAndSwitchToABC"')
    redraw!
  else
    call system('open -g "hammerspoon://recoverySaved"')
  endif
endfunction

augroup macos_autoim
  au!
  autocmd InsertEnter * call <sid>im('enter')
  autocmd InsertLeave * call <sid>im('leave')
augroup END
