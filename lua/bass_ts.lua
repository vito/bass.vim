local function setup()
  local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

  parser_config.bass = {
    install_info = {
      url = "https://github.com/vito/tree-sitter-bass",
      files = {"src/parser.c"},
      branch = "main",
      generate_requires_npm = false,
      requires_generate_from_grammar = false,
    },
  }
end

local M = {
  setup = setup
}

return M;
