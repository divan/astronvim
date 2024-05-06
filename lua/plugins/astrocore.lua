-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = false, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapLeader` and `maplocalLeader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        
        -- smart splits
        -- ["<Up>"] = { function() require("smart-splits").resize_up(2) end, desc = "Resize split up" },
        -- ["<Down>"] = { function() require("smart-splits").resize_down(2) end, desc = "Resize split down" },
        ["<Left>"] = { function() require("smart-splits").resize_left(2) end, desc = "Resize split left" },
        ["<Right>"] = { function() require("smart-splits").resize_right(2) end, desc = "Resize split right" },

        -- switch buffers with tab
        ["<Tab>"] = {
          function()
            if #vim.t.bufs > 1 then
              require("telescope.builtin").buffers { sort_mru = true, ignore_current_buffer = true }
            else
              astro_utils.notify "No other buffers open"
            end
          end,
          desc = "Switch Buffers",
        },

        -- my keys
        ["<Leader>fe"] = { "<cmd>Telescope file_browser<cr>", desc = "File explorer" },
        ["<Leader>re"] = { "<cmd>Telescope resume<cr>", desc = "Last search" },
        ["<C-p>"] = { "<cmd>Telescope fd<cr>", desc = "Files" },
        ["cd"] = { "<cmd>:lua vim.lsp.buf.code_action()<cr>", desc = "Code action" },
        ["<Leader>t"] = { "<cmd>:lua  require('aerial').toggle()<cr>", desc = "Toggle outline" },
        ["<C-t>"] = { "<cmd>:FlutterOutlineToggle<cr>", desc = "Toggle Flutter outline" },
        ["<Leader>r"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
        ["<Leader>a"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go to definition" },
        ["<C-j>"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go to definition" },
        ["<Leader>v"] = { "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", desc = "Go to definition (vertical)" },
        ["<Leader>s"] = { "<cmd>belowright split | lua vim.lsp.buf.definition()<cr>", desc = "Go to definition (below)" },
        ["<Leader>ii"] = { "<cmd>CopilotChatVisual<cr>", desc = "CopilotChat with buffer" },

        -- copilot chat
        ["<Leader>i"] = {
          function()
            local input = vim.fn.input "Quick Chat: "
            if input ~= "" then vim.cmd("CopilotChatBuffer " .. input) end
          end,
          desc = "CopilotChat - Quick chat",
        },

        ["<Leader>."] = { "<cmd>cd %:p:h<cr>", desc = "Set CWD" },
        ["<Leader>fp"] = { function() require("telescope").extensions.projects.projects {} end, desc = "Find projects" },
        ["<Leader>x"] = { desc = "裂Trouble" },
        ["<Leader>xx"] = { "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
        ["<Leader>xX"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
        ["<Leader>xl"] = { "<cmd>TroubleToggle loclist<cr>", desc = "Location List (Trouble)" },
        ["<Leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List (Trouble)" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
