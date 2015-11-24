for i,v in ipairs(game.players) do
	v.force.reset_recipes()
	v.force.reset_technologies()
	
	if v.force.technologies["logistics"].researched == true then
		v.force.recipes["basic-counter-transport-belt"].enabled = true
	end
	
	if v.force.technologies["logistics-2"].researched == true then
		v.force.recipes["fast-counter-transport-belt"].enabled = true
	end
	
	if v.force.technologies["logistics-3"].researched == true then
		v.force.recipes["express-counter-transport-belt"].enabled = true
	end
end
