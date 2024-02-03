return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "mfussenegger/nvim-dap-python",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        local debugpyPythonPath = require("mason-registry").get_package("debugpy"):get_install_path()
            .. "/venv/bin/python3"


        local dappython = require("dap-python")
        dappython.setup(debugpyPythonPath)
        dappython.test_runner = 'pytest'

        dapui.setup()

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        --[[
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
        --]]

        vim.keymap.set('n', '<leader>dtm', dappython.test_method, {})
        vim.keymap.set('n', '<leader>dso', dap.step_over, {})
        vim.keymap.set('n', '<leader>dsi', dap.step_into, {})
        vim.keymap.set('n', '<leader>duc', dapui.close, {})
        vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {})
        vim.keymap.set('n', '<leader>dc',
            function()
                dap.continue()
                vim.cmd.Neotree('close')
            end
            , {})

        --[[vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
        vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
        vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })
        --]]

        vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint' })
        vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DapBreakpoint' })
        vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DapBreakpoint' })
        vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint' })
        vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped' })
    end,
}
