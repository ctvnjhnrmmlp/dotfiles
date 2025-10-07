return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    sources = { "filesystem", "buffers", "git_status" },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      }
    },
    window = {
      position = "right",
      width = 50,
    },
    default_component_configs = {
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        default = "",
        highlight = "NeoTreeFileIcon",
      },
      git_status = {
        symbols = {
          added     = "✚",
          modified  = "",
          deleted   = "✖",
          renamed   = "󰁕",
          untracked = "",
          ignored   = "",
          unstaged  = "󰄱",
          staged    = "",
          conflict  = "",
        },
      },
    },
    renderers = {
      directory = {
        { "indent" },
        { "icon" },
        { "name",  use_git_status_colors = true },
      },
      file = {
        { "indent" },
        { "name",  use_git_status_colors = true },
        { "git_status", highlight = "NeoTreeDimText" },
      },
    },
    enable_git_status = true,
    enable_diagnostics = false,
  },
}
