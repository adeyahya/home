require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 50,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set("n", "<C-e>", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true, nowait = true })
