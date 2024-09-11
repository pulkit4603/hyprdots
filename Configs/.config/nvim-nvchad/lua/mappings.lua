require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

local function run_cp_code()
  local filetype = vim.bo.filetype
  if filetype == "python" then
    vim.cmd("!python % < /home/pulkit/cp/input.txt > /home/pulkit/cp/output.txt")
  elseif filetype == "cpp" then
    vim.cmd("!g++ % -o %:r && %:r < /home/pulkit/cp/input.txt > /home/pulkit/cp/output.txt")
  else
    print("Unsuported file type for this keymap")
  end
end

-- Following is only for testing python code for competitive programming (cf = codeforces)
map("n", "<leader>cf", run_cp_code, {desc = "Test c++ or python CP code"})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
