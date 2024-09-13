-- init.lua

-- Treesitter configuration
require('nvim-treesitter.configs').setup {
    -- If TS highlights are not enabled at all, or disabled via `disable` prop,
    -- highlighting will fallback to default Vim syntax highlighting
    highlight = {
        enable = true,
        -- Required for spellcheck, some LaTex highlights and
        -- code block highlights that do not have ts grammar
        additional_vim_regex_highlighting = { 'org' },
    },
    ensure_installed = { 'org' }, -- Or run :TSUpdate org
}

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
