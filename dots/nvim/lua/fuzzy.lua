-- Fuzzy finder configuration
require("fzf-lua").setup({
  winopts = {
    height = 0.85,
    width = 0.80,
    preview = {
      layout = "vertical",
      vertical = "down:45%",
    },
  },
  files = {
    prompt = "Files❯ ",
    cmd = "ag -l --nocolor --ignore vendor/bundle --ignore node_modules -g ''",
  },
  grep = {
    prompt = "Grep❯ ",
    cmd = "ag --nogroup --column --color",
  },
})
