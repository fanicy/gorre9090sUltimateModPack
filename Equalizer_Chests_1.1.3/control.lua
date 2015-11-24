-- Equalizer Chests
-- Control framework and bits of code borrowed from Compression Chests and Item Collectors, both by Rseding91

require "defines"

local loaded
local ticks = 59
local debug = false

function ticker()
	if global.eqChests ~= nil then
		if ticks == 0 then
			ticks = 59
			processEqChests()
		else
			ticks = ticks - 1
		end
	else
		script.on_event(defines.events.on_tick, nil)
	end
end

script.on_load(function()
	local count = 0
	local pretotal=0
	local posttotal=0
	local glob
	
	if not loaded then
		loaded = true
		
		if global.eqChests ~= nil then
			script.on_event(defines.events.on_tick, ticker)
		end
	end
end)

script.on_init(function()
	loaded = true
	
	if global.eqChests ~= nil then
		script.on_event(defines.events.on_tick, ticker)
	end
end)

function builtEntity(event)
	local chest
	
	if event.created_entity.name == "equalizer-chest" then
		if global.eqChests == nil then
			global.eqChests = {}
			script.on_event(defines.events.on_tick, ticker)
		end
		
		chest = {true,true,true,true}
		
		chest[1] = event.created_entity
		chest[2] = event.created_entity.get_inventory(1)
		chest[3] = event.created_entity.position
		chest[4] = findNeighbouringEqChests(event.created_entity.position, event.created_entity.surface)
		
		table.insert(global.eqChests, chest)
		if chest[4] ~= nil then
			for k,eqChest in pairs(chest[4]) do
				if eqChest[1].valid then
					for k,v in pairs(global.eqChests) do
						if v[1] == eqChest[1] then
							v[4] = findNeighbouringEqChests(eqChest[1].position, eqChest[1].surface)
							break
						end
					end
				end
			end
		end
	end

end

script.on_event(defines.events.on_built_entity, builtEntity)
script.on_event(defines.events.on_robot_built_entity, builtEntity)

function removedEntity(event)
	local neighbours
	
	if event.entity.name == "equalizer-chest" then
		neighbours = findNeighbouringEqChests(event.entity.position, event.entity.surface)
		if neighbours ~= nil then
			for k,eqChest in pairs(neighbours) do
				if eqChest[1].valid then
					eqChest[4] = findNeighbouringEqChests(eqChest[3], eqChest[1].surface)
				end
			end
		end
	end
	
end

--game.onevent(defines.events.onpreplayermineditem, removedEntity)
--game.onevent(defines.events.onrobotpremined, removedEntity)
--game.onevent(defines.events.onentitydied, removedEntity)

function findNeighbouringEqChests(position, surface)
	local neighbouringChests
	local newChest
	local eqChests
	
	eqChests = surface.find_entities_filtered({area = {{x = position.x - 1, y = position.y - 1}, {x = position.x + 1, y = position.y + 1}}, name = "equalizer-chest"})
	for _,chest in pairs(eqChests) do
		if math.abs(position.x - chest.position.x) + math.abs(position.y - chest.position.y) == 1 then
			if neighbouringChests == nil then
				neighbouringChests = {}
			end
			
			newChest = {true, true}
			newChest[1] = chest												--Chest entity
			newChest[2] = chest.get_inventory(1)								--Inventory of the chest
			
			table.insert(neighbouringChests, newChest)
		end
	end
	
--	game.player.print("found "..count.." neighbours")
--	game.player.print("---")
	return neighbouringChests
end

function processEqChests()
	local chest
	local neighbourItemcount
	local diff
	local transfer
	local transfercount
	local itemstack
	local neighbours
	
	for k,eqChest in pairs(global.eqChests) do
		if eqChest[1].valid then
			if eqChest[4] ~= nil then
				itemcount = eqChest[2].get_item_count()
				for l,neighbour in pairs(eqChest[4]) do
					if neighbour[1].valid then
						neighbourItemcount = neighbour[2].get_item_count()
						if itemcount > neighbourItemcount then
							diff = itemcount - neighbourItemcount
							if diff > 10 then
								transfer = math.floor(diff / 2)
								for item,count in pairs(eqChest[2].get_contents()) do
									if count > 0 then
										if count < transfer then
											transfercount = count
											transfer = transfer - transfercount
										else
											transfercount = transfer
											transfer = 0
										end
										itemstack = {name = item, count = transfercount}
										if neighbour[2].can_insert(itemstack) then
											eqChest[2].remove(itemstack)
											neighbour[2].insert(itemstack)
										end
									end
									if transfer == 0 then
										break
									end
								end
							end
						end
					end
				end
			end
		else
			table.remove(global.eqChests, k)
			if #global.eqChests == 0 then
				global.eqChests = nil
				script.on_event(defines.events.on_tick, nil)
				break	-- no need to continue if there are no chests left
			end
		end
	end
end
