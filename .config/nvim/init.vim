syntax on

set clipboard+=unnamedplus
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set smartindent
set nu
set nowrap
set mouse=a
set smartcase
set nobackup
" set undodir=~/.vim/undodir
set undofile
set incsearch
set number relativenumber
set termguicolors
set scrolloff=11

set completeopt=menuone,noinsert,noselect
set shortmess+=c
" set spell

set wildmode=longest,list,full

" set colorcolumn=80

" highlight ColorColumn ctermbg=0 guibg=lightgrey
highlight CocFloating ctermbg=0 guibg=Gray
highlight CocErrorFloat ctermfg=0 guibg=Gray
highlight Pmenu ctermfg=0 guibg=Gray

command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_syntax_conceal = 0
let g:markdown_minlines = 100

    set nocompatible
    if has("autocmd")
      filetype plugin indent on
    endif
"let g:airline#extensions#tabline#enabled = 0
"let g:airline_extensions = []

"let g:vimwiki_list = [{'path': '~/vimwiki/',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]

" Key mappings
map <C-B> :vs<CR>:Ntree<CR>
map <C-N> :q!<CR>
map <C-H> :Goyo<CR>
map <C-K> :CocEnable<CR>
map <C-J> :CocDisable<CR>
map <C-G> :colorscheme codedark<CR>
map <C-C> :colorscheme material<CR>
map <C-T> :colorscheme default<CR>
map <C-S> :colorscheme gruvbox<CR>
map <C-L> :set wrap<CR>
map <C-P> :set nowrap<CR>
map <C-I> :noh<CR>
map <C-_> :vimgrep 
map <C-W> :foldclose<CR>
map <C-Q> :foldopen<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
imap <C-P> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

" PLUGINS
call plug#begin('~/.local/share/nvim/plugged')

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'masukomi/vim-markdown-folding'
Plug 'vimwiki/vimwiki'

" Function
"Plug 'scrooloose/nerdtree'
Plug 'jremmen/vim-ripgrep'
Plug 'vim-utils/vim-man'
Plug 'godlygeek/tabular'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'simrat39/rust-tools.nvim'
Plug 'hrsh7th/vim-vsnip'

" Fuzzy Finder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


" Pretty
Plug 'ap/vim-css-color'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'junegunn/goyo.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'marko-cerovac/material.nvim'

call plug#end()

lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
END

colorscheme material

lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = true,

  -- List of parsers to ignore installing
  ignore_install = { "" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = { "" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration
lua <<EOF
local nvim_lsp = require'lspconfig'

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)
EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
"lua <<EOF
"local cmp = require'cmp'
"cmp.setup({
"  -- Enable LSP snippets
"  snippet = {
"    expand = function(args)
"        vim.fn["vsnip#anonymous"](args.body)
"    end,
"  }),
"
"cmp.setup.filetype({ 'markdown', 'help', 'vimwiki' }, {
"    sources = {
"      { name = 'path' },
"      { name = 'buffer' },
"    },
"  
"
"  mapping = {
"    -- Add tab support
"    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
"    ['<Tab>'] = cmp.mapping.select_next_item(),
"    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
"    ['<C-f>'] = cmp.mapping.scroll_docs(4),
"    ['<C-Space>'] = cmp.mapping.complete(),
"    ['<C-e>'] = cmp.mapping.close(),
"    ['<CR>'] = cmp.mapping.confirm({
"      behavior = cmp.ConfirmBehavior.Insert,
"      select = true,
"    })
"  },
"
"  -- Installed sources
"  sources = {
"    { name = 'nvim_lsp' },
"    { name = 'vsnip' },
"    { name = 'path' },
"    { name = 'buffer' },
"  },
"})
"EOF

autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
