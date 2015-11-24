data:extend(
{ 

    {
    type = 'technology',
    name='Hive-Mind-V1',
    icon = '__Evolution__/graphics/icons/Hive-Mind-V1.png',
    effects = {{type = 'unlock-recipe', recipe='biter-spawner'}},
    prerequisites = {"exo-skeleton"},
    unit = 
	{
		count = 100,
		ingredients = 
		{
			{"alien-bioconstruct", 1},
			{"alien-fragments", 1},
			{"endo-skeleton", 1},
			{"exo-skeleton", 2}
		},
		time = 15
	},
	upgrade = false,
    order="a-f-a"
  },
   {
    type = 'technology',
    name='Hive-Mind-V2',
    icon = '__Evolution__/graphics/icons/Hive-Mind-V2.png',
    effects = {{type = 'unlock-recipe', recipe='spitter-spawner'}},
    prerequisites = {"exo-skeleton"},
    unit = 
		{
		count = 150,
		ingredients = 
		{
			{"alien-bioconstruct", 2},
			{"alien-fragments", 2},
			{"endo-skeleton", 1},
			{"exo-skeleton", 1}
		},
		time = 20
	},
    order="a-f-a"
  },

}
)