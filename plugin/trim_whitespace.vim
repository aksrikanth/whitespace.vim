if exists("b:trim_white_spaces_loaded")
  finish
endif
let b:trim_white_spaces_loaded = 1
let [g:trim_ws_trailing, g:trim_ws_condense, g:trim_ws_eof] = [1, 1, 1]

function! s:TrimWhiteSpace()
  let row = line('.')
  let col = col('.')
  if g:trim_ws_trailing
    silent! %s/\s*$//  " remove trailing whitespace
  end
  if g:trim_ws_condense
    silent! %s/\n\{3,}/\r\r/e  " condense consecutive blank lines
  end
  if g:trim_ws_eof
    silent! %s/\($\n\s*\)\+\%$//  " remove trailing blank lines
  end
  call cursor(row, col)
endfunction

autocmd BufWritePre * :call s:TrimWhiteSpace()
