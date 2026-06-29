require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

-- Rust tests
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Run Rust tests" })

-- Rust commands útiles
map("n", "<Leader>rr", "<cmd>lua vim.cmd('RustLsp runnables')<CR>", { desc = "Rust runnables" })
map("n", "<Leader>re", "<cmd>lua vim.cmd('RustLsp expandMacro')<CR>", { desc = "Expand Rust macro" })
map("n", "<Leader>rc", "<cmd>lua vim.cmd('RustLsp openCargo')<CR>", { desc = "Open Cargo.toml" })


-- Python shortcuts
map("n", "<Leader>pr", "<cmd>!python3 %<CR>", { desc = "Run Python file" })
map("n", "<Leader>pi", "<cmd>terminal ipython<CR>", { desc = "Open IPython" })
map("n", "<Leader>pp", "<cmd>!python3 -m pytest %<CR>", { desc = "Run pytest on file" })
