packadd! nvim-compe

lua <<EOF
require'compe'.setup {
    enabled=true;
    autocomplete=true;
    min_length=1;
    preselect='enable';
    throttle_time=80;
    source_timeout=200;
    incomplete_delay=200;
    max_abbr_width=88;
    max_kind_width=88;
    max_menu_width=88;
    documentation=true;

    source = {
        path = true;
        buffer = true;
        calc = true;
        nvim_lsp = true;
        nvim_lua = true;
        ultisnips = true;
    };
}
EOF

imap <expr> <Tab> compe#confirm('<Tab>')
