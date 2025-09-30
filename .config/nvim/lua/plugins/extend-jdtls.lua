return {
  "mfussenegger/nvim-jdtls",
  opts = {
    settings = {
      java = {
        SaveActions = {
          organizeImports = true,
        },
        implementationsCodeLens = {
          enabled = true,
        },
        referencesCodeLens = {
          enabled = true,
        },
        signatureHelp = {
          enabled = true,
        },

        inlayHints = {
          parameterNames = {
            enabled = "all",
          },
          referencesCodeLens = {
            enabled = true,
          },
          signatureHelp = {
            enabled = true,
          },
          implementationsCodeLens = {
            enabled = true,
          },
        },
      },
    },
  },
}
