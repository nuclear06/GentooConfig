return {
  {
    "stevearc/conform.nvim",
    opts = {
      -- formatters_by_ft = {
      --   ["markdown"] = { "prettier" },
      -- },
    },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2", "-ci" },
      },
    },
  },
}
