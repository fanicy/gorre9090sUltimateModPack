for i,v in ipairs(game.players) do
	v.force.reset_recipes()
	v.force.reset_technologies()
	
	if v.force.recipes["super-transport-belt"] then
		if v.force.technologies["logistics-4"].researched == true then
			v.force.recipes["super-logic-transport-belt"].enabled = true
			v.force.recipes["super-counter-transport-belt"].enabled = true
		end
	end
	if v.force.recipes["extreme-transport-belt"] then
		if v.force.technologies["logistics-5"].researched == true then
			v.force.recipes["extreme-logic-transport-belt"].enabled = true
			v.force.recipes["extreme-counter-transport-belt"].enabled = true
		end
	end
	
	if v.force.recipes["green-transport-belt"] then
		if v.force.technologies["bob-logistics-4"].researched == true then
			v.force.recipes["green-logic-transport-belt"].enabled = true
			v.force.recipes["green-counter-transport-belt"].enabled = true
		end
	end
	if v.force.recipes["purple-transport-belt"] then
		if v.force.technologies["bob-logistics-5"].researched == true then
			v.force.recipes["purple-logic-transport-belt"].enabled = true
			v.force.recipes["purple-counter-transport-belt"].enabled = true
		end
	end
end
