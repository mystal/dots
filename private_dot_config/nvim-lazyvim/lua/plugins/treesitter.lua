return {
  -- Add more treesitter languages
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "kdl",
        "just",
      },
    },
  },
}
