for i,v in ipairs(game.players) do
	v.force.reset_recipes()
	v.force.reset_technologies()
	local res=true
	for k,tech in ipairs(v.force.technologies["rail-logic-system"].prerequisites) do
	  if not tech.researched then
	    res=false
	    break
	  end
	end
	v.force.technologies["rail-logic-system"].enabled=res
	
	if v.force.technologies["rail-logic-system"].researched == true then
		v.force.recipes["rail-switch-lamp"].enabled = true
	end
	
end
