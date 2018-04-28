
import * as React from "/opt/oni/resources/app/node_modules/react"
import * as Oni from "/opt/oni/resources/app/node_modules/oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
	// console.log("config activated")

	const isNormalMode = () => oni.editors.activeEditor.mode === "normal"
	const isVisualMode = () => oni.editors.activeEditor.mode === "visual"
	const isInsertOrCommandMode = () =>
	        oni.editors.activeEditor.mode === "insert" || 
			oni.editors.activeEditor.mode === "cmdline_normal"


	// Input
	
	// Move about splits easier.
	oni.input.bind("<c-h>", () =>
		oni.editors.activeEditor.neovim.command(`call OniNextWindow('h')<CR>`)
	)
	oni.input.bind("<c-j>", () =>
		oni.editors.activeEditor.neovim.command(`call OniNextWindow('j')<CR>`)
	)
	oni.input.bind("<c-k>", () =>
		oni.editors.activeEditor.neovim.command(`call OniNextWindow('k')<CR>`)
	)
	oni.input.bind("<c-l>", () =>
		oni.editors.activeEditor.neovim.command(`call OniNextWindow('l')<CR>`)
	)

	oni.input.bind("<a-Right>", () =>
		oni.editors.activeEditor.neovim.command(`call OniNextWindow('h')<CR>`)
	)
	oni.input.bind("<a-Left>", () =>
		oni.editors.activeEditor.neovim.command(`call OniNextWindow('j')<CR>`)
	)
	oni.input.bind("<a-Down>", () =>
		oni.editors.activeEditor.neovim.command(`call OniNextWindow('k')<CR>`)
	)
	oni.input.bind("<a-Up>", () =>
		oni.editors.activeEditor.neovim.command(`call OniNextWindow('l')<CR>`)
	)

	// Toggle sidebar
	oni.input.bind("`", "sidebar.toggle", isNormalMode)

	// TAB behaves like enter in autocomplete menu
	oni.input.bind(["<TAB>", "<enter>"], "contextMenu.select")
}

export const deactivate = (oni: Oni.Plugin.Api) => {
	// console.log("config deactivated")
}

export const configuration = {
	//add custom config here, such as

	"ui.colorscheme": "summerfruit256",

	//"oni.bookmarks": ["~/Documents"],
	//"editor.fontSize": "12px",
	"editor.fontFamily": "Hack",

	"editor.split.mode": "oni",

	// UI customizations
	"ui.animations.enabled": true,
	"ui.fontSmoothing": "auto",

	"oni.useDefaultConfig": false,
	"oni.loadInitVim": "~/.vimrc",
}
