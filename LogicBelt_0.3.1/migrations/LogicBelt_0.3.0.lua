for i,v in ipairs(game.players) do
	v.force.reset_recipes()
	v.force.reset_technologies()
	
	if v.force.technologies["rail-signals"].researched == true then
		v.force.recipes["logic-signal"].enabled = true
		v.force.recipes["chain-logic-signal"].enabled = true
		v.force.recipes["signal-reader"].enabled = true
		v.force.recipes["chain-signal-reader"].enabled = true
	end
	
	if v.force.technologies["fluid-handling"].researched == true then
		v.force.recipes["basic-valve-pipe"].enabled = true
		v.force.recipes["basic-reader-pipe"].enabled = true
		v.force.recipes["basic-temperature-pipe"].enabled = true
	end
end
