local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- packer can manage itself

	-- File explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        }
    }
	-- Indent line
	use 'lukas-reineke/indent-blankline.nvim'

	-- Autopair
	use { 'windwp/nvim-autopairs',
	config = function()
		require('nvim-autopairs').setup{}
	end}

	-- Icons
	use 'kyazdani42/nvim-web-devicons'

	-- Treesitter interface
	use {
	'nvim-treesitter/nvim-treesitter',
	run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
	}

	-- Color schemes
	use { 'bluz71/vim-moonfly-colors', as = 'moonfly' }

  -- Statusline
	use { 'nvim-lualine/lualine.nvim',
	requires = { 'kyazdani42/nvim-web-devicons', opt = true },
	config = function()
		require('lualine').setup({
			options = {
				theme = "moonfly",
			}
		})
	end,}

  -- CoC.Nvim
	use {'neoclide/coc.nvim', branch = 'release'}

  -- git labels
	use {
	'lewis6991/gitsigns.nvim',
	requires = { 'nvim-lua/plenary.nvim' },
	config = function()
		require('gitsigns').setup{}
	end}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  	if packer_bootstrap then
		require('packer').sync()
	end
end)
