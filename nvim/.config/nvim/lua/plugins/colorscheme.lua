return {
  {
    "tiesen243/vercel.nvim",
    lazy = false,
    opts = {
      theme = "dark",
      transparent = false,
      italics = {
        comments = false,
        keywords = false,
        strings = false,
        functions = false,
        variables = false,
        bufferline = false,
      },
    },
    config = function(_, opts)
      require("vercel").setup(opts)
      vim.cmd.colorscheme("vercel")
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          local black = "#000000"
          local groups = {
            "Normal",
            "NormalNC",
            "NormalFloat",
            "SignColumn",
            "LineNr",
            "CursorLine",
            "CursorLineNr",
            "EndOfBuffer",
            "StatusLine",
            "StatusLineNC",
            "WinSeparator",
          }
          for _, group in ipairs(groups) do
            vim.api.nvim_set_hl(0, group, { bg = black })
          end
        end,
      })
      vim.defer_fn(function()
        vim.cmd("colorscheme vercel")
      end, 50)
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vercel",
    },
  },
}
