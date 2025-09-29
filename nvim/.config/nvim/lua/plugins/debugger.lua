return {
  {
    "mxsdev/nvim-dap-vscode-js",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("dap-vscode-js").setup({
        debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
        adapters = { "pwa-node", "pwa-chrome", "node-terminal" },
      })

      local dap = require("dap")

      local js_languages = { "javascript", "typescript", "javascriptreact", "typescriptreact" }

      for _, lang in ipairs(js_languages) do
        dap.configurations[lang] = {
          {
            name = "NestJS: Launch backend",
            type = "pwa-node",
            request = "launch",
            program = "${workspaceFolder}/src/main.ts",
            cwd = "${workspaceFolder}",
            runtimeExecutable = "node",
            runtimeArgs = { "-r", "ts-node/register" },
            sourceMaps = true,
            console = "integratedTerminal",
          },
          {
            name = "NestJS: Attach to process",
            type = "pwa-node",
            request = "attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
          {
            name = "Next.js: Launch frontend (Chrome)",
            type = "pwa-chrome",
            request = "launch",
            url = "http://localhost:3000",
            webRoot = "${workspaceFolder}",
            sourceMaps = true,
          },
          {
            name = "Next.js: Launch server",
            type = "pwa-node",
            request = "launch",
            program = "${workspaceFolder}/node_modules/.bin/next",
            args = { "dev" },
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
          },
        }
      end
    end,
  },
}

