-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
end

local function neovide_run()
	vim.g.neovide_transparency = 0.8
	vim.g.transparency = 0.9
	vim.g.neovide_background_color = "#090110" .. alpha()
	vim.g.neovide_cursor_trail_length = 0

	vim.opt.guifont = "JetBrainsMono Nerd Font Mono"

	vim.g.gui_font_default_size = 13
	vim.g.gui_font_size = vim.g.gui_font_default_size
	vim.g.gui_font_face = "JetBrainsMono Nerd Font Mono"
	vim.g.neovide_remember_window_size = true

	vim.g.neovide_scroll_animation_length = 0
	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_cursor_trail_size = 0
	vim.g.neovide_cursor_antialiasing = true
	vim.g.neovide_cursor_animate_in_insert_mode = false
	vim.g.neovide_cursor_animate_command_line = false

	RefreshGuiFont = function()
		vim.opt.guifont = string.format("%s:h%s", vim.g.gui_font_face, vim.g.gui_font_size)
	end

	ResizeGuiFont = function(delta)
		vim.g.gui_font_size = vim.g.gui_font_size + delta
		RefreshGuiFont()
	end

	ResetGuiFont = function()
		vim.g.gui_font_size = vim.g.gui_font_default_size
		RefreshGuiFont()
	end

	-- Call function on startup to set default value
	ResetGuiFont()
	vim.g.neovide_input_use_logo = 1 -- enable use of the logo (cmd) key

	-- Keymaps
	local opts = { noremap = true, silent = true }

	vim.keymap.set({ "n", "i" }, "<C-=>", function()
		ResizeGuiFont(1)
	end, opts)
	vim.keymap.set({ "n", "i" }, "<C-->", function()
		ResizeGuiFont(-1)
	end, opts)

	vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
	vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})
	vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end

if vim.g.neovide then
	neovide_run()
end

--vim.cmd([[
--  if exists("g:neovide")
--    lua neovide_run()
--  endif
--]])
