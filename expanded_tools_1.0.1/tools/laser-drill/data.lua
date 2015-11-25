require 'lib.tool'
require 'lib.recipe'

name = 'laser-drill'
technology = 'laser'

data:extend({
    tool(name, 3, 'laser'),
    recipe(name, {
        { 'steel-plate', 10 },
        { 'advanced-circuit', 5 },
        { 'battery', 5 }
    })
})

if data.raw['technology'][technology].effects == nil then
    data.raw['technology'][technology].effects = {}
end

table.insert(data.raw['technology'][technology].effects, {
    type = 'unlock-recipe',
    recipe = name
})
