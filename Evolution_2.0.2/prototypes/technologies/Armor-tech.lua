data:extend(
{
  {
    type = 'technology',
    name='alien-armor-tech-1',
    icon = '__Evolution__/graphics/icons/armor-tech-1.png',
    effects = {{type = 'unlock-recipe', recipe='Evolution-armor-mk2'}},
    prerequisites = {"alien-fragments"},
    unit = alien_research(25, 1, 0, 0, 0, 15),
    order='a-f-a',
  },
  {
    type = 'technology',
    name='alien-armor-tech-2',
    icon = '__Evolution__/graphics/icons/armor-tech-2.png',
    effects = {{type = 'unlock-recipe', recipe='Evolution-armor-mk3'}},
    prerequisites = {"alien-fragments", "endo-skeleton"},
    unit = alien_research(50, 1, 1, 1, 0, 20),
    order='a-f-a',
  },
  {
    type = 'technology',
    name='alien-armor-tech-3',
    icon = '__Evolution__/graphics/icons/armor-tech-3.png',
    effects = {{type = 'unlock-recipe', recipe='Evolution-armor-mk4'}},
    prerequisites = {"alien-fragments", "endo-skeleton"},
    unit = alien_research(75, 1, 1, 1, 0, 25),
    order='a-f-a',
  },
  {
    type = 'technology',
    name='alien-armor-tech-4',
    icon = '__Evolution__/graphics/icons/armor-tech-4.png',
    effects = {{type = 'unlock-recipe', recipe='Evolution-armor-mk5'}},
    prerequisites = {"alien-fragments", "endo-skeleton", "exo-skeleton"},
    unit = alien_research(100, 1, 1, 1, 1, 30),
    order='a-f-a',
  },
})