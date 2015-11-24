require 'lib.tool'
require 'lib.recipe'

name = 'jackhammer'
technology = 'engine'

data:extend({
    tool(name, 2),
    recipe(name, {
        { 'steel-plate', 10 },
        { 'electronic-circuit', 5 },
        { 'engine-unit', 1 }
    })
})

if data.raw['technology'][technology].effects == nil then
    data.raw['technology'][technology].effects = {}
end

table.insert(data.raw['technology'][technology].effects, {
    type = 'unlock-recipe',
    recipe = name
})
