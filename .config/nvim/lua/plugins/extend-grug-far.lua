return {
  {
    "MagicDuck/grug-far.nvim",
    keys = {
      {
        "<leader>sf",
        function()
          local grug = require("grug-far")
          local path = vim.fn.expand("%")
          grug.open({
            transient = true,
            prefills = {
              paths = path,
            },
          })
        end,
        mode = { "n", "v" },
        desc = "Search and Replace in current file",
      },
    },
  },
}
