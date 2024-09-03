return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require('telescope').setup{
        defaults = {
          path_display = function (opts, path)
            -- Extract the filename
            local filename = path:match("([^/\\]+)$")

            -- Extract the pathname by removing the filename from the path
            local pathname = path:sub(1, #path - #filename)

            -- Construct the desired string
            local result = filename .. " " .. pathname

            return result
          end,
        }
      }
    end
  },
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
