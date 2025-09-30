return {
  "saghen/blink.cmp",
  version = "0.13.1",
  dependencies = {
    "moyiz/blink-emoji.nvim",
  },
  opts = {
    appearance = {
      -- sets the fallback highlight groups to nvim-cmp's highlight groups
      -- useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release, assuming themes add support
      use_nvim_cmp_as_default = false,
      -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono",
    },
    completion = {
      accept = {
        -- experimental auto-brackets support
        auto_brackets = {
          enabled = true,
        },
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },
      menu = {
        -- border = "single",
        draw = {
          -- treesitter = { "lsp" },
          columns = {
            { "item_idx" },
            { "kind_icon" },
            -- We don't need label_description now because label and label_description are already
            -- combined together in label by colorful-menu.nvim.
            { "label", gap = 1 },
            { "kind" },
          },
          components = {
            label = {
              text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
              end,
            },
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                return kind_icon
              end,
              -- Optionally, you may also use the highlights from mini.icons
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },

            item_idx = {
              text = function(ctx)
                return ctx.idx == 10 and "0" or ctx.idx >= 10 and " " or tostring(ctx.idx)
              end,
              highlight = "BlinkCmpItemIdx", -- optional, only if you want to change its color
            },
          },
        },
      },
      documentation = {
        window = { border = "single" },
        auto_show = true,
        auto_show_delay_ms = 200,
      },
      ghost_text = {
        enabled = vim.g.ai_cmp,
      },
    },

    signature = {
      enabled = true,
      window = { border = "single" },
    },

    sources = {
      -- adding any nvim-cmp sources here will enable them
      -- with blink.compat
      compat = {},
      default = { "emoji", "lsp", "path", "snippets", "buffer", "copilot" },
      providers = {
        emoji = {
          module = "blink-emoji",
          name = "Emoji",
          score_offset = 15, -- Tune by preference
        },
        lsp = {
          name = "lsp",
          module = "blink.cmp.sources.lsp",
          score_offset = 900,
        },
        -- this source will check ~/.config/nvim/snippets for custom snippets
        -- only support vscode stlye snippets
        snippets = {
          -- enabled = false,
          name = "snippets",
          module = "blink.cmp.sources.snippets",
          score_offset = 910,
          min_keyword_length = 2,
          max_items = 4,
          should_show_items = function(ctx)
            return ctx.trigger.initial_kind ~= "trigger_character"
          end,
        },
        path = {
          score_offset = 1000,
        },
        buffer = {
          score_offset = 600,
        },
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          score_offset = 10,
        },
      },
    },
    cmdline = {
      enabled = false,
    },
    keymap = {
      preset = "enter",
      ["<C-e>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-p>"] = {
        function(cmp)
          if cmp.is_visible() then
            cmp.hide() -- 如果补全窗口打开，则关闭
          else
            cmp.show() -- 如果补全窗口未打开，则唤出
          end
        end,
      },
      ["<A-1>"] = {
        function(cmp)
          cmp.accept({ index = 1 })
        end,
      },
      ["<A-2>"] = {
        function(cmp)
          cmp.accept({ index = 2 })
        end,
      },
      ["<A-3>"] = {
        function(cmp)
          cmp.accept({ index = 3 })
        end,
      },
      ["<A-4>"] = {
        function(cmp)
          cmp.accept({ index = 4 })
        end,
      },
      ["<A-5>"] = {
        function(cmp)
          cmp.accept({ index = 5 })
        end,
      },
      ["<A-6>"] = {
        function(cmp)
          cmp.accept({ index = 6 })
        end,
      },
      ["<A-7>"] = {
        function(cmp)
          cmp.accept({ index = 7 })
        end,
      },
      ["<A-8>"] = {
        function(cmp)
          cmp.accept({ index = 8 })
        end,
      },
      ["<A-9>"] = {
        function(cmp)
          cmp.accept({ index = 9 })
        end,
      },
      ["<A-0>"] = {
        function(cmp)
          cmp.accept({ index = 10 })
        end,
      },
    },
  },
}
