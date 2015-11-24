require("defines")

local techs = {
"advanced-radar",
"advanced-radar-2",
"advanced-radar-3",
}

local recipes = {
"radar-2",
"scouting-radar",
"scouting-radar-2",
"tactical-radar",
"tactical-radar-2",
}

--[[
game.on_event(defines.events.on_player_created,function(event)
	local player = game.players[event.player_index]
	--player.character=nil
	player.insert{name="radar",count=2}
	player.insert{name="radar-2",count=2}
	player.insert{name="scouting-radar",count=2}
	player.insert{name="scouting-radar-2",count=2}
	player.insert{name="tactical-radar",count=2}
	player.insert{name="tactical-radar-2",count=2}
	player.insert{name="solar-panel",count=200}
	player.insert{name="medium-electric-pole",count=200}
	game.alwaysday=true
end)
--]]

script.on_init(function()
	for _,f in pairs(game.forces) do
		for _,tech in pairs(techs) do
			f.technologies[tech].reload()
		end
		for _,recipe in pairs(recipes) do
			f.recipes[recipe].reload()
		end
	end
end)

