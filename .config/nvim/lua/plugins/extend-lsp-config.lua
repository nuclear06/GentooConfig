return {
  "neovim/nvim-lspconfig",
  opts = {
    codelens = {
      enabled = true
    },
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            codeLens = {
              enable = false,
            }
          }
        }
      }
    }
  }
}
