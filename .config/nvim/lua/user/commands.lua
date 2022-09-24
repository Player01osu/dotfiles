local create_user_command = vim.api.nvim_create_user_command

--                 cmd name          command           opts
create_user_command('Erc', 'e ~/.config/nvim/init.lua', {})
