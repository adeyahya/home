local wk = require("which-key")

wk.register({
  t = {
    name = "Tab Navigation",
    e = { "<cmd>tabedit<cr>", "New Tab" },
    h = { "<cmd>tabprevious<cr>", "Prev Tab" },
    l = { "<cmd>tabnext<cr>", "Next Tab" }
  }
})
