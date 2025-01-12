vim9script

var colorscheme_list = [
    'quiet-mc',
    'lunaperche-mc',
    'sorbet-mc',
    'habamax',
    'retrobox',
    'wildcharm',
    'zaibatsu',
]

def ColorSchemesMenu(my_colors: list<string>)
    popup_create(my_colors, {
        title: " Select a color scheme ",
        filter: (id, key) => {
            if key == "\<esc>" || key == "\<cr>"
                popup_close(id, -1)
                return
            elseif key == 'j'
                win_execute(id, "normal! j")
            elseif key == 'k'
                win_execute(id, "normal! k")
            endif
            exe $"colorscheme {my_colors[getcurpos(id)[1] - 1]}"
            return true
        },
        cursorline: true,
        highlight: 'Question',
        padding: [0, 1, 0, 1],
        border: [1, 1, 1, 1]
    })
enddef

nnoremap <space>cc <scriptcmd>ColorSchemesMenu(colorscheme_list)<CR>
