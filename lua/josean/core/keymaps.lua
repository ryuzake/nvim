vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("i", "JK", "<ESC>", { desc = "Exit insert mode with JK" })

-- Navigate in insert mode
keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" })
keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" })
keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" })
keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- run programing lang
keymap.set("n", "<leader>rf", function()
  local filetype = vim.bo.filetype
  if filetype == "lua" then
    vim.cmd("!lua %")
  elseif filetype == "python" then
    vim.cmd("UVRunFile")
  elseif filetype == "rust" then
    if vim.fn.filereadable("Cargo.toml") == 1 then
      vim.cmd("!cargo run")
    else
      vim.cmd("!rustc % && ./" .. vim.fn.expand("%:r"))
    end
  elseif filetype == "nim" then
    vim.cmd("!nim r %")
  elseif filetype == "go" then
    vim.cmd("!go run %")
  else
    print("this file type is not supported yet " .. filetype)
  end
end, { desc = "Run current file based on filetype" })
