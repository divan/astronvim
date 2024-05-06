return {
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = {
    show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
    debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
    disable_extra_info = "yes", -- Disable extra information (e.g: system prompt) in the response.
    language = "English", -- Copilot answer language settings when using default prompts. Default language is English.
    clear_chat_on_new_prompt = "yes",
    -- proxy = "socks5://127.0.0.1:3000", -- Proxies requests via https or socks.
    -- temperature = 0.1,
    -- prompts = {
    --   Explain = "Explain how it works.",
    --   Review = "Review the following code and provide concise suggestions.",
    --   Tests = "Briefly explain how the selected code works, then generate unit tests.",
    --   Refactor = "Refactor the code to improve clarity and readability.",
    -- },
  },
  build = function()
    vim.notify "Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim."
  end,
  event = "VeryLazy",
  -- keys = function()
  --   local keybinds = {
  --     --add your custom keybinds here
  --   }
  --   -- change prompt and keybinds as per your need
  --   local my_prompts = {
  --     { prompt = "Help with this", desc = "Help", key = "h" },
  --     { prompt = "Simplify and improve readablilty", desc = "Simplify", key = "s" },
  --     { prompt = "Optimize the code to improve performance and readablilty.", desc = "Optimize", key = "o" },
  --     { prompt = "Find possible errors and fix them for me", desc = "Fix", key = "f" },
  --     { prompt = "Explain in detail", desc = "Explain", key = "e" },
  --     { prompt = "Write a shell script", desc = "Shell", key = "S" },
  --   }
  --   -- you can change <leader>cc to your desired keybind prefix
  --   for _, v in pairs(my_prompts) do
  --     table.insert(keybinds, {
  --       "<leader>cc" .. v.key,
  --       ":CopilotChatVisual " .. v.prompt .. "<cr>",
  --       mode = "x",
  --       desc = "CopilotChat - " .. v.desc,
  --     })
  --     table.insert(
  --       keybinds,
  --       { "<leader>cc" .. v.key, "<cmd>CopilotChat " .. v.prompt .. "<cr>", desc = "CopilotChat - " .. v.desc }
  --     )
  --   end
  --   return keybinds
  -- end,
}
