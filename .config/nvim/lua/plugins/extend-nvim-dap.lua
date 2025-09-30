return {
  "neovim/nvim-lspconfig",
  opts = function()
    local dap = require("dap")
    dap.configurations.java = {
      { -- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
        -- classPaths = {},

        -- javaExec = "/usr/local/java/jdk-17.0.1/bin/java",
        mainClass = "${file}",
        name = "Lunch Current File",
        request = "launch",
        type = "java",
      },
    }
  end,
}
