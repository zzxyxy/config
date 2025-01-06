local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.diagnostics.flake8,
    },
    on_attach = function(client)
        -- Disable null-ls diagnostics if using Pyright for linting
        if client.name == "pyright" then
            client.server_capabilities.document_formatting = false
        end
    end,
})
