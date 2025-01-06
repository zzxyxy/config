-- Setup LSP with nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

lspconfig.yamlls.setup{
    settings = {
        yaml = {
            schemas = {
                ["https://json.schemastore.org/github-workflow"] = "/.github/workflows/*",
                ["https://json.schemastore.org/github-action"] = "/action.yml"
            },
            validate = true,
            format = {
                enable = true
            },
            hover = true,
            completion = true
        },
    },
    filetype = { "yaml" },
}

lspconfig.helm_ls.setup{
    cmd = { "helm-ls", "serve" },
    filetypes = { "helm" },
    root_dir = lspconfig.util.root_pattern("Chart.yaml"),
}

-- Add Python LSP configuration
lspconfig.pyright.setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        -- Optional: Configure additional settings for Python files
    end,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",  -- Options: off, basic, strict
                autoSearchPaths = true,
                useLibraryCodeForTypes = true
            },
        },
    },
}
