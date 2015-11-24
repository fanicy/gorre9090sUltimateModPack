data:extend({
  {
    type = 'technology',
    name='dark-matter-scoop',
    icon = '__dark-matter-replicators__/graphics/icons/dark-matter-scoop.png',
    effects = {{type = 'unlock-recipe', recipe='dark-matter-scoop'}, {type = 'unlock-recipe', recipe='replication-lab'}},
    prerequisites = {},
    unit = research(10, 1, 0, 0, 0, 5),
    order='a-f-a',
  },
  {
      type = "recipe",
      name = "dark-matter-scoop",
      enabled = "false",
      ingredients = {
        {'tenemut', 4},
        {'iron-plate', 1}
      },
      result = "dark-matter-scoop"
  },
  {
    type = "tool",
    name = "dark-matter-scoop",
    icon = "__dark-matter-replicators__/graphics/icons/dark-matter-scoop.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "replication-resources",
    order = "a[matter-conduit]-a",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount"
  },
  {
    type = 'technology',
    name='dark-matter-transducer',
    icon = '__dark-matter-replicators__/graphics/icons/dark-matter-transducer.png',
    effects = {{type = 'unlock-recipe', recipe='dark-matter-transducer'}},
    prerequisites = {"dark-matter-scoop"},
    unit = research(40, 1, 0, 0, 0, 5),
    order='a-f-a',
  },
  {
      type = "recipe",
      name = "dark-matter-transducer",
      enabled = "false",
      ingredients = {
        {'dark-matter-scoop', 4},
        {'steel-plate', 1}
      },
      result = "dark-matter-transducer"
  },
  {
    type = "tool",
    name = "dark-matter-transducer",
    icon = "__dark-matter-replicators__/graphics/icons/dark-matter-transducer.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "replication-resources",
    order = "a[matter-conduit]-b",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount"
  },
  {
    type = 'technology',
    name='matter-conduit',
    icon = '__dark-matter-replicators__/graphics/icons/matter-conduit.png',
    effects = {{type = 'unlock-recipe', recipe='matter-conduit'}},
    prerequisites = {"dark-matter-transducer"},
    unit = research(40, 1, 1, 0, 0, 5),
    order='a-f-a',
  },
  {
      type = "recipe",
      name = "matter-conduit",
      enabled = "false",
      ingredients = {
        {'dark-matter-transducer', 4},
        {'dark-matter-scoop', 1}
      },
      result = "matter-conduit"
  },

  {
    type = "tool",
    name = "matter-conduit",
    icon = "__dark-matter-replicators__/graphics/icons/matter-conduit.png",
    flags = {"goes-to-main-inventory"},
    subgroup = "replication-resources",
    order = "a[matter-conduit]-c",
    stack_size = 200,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount"
  },



})