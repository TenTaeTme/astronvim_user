-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- packagejson config manager
    ["<leader>ns"] = {
      function() require("package-info").show() end,
      desc = "show info package",
    },
    ["<leader>np"] = {
      function() require("package-info").change_version() end,
      desc = "change version package json",
    },
    ["<leader>nd"] = {
      function() require("package-info").delete() end,
      desc = "delete version package json",
    },
    ["<leader>ni"] = {
      function() require("package-info").install() end,
      desc = "install version package json",
    },
    ["<leader>fd"] = {
      function() require("telescope.builtin").lsp_definitions { jump_type = "never" } end,
      desc = "lsp definitions",
    },
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>aa"] = { "ggyG", desc = "Copy whole buffer" },
    ["<leader>ac"] = { "ggdG", desc = "Cut whole buffer" },
    ["<leader>pp"] = { '"0p', desc = "Put from 0 register" },
    ["<C-u>"] = { "<C-u>zz", desc = "Up and center" },
    ["<C-d>"] = { "<C-d>zz", desc = "Down and center" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    ["<leader>w"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
    ["<leader>q"] = { ":wqa<cr>", desc = "Save all and quit" }, -- change description but the same command
  },
  i = {},
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
