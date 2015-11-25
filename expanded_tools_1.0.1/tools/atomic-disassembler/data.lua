require 'lib.tool'
require 'lib.recipe'

name = 'atomic-disassembler'
technology = 'alien-technology'

data:extend({
    tool(name, 4, 'laser'),
    recipe(name, {
        { 'steel-plate', 20 },
        { 'battery', 10 },
        { 'processing-unit', 5 },
        { 'alien-artifact', 10 }
    })
})

if data.raw['technology'][technology].effects == nil then
    data.raw['technology'][technology].effects = {}
end

table.insert(data.raw['technology'][technology].effects, {
    type = 'unlock-recipe',
    recipe = name
})
