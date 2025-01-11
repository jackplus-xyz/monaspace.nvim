# monaspace.nvim

A Neovim plugin that allows users to try mix and match [Monaspace](https://monaspace.githubnext.com/) fonts.

<img width="1172" alt="Screenshot 2025-01-10 at 23 12 54" src="https://github.com/user-attachments/assets/df4055d6-9e1f-48ed-9d2f-d7d6c032d221" />

> [!WARNING]
> The sole purpose of his plugin is to test and try the idea of having unique fonts for differnt highlight groups. It's extremely experimental and only tested to use with [Monaspace](https://monaspace.githubnext.com/) fonts. It may cause unexpected display issues in your terminal emulator. Please use with caution.

## Features

- Mix different Monaspace fonts using terminal font styles
- Preconfigured highlight groups for optimal font combinations
- Customizable font mappings per highlight group

## Demos

<img width="533" alt="Screenshot 2025-01-10 at 23 19 44" src="https://github.com/user-attachments/assets/8c7ee3d3-2b5c-4539-938b-fd705ea40721" />

<img width="533" alt="Screenshot 2025-01-10 at 23 26 27" src="https://github.com/user-attachments/assets/75c4eb76-b0a8-4b8b-affc-efbd72bfa1f4" />

<img width="644" alt="Screenshot 2025-01-10 at 23 29 20" src="https://github.com/user-attachments/assets/4df76e91-0166-429f-9b6e-1381bc30aff7" />

## About

### TL;DR

With [Monaspace](https://monaspace.githubnext.com/) and a modern terminal emulator, you can set different fonts for highlight groups in Neovim.

For example, you can:

- Use handwritten font for comments
- Use slab serif for annotations
- Use mechanical sans for AI agents, status line and file explorer

### What?

[Monaspace](https://monaspace.githubnext.com/#learn-more) is a superfamily of fonts made by [GitHub Next](https://githubnext.com/). It offers the power to use multiple mono spaced fonts together. It comes with five fonts:

- Neon: Neo-grotesque sans
- Argon: Humanist sans
- Xenon: Slab serif
- Radon: Handwriting
- Krypton: Mechanical sans

#### Mix & Match

> Monospaced fonts are generally incompatible with one another. Each one uses different metrics, making it impossible to mix different fonts. Each Monaspace font is designed to be seamlessly mixed and matched. Layer more meaning onto code, with a palette that goes beyond colors and bolder weights. Build interfaces for code that require more structure and hierarchy.

An example usage could be:

| Font       | Target                                | Effect                                                                                                               |
| ---------- | ------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| Radon      | Comments and TODOs                    | Provides an informal touch that makes notes and temporary markers feel more like human annotations                   |
| Xenon      | Documentation                         | Improves readability of longer text blocks and gives documentation a more authoritative, book-like appearance        |
| Krypton    | AI-generated code and autocompletions | Visually distinguishes machine-generated suggestions from human-written code with its precise, mechanical appearance |
| Neon/Argon | Regular code                          | Maintains clean, neutral readability for the majority of your codebase with traditional monospace aesthetics         |

### Why?

Although the Mix & Match feature sounds exciting, it is not fully supported in VS Code as of now, let alone in Neovim. Additionally, implementing such a feature in Neovim is likely nearly impossible due to its terminal-based nature, unless you’re using a GUI version.

Fortunately, with the feature-rich modern terminal emulators available, we can work around this limitation by setting different fonts for each font style and updating them accordingly in Neovim to create a close illusion, which is exactly what this plugin does.

> [!NOTE]
> While you can technically use fonts other than Monaspace, please note that it is not guaranteed to work well with each other.

> [!TIP]
> `Monaspace` is a fantastic font on its own, even without the Mix & Match feature. Be sure to give it a try!

## Setup

1.  Download and install [Monaspace](https://github.com/githubnext/monaspace/releases)
1.  Setup a terminal emulator that lets you set different font families for different font styles (regular, bold, italic, bold-italic). `monaspace.nvim` has been tested with the following terminal emulators (in alphabetical order):

- [Alacritty](https://alacritty.org/)
- [Ghostty](https://ghostty.org/)
- [kitty](https://sw.kovidgoyal.net/kitty/)

  2. Add the following lines to your configuration file accordingly:

     <details>

     <summary>Alacritty</summary>

     ```toml
     -- ~/.config/alacritty/alacritty.toml

     [font]
     normal = { family = "Monaspace Neon" }
     bold = { family = "Monaspace Xenon" }
     italic = { family = "Monaspace Radon" }
     bold_italic = { family = "Monaspace Krypton" }

     # You can adjust the weight and style of the font to your liking
     # normal = { family = "Monaspace Neon", style = "Light" }
     # bold = { family = "Monaspace Xenon", style = "ExtraLight" }
     # italic = { family = "Monaspace Radon", style = "ExtraLight Italic" }
     # bold_italic = { family = "Monaspace Krypton", style = "Bold" }
     ```

     </details>

     <details>

     <summary>Ghostty</summary>

     ```config
      # ~/.config/ghostty/config

      font-family = "Monaspace Neon"
      font-family-bold = "Monaspace Xenon"
      font-family-italic = "Monaspace Radon"
      font-family-bold-italic = "Monaspace Krypton"
      # The following are optional settings for more balanced font weight
      # font-style = "Medium"
      # font-style-bold = "Italic"
      # font-style-italic= "Italic"
      # font-style-bold-italic = "Regular"
     ```

      </details>

      <details>

      <summary>kitty</summary>

     ```conf
      # ~/.config/kitty/kitty.conf

      font_family      Monaspace Neon Var
      bold_font        Monaspace Xenon Var
      italic_font      Monaspace Radon Var
      bold_italic_font Monaspace Krypton Var

      # You can use the following finetuned config to acheieve desired result
      # i.e. change `wght` to balance the font weights, set `slnt=0` to make an italic font not italic
      # Or use `kitten --choose-fonts` to see what are the options
      # bold_font        family="Monaspace Xenon Var"   variable_name=MonaspaceXenonVar wght=400
      # italic_font      family="Monaspace Radon Var"   variable_name=MonaspaceRadonVar wght=400
      # bold_italic_font family='Monaspace Krypton Var' variable_name=MonaspaceKryptonVar slnt=0
     ```

      </details>

3. Install the plugin

   Using [lazy.nvim](https://github.com/folke/lazy.nvim):

   ```lua
   {
     "jackplus-xyz/monaspace.nvim",
     lazy = false,
     opts = {
     -- Add your configuration here
     }
   }
   ```

#### Configuration

`monaspace.nvim` comes with the following default configuration:

```lua
{
  -- Use the preconfigured highlight group setting
  -- Set this to `false` if you want to make your own config from scratch
	use_default = true,
	-- By default, all group will be set to normal to use the regular font
	-- Add groups to one of the styles to map it to the font you set.
	-- Example:
	-- italic = { Comment = true }
	-- Note:
	-- This plugin does NOT change anything else set by your colorschemes
  -- All it does is map the font to the highlight group by font styles
	style_map = {
		bold = {},
		italic = {},
		bold_italic = {},
	},
}
```

<details>
<summary>Default `style_map`</summary>

```lua
return {
	-- Xenon - Slab Serif: documentation and annotations
	bold = {
		Comment = true,
		Todo = true,
		SpecialComment = true,
		["@comment"] = true,
		["@comment.documentation"] = true,
		["@comment.error"] = true,
		["@comment.warning"] = true,
		["@comment.todo"] = true,
		["@comment.hint"] = true,
		["@comment.info"] = true,
		["@comment.note"] = true,
		["@string.documentation"] = true,
		LspCodeLens = true,
		LspInlayHint = true,
		["@lsp.type.comment"] = true,
		["@lsp.type.comment.c"] = true,
		["@lsp.type.comment.cpp"] = true,
		["@markup.heading"] = true,
		["@markup.heading.1.markdown"] = true,
		["@markup.heading.2.markdown"] = true,
		["@markup.heading.3.markdown"] = true,
		["@markup.heading.4.markdown"] = true,
		["@markup.heading.5.markdown"] = true,
		["@markup.heading.6.markdown"] = true,
		["@markup.heading.1.marker.markdown"] = true,
		["@markup.heading.2.marker.markdown"] = true,
		["@markup.heading.3.marker.markdown"] = true,
		["@markup.heading.4.marker.markdown"] = true,
		["@markup.heading.5.marker.markdown"] = true,
		["@markup.heading.6.marker.markdown"] = true,
		markdownH1 = true,
		markdownH2 = true,
		markdownH3 = true,
		markdownH4 = true,
		markdownH5 = true,
		markdownH6 = true,
		markdownH1Delimiter = true,
		markdownH2Delimiter = true,
		markdownH3Delimiter = true,
		markdownH4Delimiter = true,
		markdownH5Delimiter = true,
		markdownH6Delimiter = true,
	},
	-- Radon - Handwritten font: tentative thoughts and comments
	italic = {
		markdownUrl = true,
		htmlLink = true,
		["@markup.italic"] = true,
		["@markup.quote"] = true,
		["@string.special.url"] = true,
		["@string.special.path"] = true,
		["@markup.link"] = true,
		["@markup.link.url"] = true,
		["@markup.link.markdown_inline"] = true,
		["@markup.link.label.markdown_inline"] = true,
		mkdInlineURL = true,
		mkdLink = true,
		mkdURL = true,
		mkdLinkDef = true,
		markdownLinkText = true,
		["@markup.math"] = true,
		["@markup.environment"] = true,
		["@markup.environment.name"] = true,
	},
	-- Krypton - Mechanical sans: UI elements, diagnostics, and system messages
	bold_italic = {
		DiagnosticError = true,
		DiagnosticHint = true,
		DiagnosticInfo = true,
		DiagnosticOk = true,
		DiagnosticWarn = true,
		DiagnosticDefaultError = true,
		DiagnosticDefaultHint = true,
		DiagnosticDefaultInfo = true,
		DiagnosticDefaultOk = true,
		DiagnosticDefaultWarn = true,
		DiagnosticFloatingError = true,
		DiagnosticFloatingHint = true,
		DiagnosticFloatingInfo = true,
		DiagnosticFloatingOk = true,
		DiagnosticFloatingWarn = true,
		DiagnosticSignError = true,
		DiagnosticSignHint = true,
		DiagnosticSignInfo = true,
		DiagnosticSignOk = true,
		DiagnosticSignWarn = true,
		DiagnosticUnderlineError = true,
		DiagnosticUnderlineHint = true,
		DiagnosticUnderlineInfo = true,
		DiagnosticUnderlineOk = true,
		DiagnosticUnderlineWarn = true,
		DiagnosticVirtualTextError = true,
		DiagnosticVirtualTextHint = true,
		DiagnosticVirtualTextInfo = true,
		DiagnosticVirtualTextOk = true,
		DiagnosticVirtualTextWarn = true,
		ErrorMsg = true,
		WarningMsg = true,
		ModeMsg = true,
		MoreMsg = true,
		Question = true,
		RedrawDebugNormal = true,
		RedrawDebugClear = true,
		RedrawDebugComposed = true,
		RedrawDebugRecompose = true,
		healthError = true,
		healthSuccess = true,
		healthWarning = true,
		NvimInternalError = true,
		FloatTitle = true,
		WinBar = true,
		WinBarNC = true,
		StatusLine = true,
		StatusLineNC = true,
		StatusLineTerm = true,
		StatusLineTermNC = true,
	},
}
```

</details>

Example configuration:

```lua
{
  "jackplus-xyz/monaspace.nvim",
  lazy = false,
  opts = {
    style_map = {
      bold_italic = {
          -- NeoTree
          NeoTreeDimText = true,
          NeoTreeFileName = true,
          NeoTreeGitModified = true,
          NeoTreeGitStaged = true,
          NeoTreeGitUntracked = true,
          NeoTreeNormal = true,
          NeoTreeNormalNC = true,
          NeoTreeTabActive = true,
          NeoTreeTabInactive = true,
          NeoTreeTabSeparatorActive = true,
          NeoTreeTabSeparatorInactive = true,
      }
    }
  }
}
```
