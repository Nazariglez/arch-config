lvim.plugins = {
  "simrat39/rust-tools.nvim",
  {
    "saecki/crates.nvim",
    version = "v0.3.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
        popup = {
          border = "rounded",
        },
      }
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
  },
  -- themes
  { "morhetz/gruvbox" },
  { "catppuccin/nvim", name = "catppuccin" },
  { "rebelot/kanagawa.nvim" },
  { "sainnhe/sonokai" },
  -- tmux integration
  { "christoomey/vim-tmux-navigator" },
  -- nice and visual TODO, FIXME, WARN, NOTE, etc..
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  -- change surroungs using cs" etc..
  { "tpope/vim-surround" },
  -- repeat commands easily
  { "tpope/vim-repeat" },
  -- hop between words with f<char> and letter
  {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("hop").setup()
    end,
  },
}
