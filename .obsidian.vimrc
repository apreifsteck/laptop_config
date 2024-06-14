" Have j and k navigate visual lines rather than logical ones
nmap h b
nmap t e

nmap n gj
nmap e gk

vmap n gj
vmap e gk

" Fold commands
exmap togglefold obcommand editor:toggle-fold
nmap F :togglefold

imap tg <Esc>
" Quickly remove search highlights
nmap <F9> :nohl

" Yank to system clipboard
set clipboard=unnamed




