require("util")
require("defines")

global.pumpset = {}

function OnEntityBuild(entity)
	if entity.name == "pumpjack" then
		table.insert(global.pumpset,entity)
    end
end

function OnEntityRemove(entity)
	if entity.name == "pumpjack" then
		for i,v in pairs(global.pumpset) do
			if v == entity then
			-- do something
				table.remove(global.pumpset,i)
				break
			end
		end
    end
end

--	ACTIVATED

--	Placed
script.on_event(defines.events.on_built_entity, function(event)
      OnEntityBuild(event.created_entity)
end)
--	Robot Placed
script.on_event(defines.events.on_robot_built_entity, function(event)
      OnEntityBuild(event.created_entity)
end)
--	Re-activated after deconstruction plan removal
script.on_event(defines.events.on_canceled_deconstruction, function(event)
      OnEntityBuild(event.entity)
end)

-- DEACTIVATED

--	Dead
script.on_event(defines.events.on_entity_died, function(event)
    OnEntityRemove(event.entity)
end)
--	Player Mined
script.on_event(defines.events.on_preplayer_mined_item, function(event)
	OnEntityRemove(event.entity)
end)
--	Marked for deconstruction
script.on_event(defines.events.on_marked_for_deconstruction, function(event)
     OnEntityRemove(event.entity)
end)

-- Tick

 script.on_event(defines.events.on_tick, function(event)
	if (global.pumpset ~= nil) then
		for index, entity in pairs(global.pumpset) do
			if (entity.fluidbox[1] ~= nil) and (entity.fluidbox[1].amount > 0) and (entity.fluidbox[1].type == "water") then       
				local fluidBox = entity.fluidbox[1]
				local maxTemperature = 100
            
				if (fluidBox.temperature < maxTemperature) then
					
					fluidBox.temperature = 100
					entity.fluidbox[1] = fluidBox
				end
			end
		end
	end
end)