local utils = require("core.utils.functions")
M = {}

-- TODO: refactor
-- must be global or the initial state is not working
VIRTUAL_TEXT_ACTIVE = false
-- toggle displaying virtual text
M.toggle_virtual_text = function()
  VIRTUAL_TEXT_ACTIVE = not VIRTUAL_TEXT_ACTIVE
  utils.notify(
    string.format("Virtualtext %s", VIRTUAL_TEXT_ACTIVE and "on" or "off"),
    vim.log.levels.INFO,
    "lsp/utils.lua"
  )
  vim.diagnostic.show(nil, 0, nil, { virtual_text = VIRTUAL_TEXT_ACTIVE })
end

-- TODO: refactor
-- must be global or the initial state is not working
AUTOFORMAT_ACTIVE = false
-- toggle null-ls's autoformatting
M.toggle_autoformat = function()
  AUTOFORMAT_ACTIVE = not AUTOFORMAT_ACTIVE
  utils.notify(
    string.format("Autoformatting %s", AUTOFORMAT_ACTIVE and "on" or "off"),
    vim.log.levels.INFO,
    "lsp.utils"
  )
end

return M
