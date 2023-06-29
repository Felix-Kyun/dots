require('mason.settings').set({
  ui = {
    border = 'rounded'
  }
})

local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()


