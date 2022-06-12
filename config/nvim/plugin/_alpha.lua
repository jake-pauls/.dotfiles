local alpha = require('alpha')
local startify = require('alpha.themes.startify')

local classic = {
    [[        _            ]],
    [[ _   __(_)___ ___    ]],
    [[ | | / / / __ `__ \  ]],
    [[ | |/ / / / / / / /  ]],
    [[ |___/_/_/ /_/ /_(_) ]],
}

startify.section.header.val = classic
alpha.setup(startify.opts)
