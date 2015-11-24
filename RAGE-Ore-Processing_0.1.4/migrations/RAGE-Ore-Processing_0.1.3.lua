for i, force in pairs(game.forces) do 
	if force.technologies["rop-t1"].researched then 
		force.recipes["rop-ropc"].enabled = true
	end
end