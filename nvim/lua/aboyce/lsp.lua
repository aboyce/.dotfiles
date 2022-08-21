local lspconfig = require('lspconfig')
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

lspconfig.gopls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = lsp_flags
}
