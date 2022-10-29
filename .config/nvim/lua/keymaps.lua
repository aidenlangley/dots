local telescope = require("telescope.builtin")
local lsp_buf = vim.lsp.buf

-- Normal mode map, with silent & noremap flags.
local function nmap(key, action, desc)
	vim.keymap.set("n", key, action, {
		desc = desc,
		silent = true,
		noremap = true,
	})
end

-- Normal mode map, with silent flag only.
local function nmap_remap(key, action, desc)
	vim.keymap.set("n", key, action, {
		desc = desc,
		silent = true,
	})
end

local function tmap(key, action, desc)
	vim.keymap.set("t", key, action, {
		desc = desc,
		silent = true,
		noremap = true,
	})
end

nmap("<C-.>", lsp_buf.hover, "[LSP] Peek")
nmap("<C-a>", lsp_buf.code_action, "[LSP] Actions")
nmap("<C-s>", "<CMD>w<CR>", "Save")

-- Movement
nmap("<C-h>", "<CMD>bp<CR>", "Next buffer")
nmap("<C-j>", "<CMD>wincmd W<CR>", "Next window")
nmap("<C-k>", "<CMD>wincmd w<CR>", "Previous window")
nmap("<C-l>", "<CMD>bn<CR>", "Previous buffer")

-- Close buffers/quit windows
-- nmap("<C-c>", require("utils").smart_quit, "Quit")
-- nmap("<C-d>", "<CMD>bd<CR>", "Unload buffer")

-- Finding buffers/files, searching for text
nmap("<C-b>", telescope.buffers, "Search buffers")
nmap("<C-e>", telescope.fd, "Search files")
nmap("<C-f>", telescope.live_grep, "Search in files")

-- Terminal
tmap("<Esc>", "<CMD>ToggleTerm<CR>", "Toggle terminal")

local wk = require("which-key")
wk.register({
	["<Leader>"] = {
		["/"] = { "<CMD>Telescope live_grep<CR>", "Find" },
		["?"] = { "<CMD>WhichKey<CR>", "Help" },
		c = { "<CMD>bd<CR>", "Close" },
		d = { "<CMD>Dirbuf<CR>", "Dirbuf" },
		e = { "<CMD>Fcarbon<CR>", "Explore" },
		f = { "<CMD>lua vim.lsp.buf.format()<CR>", "Format" },
		g = { "<CMD>TermExec cmd=lazygit direction=float<CR>", "Git" },
		n = { "<CMD>enew<CR>", "New" },
		N = { "<CMD>e $HOME/.config/nvim/init.lua<CR>", "Settings" },
		q = { "<CMD>lua require('utils').smart_quit()<CR>'", "Quit" },
		s = { "<CMD>split<CR>", "Split (H)" },
		v = { "<CMD>vsplit<CR>", "Split (V)" },
		w = { "<CMD>w!<CR>", "Save" },
	},
})

wk.register({
	["<Leader>a"] = {
		name = "Actions...",
		d = { "<CMD>%bd|e#|bd#<CR>", ":%bd|e#|bd#" },
	},
})

wk.register({
	["<Leader>p"] = {
		name = "Packer...",
		c = { "<CMD>PackerCompile<CR>", "Compile" },
		C = { "<CMD>PackerClean<CR>", "Clean" },
		i = { "<CMD>PackerInstall<CR>", "Install" },
		s = { "<CMD>PackerSync<CR>", "Sync" },
		S = { "<CMD>PackerStatus<CR>", "Status" },
	},
})

wk.register({
	["<Leader>t"] = {
		name = "Telescope...",
		a = { "<CMD>Telescope<CR>", "All..." },
		b = { "<CMD>Telescope buffers<CR>", "Buffers" },
		f = { "<CMD>Telescope fd<CR>", "Find files" },
		g = { "<CMD>Telescope live_grep<CR>", "Search in files" },
		h = { "<CMD>Telescope help_tags<CR>", "Help" },
		k = { "<CMD>Telescope keymaps<CR>", "Keymaps" },
		m = { "<CMD>Telescope marks<CR>", "Marks" },
		p = { "<CMD>Telescope projects<CR>", "Projects" },
		r = { "<CMD>Telescope oldfiles<CR>", "Recent files" },
		R = { "<CMD>Telescope reloader<CR>", "Reload plugin" },
		v = { "<CMD>Telescope vim_options<CR>", "Vim options" },
	},
})

wk.register({
	["<Leader>l"] = {
		name = "Language...",
		g = {
			name = "Go to...",
			d = { "<CMD>lua vim.lsp.buf.definition()<CR>", "Definition" },
		},
		I = { "<CMD>LspInfo<CR>", "[Info] LSP" },
		M = { "<CMD>Mason<CR>", "Mason" },
		N = { "<CMD>NullLsInfo<CR>", "[Info] null-ls" },
		s = { "<CMD>SymbolsOutline<CR>", "Symbols" },
		t = { "<CMD>TroubleToggle<CR>", "Trouble" },
	},
})
