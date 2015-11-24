data:extend(
{ 
  {
    type = 'technology',
    name='Hive-mind',
    icon = '__Evolution__/graphics/icons/hive-mind.png',
    effects = {{type = 'unlock-recipe', recipe='attractor-on2'}, {type = 'unlock-recipe', recipe='attractor-on'}, {type = 'unlock-recipe', recipe='attractor-off'}},
    prerequisites = {"exo-skeleton"},
    unit = alien_research(100, 1, 1, 1, 1, 5),
    order='a-f-a',
  },
})