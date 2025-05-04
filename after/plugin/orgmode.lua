-- init.lua

require('orgmode').setup({
    org_agenda_files = { '~/.local/state/org/**/*' },
    org_default_notes_file = '~/.local/state/org/refile.org',
    org_hide_emphasis_markers = true,
})

-- require('cmp').setup({
--     sources = {
--         { name = 'orgmode' }
--     }
-- })
