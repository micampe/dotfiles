let s:lspServers = [#{
            \   name: 'pylsp',
            \   filetype: 'python',
            \   path: 'pylsp',
            \   args: []
            \ }, #{
            \   name: 'swiftls',
            \   filetype: ['swift'],
            \   path: 'xcrun',
            \   args: ['sourcekit-lsp']
            \ }, #{
            \   name: 'clangd',
            \   filetype: ['c', 'cpp'],
            \   path: 'clangd',
            \   args: ['--background-index']
            \  }]

let s:lspOptions = #{
            \   autoComplete: v:false,
            \   showDiagInPopup: v:false,
            \   showDiagOnStatusLine: v:true,
            \   showInlayHints: v:true,
            \}

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=g:LspOmniFunc
    setlocal tagfunc=lsp#lsp#TagFunc
    setlocal formatexpr=lsp#lsp#FormatExpr()
    setlocal keywordprg=:LspHover

    nmap <buffer> gd :LspGotoDefinition<cr>
    nmap <buffer> gs :LspDocumentSymbol<cr>
    nmap <buffer> gt :LspGotoTypeDefinition<cr>
    nmap <buffer> gr :LspShowReferences<cr>
    nmap <buffer> <space>rn :LspRename<cr>
    nmap <buffer> [g :LspDiag prev<cr>
    nmap <buffer> ]g :LspDiag next<cr>
endfunction

function! s:on_lsp_setup() abort
    call LspAddServer(s:lspServers)
    call LspOptionsSet(s:lspOptions)
endfunction

augroup lsp_setup
    au!
    autocmd User LspSetup call s:on_lsp_setup()
augroup END

augroup lsp_install
    au!
    autocmd User LspAttached call s:on_lsp_buffer_enabled()
augroup END
