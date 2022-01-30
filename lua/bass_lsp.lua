local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'

local function setup()
  configs.bass = {
    default_config = {
      cmd = {'bass', '--lsp'};
      filetypes = {'bass'};
      root_dir = function(fname)
        return lspconfig.util.find_git_ancestor(fname)
      end;
    };

    docs = {
      description = [[https://github.com/vito/bass]],
    };
  };
end

local M = {
  setup = setup
}

return M;
