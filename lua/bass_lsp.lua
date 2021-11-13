local configs = require('lspconfig/configs')
local util = require('lspconfig/util')

local function setup()
  configs.bass = {
    default_config = {
      cmd = { 'bass-lsp' },
      filetypes = { 'bass' },
      root_dir = util.root_pattern('.git')
    },

    docs = {
      description = [[https://github.com/vito/bass]],
    },
  };
end

local M = {
  setup = setup
}

return M;
