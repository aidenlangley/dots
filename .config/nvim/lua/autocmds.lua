-- Automatically format on save. To circumvent this behaviour, the autocmd
-- will need to be disabled ad-hoc.
vim.api.nvim_create_augroup("lsp_format_on_save", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	group = "lsp_format_on_save",
	pattern = "*",
	callback = function()
		vim.lsp.buf.format({
			timeout_ms = 1000,
			filter = function(client)
				local filetype = vim.bo.filetype
				local n = require("null-ls")
				local s = require("null-ls.sources")
				local method = n.methods.FORMATTING
				local available_formatters = s.get_available(filetype, method)

				if #available_formatters > 0 then
					return client.name == "null-ls"
				elseif client.supports_method("textDocument/formatting") then
					return true
				else
					return false
				end
			end,
		})
	end,
})

vim.api.nvim_create_augroup("zsh_to_sh", {})
vim.api.nvim_create_autocmd("BufRead", {
	group = "zsh_to_sh",
	pattern = { "*.zsh*", "*.zimrc" },
	command = "setfiletype sh",
})
