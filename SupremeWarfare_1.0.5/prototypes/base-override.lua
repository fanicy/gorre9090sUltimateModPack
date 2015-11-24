data.raw["projectile"]["explosive-rocket"].action = 
{
  type = "direct",
  action_delivery =
  {
	type = "instant",
	target_effects =
	{
	  {
		type = "create-entity",
		entity_name = "explosion"
	  },
	  {
		type = "nested-result",
		action =
		{
		  type = "area",
		  perimeter = 3,
		  action_delivery =
		  {
			type = "instant",
			target_effects =
			{
			  {
				type = "damage",
				damage = {amount = 40, type = "explosion"}
			  },
			  {
				type = "create-entity",
				entity_name = "explosion"
			  }
			}
		  }
		},
	  }
	}
  }
}