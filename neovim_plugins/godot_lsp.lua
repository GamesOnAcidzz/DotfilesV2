return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.gdscript = {
        cmd = { "nc", "127.0.0.1", 6008 }, -- Connect to Godot's LSP
        filetypes = { "gdscript" },
      }
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, { name = "nvim_lsp" })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    opts = function(_, opts)
      opts.adapters.godot = {
        type = "server",
        host = "127.0.0.1",
        port = 6006,
      }
      opts.configurations.gdscript = {
        {
          type = "godot",
          request = "launch",
          name = "Launch scene",
          project = "${workspaceFolder}",
          launch_scene = true,
        },
      }
    end,
  },
}
