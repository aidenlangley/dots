require("mason").setup()

local mlspconfig = require("mason-lspconfig")
mlspconfig.setup({
	automatic_installation = true,
	ensure_installed = {
		"bashls",
		"jsonls",
		"pyright",
		"sumneko_lua",
		"volar",
		"yamlls",
	},
})

-- Automatically configures servers
mlspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})
	end,
	["rust_analyzer"] = function()
		require("rust-tools").setup({})
	end,
})

-- Prettier covers a number of different filetypes
local prettier_config = {
	filetypes = {
		-- Vanilla
		"html",
		"javascript",
		"css",
		"typescript",
		-- Frameworks
		"javascriptreact",
		"typescriptreact",
		"svelte",
		"vue",
		-- CSS flavours
		"scss",
		"less",
		"sass",
		-- JSON
		"json",
		"jsonc",
		-- Markdown & flavours of
		"markdown",
	},
	-- Always use the local version, the version of prettier has to
	-- remain consistent, so we don't want people to use their OS
	-- package
	only_local = "node_modules/.bin",
	condition = function(utils)
		return utils.root_has_file({ "node_modules" })
	end,
}

-- ESLint supports diagnostics & code_actions, so we use the same config for
-- both
local eslint_config = {
	filetypes = {
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
		"svelte",
		"vue",
	},
	prefer_local = "node_modules/.bin",
	condition = function(utils)
		return utils.root_has_file({ "node_modules" })
	end,
}

-- Ensure black prevents lines from being > 80 characters long when formatting
local black_config = { args = { "--line-length", "79" } }

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		-- lua
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.luacheck,
		-- sh/bash
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.diagnostics.shellcheck,
		-- Python
		null_ls.builtins.formatting.black.with(black_config),
		null_ls.builtins.formatting.isort,
		null_ls.builtins.diagnostics.flake8,
		-- Prettier
		null_ls.builtins.formatting.prettier.with(prettier_config),
		-- ESLint
		null_ls.builtins.diagnostics.eslint.with(eslint_config),
		null_ls.builtins.code_actions.eslint.with(eslint_config),
	},
})
