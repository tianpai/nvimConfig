local status, og = pcall(require, "orgmode")
if not status then
	return
end

require("orgmode").setup_ts_grammar()

og.setup({
	org_agenda_files = { "~Document/org/*" },
	org_default_notes_file = "~/org/refile.org",
	org_agenda_templates = {
		t = {
			description = "Task",
			template = "* TODO %?\n  %U\n  %a",
			target = "~/org/refile.org",
		},
		n = {
			description = "Note",
			template = "* %?\n  %U\n  %a",
			target = "~/org/refile.org",
		},
		j = {
			description = "Journal",
			template = "* %<%Y-%m-%d>\n  %U\n  %?",
			target = "~/org/journal.org",
		},
	},
})
