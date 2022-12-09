require('telescope').setup{
	defaults = {
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
       		 	},
		}
	},
    pickers = {
        lsp_definitions = {
            initial_mode = "normal"
        },
        lsp_references = {
            initial_mode = "normal"
        }
    }
}
