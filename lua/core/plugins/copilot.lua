return {
  "zbirenbaum/copilot.lua",
  build = ":Copilot auth",
  event = "InsertEnter",
  enabled = true,
  config = function()
    local utils = require("core.utils.functions")
    utils.map("n", "<leader>mc", "<cmd>Copilot enable<cr>", { desc = "Enable Copilot" })
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<C-l>",
          accept_word = false,
          accept_line = false,
          next = "<C-j>",
          prev = "<C-k>",
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        markdown = true,
        help = true,
        go = true,
        terraform = true,
        python = true,
        typescript = true,
        gitcommit = true,
        gitrebase = true,
        ["*"] = false,
      },
      panel = { enabled = false },
    })
  end,
}
