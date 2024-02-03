return {
    'windwp/nvim-autopairs',
    opts = {}, -- this is equalent to setup({}) function
    config = function()
        require("nvim-autopairs").setup({})
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )
    end

}
