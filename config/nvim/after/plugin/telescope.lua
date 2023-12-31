local wk = require("which-key")
require("telescope").setup({
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case"
    }
  }
})

local builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<C-p>", builtin.find_files, {})
-- vim.keymap.set("n", "ff", builtin.find_files, {})
-- vim.keymap.set("n", "fg", builtin.live_grep, {})
-- vim.keymap.set('n', 'fb', builtin.buffers, {})
-- vim.keymap.set('n', 'fh', builtin.help_tags, {})
wk.register({
  f = {
    name = "file",
    f = { builtin.find_files, "Find File" },
    g = { builtin.live_grep, "Live Grep" },
    b = { builtin.buffers, "Find Buffers" },
    h = { builtin.help_tags, "Find Help Tags" }
  }
})
