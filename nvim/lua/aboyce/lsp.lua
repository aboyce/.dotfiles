local lspconfig = require('lspconfig')
local null_ls = require('null-ls')
local prettier = require("prettier")
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Add keyboard mappings after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

    local bufopts = { buffer = bufnr }

    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)

    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)

    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, bufopts)
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", bufopts)

    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)

end

local lsp_flags = {
    debounce_text_changes = 150
}

prettier.setup({
    bin = 'prettier',
    config_precedence = "prefer-file",
    filetypes = {
        "json",
        "markdown",
        "yaml",
        "css",
        "scss",
        "less",
        "html",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
    },
    arrow_parens = "always",
    bracket_spacing = true,
    bracket_same_line = false,
    embedded_language_formatting = "auto",
    end_of_line = "lf",
    jsx_single_quote = false,
    print_width = 80,
    prose_wrap = "preserve",
    quote_props = "as-needed",
    semi = true,
    single_attribute_per_line = false,
    single_quote = true,
    tab_width = 2,
    use_tabs = false,
})

-- Go --
lspconfig.gopls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags
}

-- TypeScript --
null_ls.setup({
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")

            -- format on save
            vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()")
        end

        if client.server_capabilities.documentRangeFormattingProvider then
            vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
        end
    end,
})

