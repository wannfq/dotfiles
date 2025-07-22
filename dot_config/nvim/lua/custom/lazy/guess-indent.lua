return {
    'nmac427/guess-indent.nvim',
    lazy = true,
    cmd = 'GuessIndent',
    event = {
        'BufReadPre',
        'BufNewFile',
    },
    config = function()
        require('guess-indent').setup {}
    end,
}
