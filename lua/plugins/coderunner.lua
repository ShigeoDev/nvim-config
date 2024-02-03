return {
    "CRAG666/code_runner.nvim",
    config = function()
        require('code_runner').setup({
            mode = "float",
            float = {
                close_key = "q",
                border = "rounded",
            },
            filetype = {
                java = {
                    "cd $dir &&",
                    "javac $fileName &&",
                    "java $fileNameWithoutExt"
                },
                python = "python3 -u",
                typescript = "deno run",
                rust = {
                    "cd $dir &&",
                    "rustc $fileName &&",
                    "$dir/$fileNameWithoutExt"
                },
            },
        })

        vim.keymap.set('n', '<leader>run', ':RunFile<CR>', { noremap = true, silent = false })
    end,
}
