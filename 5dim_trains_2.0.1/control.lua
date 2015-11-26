require "defines"
local wagonsInit = false


--THIS CAN BE CHANGE TO ONLY TICK IF THE WAGONS TABLE HAS STUFF IN IT.
script.on_event(defines.events.on_tick, function(event)



	if wagonsInit == nil or wagonsInit == false then
		--script.player.clearconsole()
		
		debugLog("SETUP Start!!!!!!!!!!!!")
		wagonsInit = true
		apiWarning = false
		global.apiVersion = getApiVersion()
		debugLog("API -- " .. global.apiVersion)
		if global.wagons ~= nil then
			global.wagonsData = convertWagonsToWagonsData(global.wagons)
			global.wagons = nil
		end

		global.wagonsData = initWagonsData(global.wagonsData)
		debugLog("SETUP End!!!!!!!!!!!!")
	end
	
	if global.itemsToDeleteFromInventory ~= nil then
		local playerInventory = script.player.get_inventory(defines.inventory.playermain)
		for i,stack in ipairs(global.itemsToDeleteFromInventory) do
			playerInventory.remove(stack)
		end
		
		global.itemsToDeleteFromInventory = nil
	end
	
	if global.updateStaticProxies ~= nil then
		for i, position in ipairs(global.updateStaticProxies) do
			updateStaticProxies(position)
		end
		global.updateStaticProxies = nil
	end
	
	if global.wagonsData~=nil and event.tick %20 == 3 then
	
		global.wagonsData = updateWagons(global.wagonsData)
		
		
		--debugLog("****** WAGON COUNT " .. wagonCount .. " **********")
	end
	
end)

function updateWagons(wagonsData)
	local removeList = {}
	for i,wagonData in pairs(wagonsData) do
		--wagonCount = wagonCount + 1
		if wagonData ~= nil and wagonData.wagon ~= nil and wagonData.wagon.valid then
			wagonData = updateWagonPosition(wagonData)
			wagonData = updateWagonProxyPosition(wagonData)
			wagonData = processWagon(wagonData)
			wagonData = updateInventoryCount(wagonData)
			wagonData = updateRequestSlots(wagonData)
			-- wagonData = updateLiquid(wagonData)
			wagonData = updateHealth(wagonData)
		else
			table.insert(removeList, 1, wagon)
			
		end
	end
	for i, wagon in ipairs(removeList) do
		removeWagonFromTable(wagonsData, wagon)
	end
	
	return wagonsData
end

script.on_event(defines.events.on_entity_died, function(event)
	if isKnownWagon(event.entity.name) then
		removeWagonFromTable(global.wagonsData, event.entity)
	end
	
	if event.entity.name == "gun-turret-mounted" or event.entity.name == "laser-turret-mounted" then
		debugLog("DIE")
		local foundWagon = findWagonAtPosition(event.entity.position)
		if foundWagon ~= nil and foundWagon.valid then
			for i, wagonData in ipairs(global.wagonsData) do
				if hasValidWagon(wagonData) and foundWagon == wagonData.wagon then
					debugLog(wagonData.wagon.name)
					wagonData.wagon.damage(10000, script.forces.enemy)
				end
			end
		end
		
	end
	
	if hasStaticProxies(event.entity.name) then
		--destroyStaticProxies(event.entity) 
		updateStaticProxiesNextTick(event.entity.position)
		destroyStaticProxies(event.entity)
		--destroyStaticProxiesAt(event.entity.name, event.entity.position)
	end
end)

script.on_event(defines.events.on_preplayer_mined_item, function(event) -- THIS SHOULD BE THE SAME AS events.on_entity_died - I should really create a new function...
	if isKnownWagon(event.entity.name) then
		removeWagonFromTable(global.wagonsData, event.entity)
	end
	if hasStaticProxies(event.entity.name) then
		updateStaticProxiesNextTick(event.entity.position)
		destroyStaticProxies(event.entity)
	end
end)

script.on_event(defines.events.on_robot_pre_mined, function(event) -- THIS SHOULD BE THE SAME AS events.on_entity_died - I should really create a new function...
	if isKnownWagon(event.entity.name) then
		removeWagonFromTable(global.wagonsData, event.entity)
	end
	if hasStaticProxies(event.entity.name) then
		updateStaticProxiesNextTick(event.entity.position)
		destroyStaticProxies(event.entity)
	end
end)

script.on_event(defines.events.on_built_entity, function(event)
	if isKnownWagon(event.created_entity.name) then
		--event.created_entity.operable = false
		addWagonToTable(global.wagonsData, event.created_entity)
	end
	
	if event.created_entity.type == "rail" then
		-- local hasBeenDestroyed = false
		-- if colidesWithRail(event.created_entity.position) then
			-- debugLog("Found other rail. shit! Remove it before we kill the save!")
			-- local entities = surface.find_entities_filtered{area = {{event.created_entity.position.x - 0.22, event.created_entity.position.y - 0.22}, {event.created_entity.position.x + 0.22, event.created_entity.position.y + 0.22}}, type = "rail"} 
			-- for i, entity in ipairs(entities) do
				-- if entity ~=nil and entity.valid then
					-- --debugLog("rail is valid!") -- OLD BUG WORKAROUND, REMOVED
					-- -- if railInTheSameLocation(event.created_entity, entity) then
						-- -- --debugLog("railInTheSameLocation")
						-- -- script.player.insert({name = event.created_entity.name, count = 1})
						-- -- --debugLog("destroy!")
						-- -- event.created_entity.destroy()
						-- -- hasBeenDestroyed = true
					-- -- end
				-- end
			-- end
		-- end
		
		if event.created_entity.valid and hasStaticProxies(event.created_entity.name) then
			updateStaticProxiesNextTick(event.created_entity.position)
		end
		
	end
	
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
	if isKnownWagon(event.created_entity.name) then
		--event.created_entity.operable = false
		addWagonToTable(global.wagonsData, event.created_entity)
	end
	
	if event.created_entity.type == "rail" then
		-- local hasBeenDestroyed = false
		-- if colidesWithRail(event.created_entity.position) then
			-- debugLog("Found other rail. shit! Remove it before we kill the save!")
			-- local entities = surface.find_entities_filtered{area = {{event.created_entity.position.x - 0.22, event.created_entity.position.y - 0.22}, {event.created_entity.position.x + 0.22, event.created_entity.position.y + 0.22}}, type = "rail"} 
			-- for i, entity in ipairs(entities) do
				-- if entity ~=nil and entity.valid then
					-- --debugLog("rail is valid!") -- OLD BUG WORKAROUND, REMOVED
					-- -- if railInTheSameLocation(event.created_entity, entity) then
						-- -- --debugLog("railInTheSameLocation")
						-- -- script.player.insert({name = event.created_entity.name, count = 1})
						-- -- --debugLog("destroy!")
						-- -- event.created_entity.destroy()
						-- -- hasBeenDestroyed = true
					-- -- end
				-- end
			-- end
		-- end
		
		if event.created_entity.valid and hasStaticProxies(event.created_entity.name) then
			updateStaticProxiesNextTick(event.created_entity.position)
		end
		
	end
	
end)

-- script.on_event(defines.events.onplayermineditem, function(event)
	-- if event.itemstack["name"] == "nothing-item" then
		-- --debugLog("Found Nothing Item")
		-- if global.itemsToDeleteFromInventory == nil then
			-- global.itemsToDeleteFromInventory = {}
		-- end
		-- table.insert(global.itemsToDeleteFromInventory, event.itemstack)
	-- end
-- end)

-- script.on_event(defines.events.onpickedupitem, function(event) -- SAME AS onplayermineditem, SHOULD BE A FUNCTION!
	-- if event.itemstack["name"] == "nothing-item" then
		-- --debugLog("Found Nothing Item")
		-- if global.itemsToDeleteFromInventory == nil then
			-- global.itemsToDeleteFromInventory = {}
		-- end
		-- table.insert(global.itemsToDeleteFromInventory, event.itemstack)
	-- end
-- end)

--script.on_save(function()
	--for i, wagonData in pairs(global.wagonsData) do
	--	if hasValidWagon(wagonData) then
			-- global.wagonsData = updateWagons(global.wagonsData)
	--		updateWagonPosition(wagonData)
		--	updateWagonProxyPosition(wagonData)
	--	end
	--end
--end)


function addWagonToTable(wagonsData, wagon, energy, liquid) --, proxyPosition)
	if wagonsData==nil then
			wagonsData={}
	end
	
	if wagon ~= nil and wagon.valid then
		
		local newWagon = {}
		newWagon["wagon"] = wagon
		newWagon["position"] = wagon.position
		newWagon["proxy"] = findWagonProxies(wagon)
		if newWagon["proxy"] ~= nil and newWagon["proxy"][1] ~= nil and newWagon["proxy"][1].valid then
			newWagon["proxyPosition"] = newWagon["proxy"][1].position
		end
		if hasInventory(wagon) then
			local inventory = wagon.get_inventory(1)
			newWagon["inventoryCount"] = inventory.get_item_count()
		end
		newWagon["liquid"] = liquid
		newWagon["requestSlots"] = {}
		newWagon["health"] = getHealth(wagon)
		if energy ~= nil then
			newWagon["energy"] = energy
		else
			newWagon["energy"] = 0
		end
		
		table.insert(wagonsData, newWagon)
	end
	
	return wagonsData
end

function updateStaticProxiesNextTick(position)
	if global.updateStaticProxies == nil then
		global.updateStaticProxies = {}
	end
	table.insert(global.updateStaticProxies, position)
end

function railInTheSameLocation(railA, railB)
	if railA == nil or railB == nil then -- nil can never be equal
		return false
	end
	
	if railA.valid and railB.valid then
		if railA == railB then --Same rail, ignore
			return false
		end
		if railA.direction == railB.direction and railA.position.x == railB.position.x and railA.position.y == railB.position.y then
			--debugLog("facing the same way in the same place!")
			
			if (railA.name == "straight-rail" and railB.name == "straight-power-rail") 
				or (railA.name == "curved-rail" and railB.name == "curved-power-rail") 
				or (railA.name == "curved-power-rail" and railB.name == "curved-rail") 
				or (railA.name == "straight-power-rail" and railB.name == "straight-rail") 
				or (railA.name == "5d-power-rail-water" and railB.name == "straight-rail") 
				or (railA.name == "5d-curved-power-rail-water" and railB.name == "curved-rail")
				or (railA.name == "straight-rail" and railB.name == "5d-power-rail-water") 
				or (railA.name == "curved-rail" and railB.name == "5d-curved-power-rail-water") then
				
				return true
			end
		end
	end
	
	return false
end

function findWagonInTable(wagonsData, wagon)
	for i,wagonData in ipairs(wagonsData) do
		if wagonData.wagon ~= nil and wagon ~= nil and wagonData.wagon == wagon then
			return i
		end
	end
	return 0
end

function removeWagonFromTable(wagonsData, wagon)
	local loc = findWagonInTable(wagonsData, wagon)
	if loc == 0 then
		return
	end
	if wagonsData[loc] ~= nil then
		if wagonsData[loc]["proxy"]~= nil then
			for i,proxy in ipairs(wagonsData[loc]["proxy"]) do
				if proxy.valid then
					debugLog("Destroy Proxy: " .. proxy.name)
					proxy.destroy()
				end
			end
		end
	end
	table.remove(wagonsData, i)
	return wagons
end

function hasStaticProxies(entityName)
	if entityName ~= nil and (entityName == "curved-power-rail" or entityName == "straight-power-rail") then
		return true
	end
	if entityName ~= nil and (entityName == "5d-curved-power-rail-water" or entityName == "5d-power-rail-water") then
		return true
	end
	return false
end

function updateStaticProxies(position)
	local surface = game.surfaces['nauvis']
	--debugLog("updateStaticProxies")
	local staticProxyOwners = surface.find_entities_filtered{area = {{position.x - 0.5, position.y - 0.5}, {position.x + 0.5, position.y + 0.5}}}
	for i, owner in ipairs(staticProxyOwners) do
		if owner ~= nil and owner.valid then
			if hasStaticProxies(owner.name) then
				createStaticProxies(owner)
			end
		end
	end
end

function destroyStaticProxies(entity)
	--debugLog("destroyStaticProxies")
	if entity ~= nil and entity.valid then
		local staticProxiesPosition = getStaticProxiesPositions(entity)
		for i, value in pairs(staticProxiesPosition) do
			if value ~= nil then
				destroyStaticProxiesAt(value[1], value[2])
			end
		end
	end
end

function destroyStaticProxiesAt(proxyType, position)
	local surface = game.surfaces['nauvis']
	local foundProxies = surface.find_entities_filtered{area = {{position.x - 1.2 , position.y - 1.2}, {position.x + 1.2, position.y + 1.2}}, name=proxyType} --MAKE SMALLER SEARCH AREA NEXT VERSION
	for i, proxy in pairs(foundProxies) do
		if proxy ~= nil and proxy.valid then
			proxy.destroy()
		end
	end
end

function createStaticProxies(entity)
	if entity ~= nil and entity.valid then
		local staticProxiesPosition = getStaticProxiesPositions(entity)
		for i, value in pairs(staticProxiesPosition) do
			if value ~= nil then
				destroyStaticProxiesAt(value[1], value[2])
				--if not colidesWithRail(value[2]) then
					createProxy(value[1], value[2])
				--end
			end
		end
	end
end

function colidesWithRail(position)
	local surface = game.surfaces['nauvis']
	if position ~= nil then
		local entities = surface.find_entities_filtered{area = {{position.x - 0.22, position.y -0.22}, {position.x + 0.22, position.y + 0.22}}, type="rail"} 
		for i, entity in ipairs(entities) do
			if entity ~= nil and entity.valid then
				if entity.type == "rail"  then
					return true
				end
			end
		end
	end
	return false
end


function getStaticProxiesPositions(entity)
	--debugLog("getStaticProxiesPositions: " .. entity.direction)
	local positions = {}
	if entity ~= nil and entity.valid then	
		if entity.name == "curved-power-rail" then
			if entity.direction < 2 or (entity.direction > 3 and entity.direction < 6) then
				positions[1] = {"electric-pole-large-rail", {x=entity.position.x, y=entity.position.y + 2}}
				positions[2] = {"electric-pole-large-rail", {x=entity.position.x, y=entity.position.y - 2}}
			else
				positions[1] = {"electric-pole-large-rail", {x=entity.position.x + 2, y=entity.position.y}}
				positions[2] = {"electric-pole-large-rail", {x=entity.position.x - 2, y=entity.position.y}}
			end
			
		elseif entity.name == "straight-power-rail" then
			positions[1] = {"electric-pole-rail", entity.position}

		elseif entity.name == "5d-5d-curved-power-rail-water" then
			if entity.direction < 2 or (entity.direction > 3 and entity.direction < 6) then
				positions[1] = {"electric-pole-large-rail", {x=entity.position.x, y=entity.position.y + 2}}
				positions[2] = {"electric-pole-large-rail", {x=entity.position.x, y=entity.position.y - 2}}
			else
				positions[1] = {"electric-pole-large-rail", {x=entity.position.x + 2, y=entity.position.y}}
				positions[2] = {"electric-pole-large-rail", {x=entity.position.x - 2, y=entity.position.y}}
			end			
		elseif entity.name == "5d-power-rail-water" then
			positions[1] = {"electric-pole-rail", entity.position}--calculatePositionOfProxy(entity.position, convertDirectionToOrientation(entity.direction, 8), -0.5, 0.5, 0,0, "left")}
			--debugLog("POINTS x: " .. positions[1][2].x .. " y: " .. positions[1][2].y)
		end
	end
	return positions
end

function convertDirectionToOrientation(direction, directionCount)
	return (direction * (1 / directionCount))
end

function getHealth(wagon)
	if wagon ~= nil and wagon.valid then
		return wagon.health
	else
		return 600
	end
end

function updateHealth(wagonData)
	if hasValidWagon(wagonData) and (wagonData.wagon.name == "cargo-wagon-gun-turret" or wagonData.wagon.name == "cargo-wagon-laser-turret") and wagonData["proxy"] ~= nil then
		local wagonHeathDiff = 0
		if wagonData.wagon.health ~= wagonData["health"] then
				wagonHeathDiff = wagonData["health"] - wagonData.wagon.health
		end
		for i, proxy in ipairs(wagonData["proxy"]) do
			if proxy ~= nil and proxy.valid and (proxy.name == "laser-turret-mounted" or proxy.name == "gun-turret-mounted") then
				proxy.health = proxy.health - wagonHeathDiff
				wagonData.wagon.health = proxy.health
				break
			end
		end
		wagonData["health"] = wagonData.wagon.health
	end
	return wagonData
end

function updateWagonPosition(wagonData)
	if hasValidWagon(wagonData) then
		wagonData["position"] = wagonData.wagon.position
	end
	return wagonData
end

function updateWagonProxyPosition(wagonData)
	if hasValidProxy(wagonData) then
		wagonData["proxyPosition"] = wagonData.proxy[1].position
	end
	return wagonData
end

function hasValidProxy(wagonData)
	if wagonData ~= nil and wagonData.proxy ~= nil and wagonData.proxy[1] ~= nil and wagonData.proxy[1].valid then
		return true
	end
	return false
end

function hasValidWagon(wagonData)
	if wagonData ~= nil and wagonData.wagon ~= nil and wagonData.wagon.valid then
		--debugLog("Valid: " .. wagonData.wagon.name)
		return true
	end
	return false
end

function updateInventoryCount(wagonData)
	--debugLog("updateInventoryCount()")
	if hasValidWagon(wagonData) and hasInventory(wagonData.wagon) then
			local inventory = wagonData.wagon.get_inventory(1)
			wagonData["inventoryCount"] = inventory.get_item_count()
			--debugLog("count: " .. global.wagons[wagon]["inventoryCount"])
	else
		wagonData["inventoryCount"] = -1
	end
	return wagonData
end

function updateRequestSlots(wagonData)
	
	if wagonData ~= nil and wagonData.proxy ~= nil and isRequester(wagonData.proxy[1]) then
		local i = 0
		local slots = {}
		while i < 10 do
			i = i + 1
			
			slots[i] = wagonData.proxy[1].get_request_slot(i)
			if slots[i] == nil then
				--debugLog("nil at " .. i)
				slots[i] = {}
			end
		end
		wagonData["requestSlots"] = slots
	end
	return wagonData
end

function setRequestSlots(proxy, requestSlots)
   if isRequester(proxy)then
      --debugLog("Requester")
      local i = 0
      local slots = {}
      while i < 10 do
         i = i + 1
         local slot = requestSlots[i]
         if slot ~= nil and slot.name ~= nil then
            --if script.item_prototypes[slot.name] ~= nil then 
               --proxy.setrequestslot(slot, i)
            --end
         end
      end
   end
end



function updateLiquid(wagonData)
	if hasValidWagon(wagonData) and wagonData["proxy"] ~= nil then
		for i, proxy in ipairs(wagonData["proxy"]) do
			if hasLiquidStorage(proxy) then
				local liquid =  proxy.getliquid()
				if liquid ~= nil then
					wagonData["liquid"] = liquid
					debugLog(liquid.type .. ": " .. liquid.amount)
				end
				return
			end
		end
	end
	wagonData["liquid"] = nil
	return wagonData
end

--Accesses global.wagonsData
function findWagonDataFromEntity(entity)
	if entity ~= nil and entity.valid and global.wagonsData ~= nil then
		for i,wagonData in ipairs(global.wagonsData) do
			if wagonData ~= nil and wagonData.wagon ~= nil and wagonData.wagon == entity then
				return wagonData
			end
		end
	end
	return nil
end

function findWagonAtPosition(position)
	local surface = game.surfaces['nauvis']
	--debugLog("Looking at x: " .. position.x .. " y: " .. position.y)
	--local cargoWagons = script.find_entities{{position.x + 5, position.y - 5}, {position.x + 5, position.y + 5}}
	local cargoWagons = surface.find_entities_filtered{area = {{position.x - 1, position.y - 1}, {position.x + 1, position.y + 1}}} 
	for i,e in ipairs(cargoWagons) do
		--debugLog("found " .. e.name)
		if e.valid then
			if isKnownWagon(e.name) then
				return e
			end
		end
	end
end

function findWagonProxies(wagon)
	local surface = game.surfaces['nauvis']
	--debugLog("findProxy")
	if wagon ~= nil then
		if wagon.valid then
			--debugLog("findProxy, wagon exists")
			wagonProxies = {}
			for i, proxyType in ipairs(getWagonProxyTypes(wagon)) do
				local foundProxies = surface.find_entities_filtered{area = {{wagon.position.x - 3, wagon.position.y - 3}, {wagon.position.x + 3, wagon.position.y + 3}}, name=proxyType} 
				for i,e in ipairs(foundProxies) do
					if e.valid then
						--debugLog("Found Proxy!" .. e.name)
						table.insert(wagonProxies, e)
					end
				end
			end
			return wagonProxies
		end
	end
	return nil
end

function isKnownWagon(wagonName)
	if wagonName ~= nil then
		--debugLog(wagonName)
		if wagonName == "cargo-wagon-passive" or wagonName == "cargo-wagon-active" or wagonName == "cargo-wagon-roboport" 
		    or wagonName == "cargo-wagon-storage" or wagonName == "cargo-wagon-accumulator" or wagonName == "electric-locomotive"
			or wagonName == "liquid-wagon" or wagonName == "cargo-wagon-requester" or wagonName == "cargo-wagon-laser-turret" 
			or wagonName == "cargo-wagon-gun-turret" then
			return true
		end
	end
	return false
end

function providesEnergy(proxy)
	if proxy ~= nil and proxy.valid and proxy.name == "cargo-wagon-accumulator" then
		return true
	end
	return false
end

function getWagonProxyTypes(wagon)
	if wagon ~= nil then
		if wagon.valid then
			if wagon.name == "cargo-wagon-passive" then return {"logistic-chest-passive-provider-trans"}
			elseif wagon.name == "cargo-wagon-active" then return {"logistic-chest-active-provider-trans"}
			elseif wagon.name == "cargo-wagon-storage" then return {"logistic-chest-storage-provider-trans"}
			elseif wagon.name == "cargo-wagon-roboport" then return {"roboport-trans", "electric-pole-trans"} --, "basic-accumulator-trans"}
			elseif wagon.name == "cargo-wagon-accumulator" then return {"large-accumulator-trans", "electric-pole-trans"} --, "basic-accumulator-trans"}
			elseif wagon.name == "cargo-wagon-laser-turret" then return {"laser-turret-mounted", "electric-pole-trans"} --, "basic-accumulator-trans"}
			elseif wagon.name == "cargo-wagon-gun-turret" then return {"gun-turret-mounted"} --, "basic-accumulator-trans"}
			elseif wagon.name == "electric-locomotive" then 
				if wagon.train.speed ~= 0 then
					return { "locomotive-furnace-moving-trans", "electric-pole-trans"} --, "basic-accumulator-trans"} "locomotive-furnace-moving-trans",
				else
					return { "locomotive-furnace-static-trans", "electric-pole-trans"} 
				end
			elseif wagon.name == "liquid-wagon" then return {""} --"storage-tank-trans"} 
			elseif wagon.name == "cargo-wagon-requester" then 
				-- if global.apiVersion ~= "0.10" then
					-- printApiWarning("Requester Wagons only supported in 0.10 and above")
					-- return { "logistic-chest-passive-provider-trans" }
				-- end
				return {"logistic-chest-requester-trans"}
			end
			
			return "logistic-chest-passive-provider-trans" -- DEFAULT!
		end
	end
end

function getStaticProxyTypes(entity)
	if wagon ~= nil and wagon.valid then
		if entity.name == "straight-power-rail" then return {"electric-pole-rail"}
		elseif entity.name == "curved-power-rail" then return {"electric-pole-rail"}
		elseif entity.name == "5d-power-rail-water" then return {"electric-pole-rail"}
		elseif entity.name == "5d-curved-power-rail-water" then return {"electric-pole-rail"}
		end
	end
	
	return {"electric-pole-rail"} -- DEFAULT!
end

function rotatePoint(position, rotation)
	--debugLog("POSITION X: " .. position.x .. " Y: " .. position.y)
	--debugLog("ROTATION: " .. rotation)
	local radians = ((rotation * 2) - 1) * math.pi
	--debugLog("RADIANS: " .. radians)
	local cosr = math.cos(radians)
	local sinr = math.sin(radians)
	
	local newPosition = {x = (position.x * cosr) - (position.y * sinr), y = (position.y * cosr) + (position.x * sinr)}
	--position.x = math.cos(radians) * position.x
	--position.y = math.sin(radians) * position.y
	return newPosition
end


function calculatePositionOfProxy(position, orientation, xScale, yScale, xShift, yShift, positionType) -- scale = {xscale,yscale}, positionType = "hidden","left","moving","right", shiftPosition - {xShift, yShift}
	local mod = (orientation - 0.25) % 1 
	
	if positionType ~= nil then
		--debugLog("Not Moving")
		if positionType == "hidden" then
			if (orientation <= 1 and orientation > 0.5) or orientation == 0 then 
				mod = (orientation + 0.25) % 1 
			end
		elseif positionType == "left" then
			mod = (orientation + 0.25) % 1 
		elseif positionType == "moving" then
			if (orientation <= 1 and orientation > 0.5) or orientation == 0 then 
				mod = (mod + 0.5) % 1 
			end
		end
	end
	
	local transformedPosition = rotatePoint({x=0,y=1}, mod)
	
	local xMod = ( transformedPosition.x + xShift ) * xScale
	local yMod = ( transformedPosition.y + yShift )  * yScale
	
	if xMod < 0.001 and xMod > -0.001 then xMod = 0 end
	if yMod < 0.001 and yMod > -0.001 then yMod = 0 end
	
	return {x = position.x, y = position.y}
	--return {x = position.x + xMod, y = position.y + yMod}
end

function convertWagonsToWagonsData(wagons)
	local wagonsData = {}
	if wagons ~= nil then
		for wagon,value in pairs(wagons) do
			local newWagon = {}
			newWagon["wagon"] = wagon
			newWagon["position"] = value.position
			newWagon["proxy"] = value.proxy
			newWagon["inventoryCount"] = value.inventoryCount
			newWagon["liquid"] = value.liquid
			newWagon["requestSlots"] = value.requestSlots
			newWagon["health"] = value.health
			newWagon["energy"] = value.energy
			table.insert(wagonsData,newWagon)
		end
	end
	return wagonsData
end

function initWagonsData(wagonsData)
	local newWagons = {}

	if wagonsData ~= nil then
		for i, wagonData in ipairs(wagonsData) do
			local newValues = {}
			if wagonData.wagon.valid then
				debugLog("Wagon is valid " .. i)
				-- table.insert(newWagons,wadonData)
				addWagonToTable(newWagons, wagonData.wagon, wagonData["energy"], wagonData["liquid"])
			else
				debugLog("Wagon is invalid. " .. i)
				if wagonData["position"] ~= nil then
					cleanOldProxies(wagonData.proxyPosition)
					local newWagon = findWagonAtPosition(wagonData["position"])
					if newWagon ~= nil and newWagon.valid then
						addWagonToTable(newWagons, newWagon, wagonData["energy"], wagonData["liquid"])
						newWagons[i]["proxy"] = createProxies(newWagon, wagonData["energy"], wagonData["liquid"], wagonData["requestSlots"])
						--debugLog(newWagons[i]["proxy"])
					end
				end
			end
				
		end
	end
	return newWagons
end

function cleanOldProxies(position)
	local surface = game.surfaces['nauvis']
	if position ~= nil then
		local entities = surface.find_entities{{position.x-1, position.y-1}, {position.x+1, position.y+1}}
		for i, entity in ipairs(entities) do
			if entity ~= nil and entity.valid then
				--debugLog("DESTROY PROXY FROM THE PAST! " .. entity.name)
				if endswith(entity.name, "-trans") then
					--debugLog("DESTROY PROXY FROM THE PAST! " .. entity.name)
					entity.destroy()
				end
			end
					
		end
	end
end

function createProxies(wagon, energy, liquid, requestSlots)
	local proxies = {}
	if energy == nil then
		energy = 0
	end
	if wagon ~= nil and wagon.valid then
		--debugLog("wagon has no proxies, creating...")
		local proxyTypes = getWagonProxyTypes(wagon)
		-- local positionType = "hidden"
		-- if wagonSupportsLiveUpdate(wagon) then
			-- positionType = "moving"
		-- end
		
		local proxyPosition = wagon.position --calculatePositionOfProxy(wagon.position, wagon.orientation, 1, 1, 0, 0, positionType) -- I should really use the inbuilt method...
		if wagon.name == "cargo-wagon-gun-turret" or wagon.name == "cargo-wagon-laser-turret" then
			proxyPosition = {x = proxyPosition.x, y = proxyPosition.y + 0.1}-- + 0.5}
		end
		--debugLog("**PROXY x: " .. proxyPosition.x .. " y: " .. proxyPosition.y)
		--debugLog("**WAGON x: " .. wagon.position.x .. " y: " .. wagon.position.y)
		
		
		for i, proxyType in ipairs(proxyTypes) do
			if proxyPosition ~= nil then
				--debugLog("x: " .. proxyPosition.x .. " y: " .. proxyPosition.y .. " o: " .. wagon.orientation .. " COUNT " .. i)
				createProxy(proxyType, proxyPosition)
				
				local powerSet = false
				local foundProxies = findWagonProxies(wagon)
				for i, wagonProxy in ipairs(foundProxies) do
					--debugLog("WagonProxyCount: " .. i)
					if wagonProxy ~= nil and wagonProxy.valid then
						--debugLog("****** ProxyValid")
						if hasInventory(wagonProxy) and wagon.name ~= "electric-locomotive" then
							syncInventory(wagon, wagonProxy, -1)
						end
						
						if isRequester(wagonProxy) and requestSlots ~= nil then
							setRequestSlots(wagonProxy, requestSlots)
						end
						
						if hasEnergy(wagonProxy) and not powerSet then
							if setInitialEnergy(wagonProxy, energy) then
								powerSet = true
							end
						end
						
						if hasLiquidStorage(wagonProxy) then
							syncLiquidStorage(wagonProxy, liquid)
						end

						table.insert(proxies, wagonProxy)
					else
						--debugLog("******** ProxyNotValid")
					end
				end
			end
		end
	end
	return proxies
end

function processWagon(wagonData)
	if hasValidWagon(wagonData) then
		if wagonData.wagon.train == nil or wagonData.wagon.train.speed == 0 then
			--debugLog("wagon stopped or unattached")
			local proxyList = getWagonProxyTypes(wagonData.wagon)
			if wagonData["proxy"] == nil or wagonData["proxy"][1]==nil  then
				--debugLog("why????")
				wagonData["proxy"] = createProxies(wagonData.wagon, wagonData["energy"], wagonData["liquid"], wagonData["requestSlots"])
			elseif wagonData["proxy"][1] ~= nul and not wagonData["proxy"][1].valid then
				debugLog("Wagon has a proxy but it is invalid. WTF! time to destroy!") ------ NOOOOOOOOOOOOOOOOO BROKEN!
				wagonData["proxy"] = nil
			elseif wagonData["proxy"][1].name ~= proxyList[1] then
				--debugLog( wagonData["proxy"][1].name .. " != " .. proxyList[1])
				wagonData = syncAllState(wagonData)
				destroyProxies(wagonData["proxy"])
				wagonData["proxy"] = createProxies(wagonData.wagon, 0, nil, wagonData["requestSlots"])   --wagonData["energy"])
			else
				--debugLog("Wagon Energy: " .. wagonData["energy"])
				wagonData = syncAllState(wagonData)
			end
		else
			if wagonData["proxy"] ~= nil then
				wagonData = syncAllState(wagonData)
				local energy = 0
				if wagonSupportsLiveUpdate(wagonData.wagon) then
					if wagonData.name ~= name ~= "electric-locomotive"  then
						energy = wagonData.energy
					end
					destroyProxies(wagonData["proxy"])
					wagonData["proxy"] = createProxies(wagonData.wagon, energy	, wagonData["liquid"], wagonData["requestSlots"])
				else
					destroyProxies(wagonData["proxy"])
					wagonData["proxy"] = nil
				end
			end
		end
	end
	
	return wagonData
end

function syncLiquidStorage(proxy, liquid)
	local tankLiquid = proxy.getliquid
	if liquid ~= nil then
		--proxy.insertliquid(liquid)
		return true
	end
	return false
end


function hasLiquidStorage(proxy)
	if proxy ~= nil and proxy.valid and proxy.name == "storage-tank-trans" then 
		return true
	end
	return false
end

function isRequester(proxy)
	if proxy ~= nil and proxy.valid and proxy.name == "logistic-chest-requester-trans" then
		return true
	end
	return false
end

function wagonSupportsLiveUpdate(wagon)
	if wagon ~= nil and wagon.valid and (wagon.name == "electric-locomotive" or wagon.name == "cargo-wagon-accumulator")then
		return true
	else
		return false
	end
end

function proxySupportsLiveUpdate(proxy)
	if wagon ~= nil and proxy.valid and (proxy.name == "electric-pole-trans" or proxy.name == "large-accumulator-trans" or proxy.name == "locomotive-furnace-moving-trans") then
		return true
	else
		return false
	end
end

function proxyActiveWhenMoving(proxy)
	if proxy ~= nil and proxy.valid and (proxy.name == "locomotive-furnace-moving-trans" or proxy.name == "locomotive-furnace-static-trans" ) then
		return true
	else
		return false
	end
end

function syncAllState(wagonData)
	--debugLog("Sync State")
	local powerSet = false
	local liquidSet = false
	for i,proxy in ipairs(wagonData["proxy"]) do
		--debugLog("proxy!")
		if hasInventory(proxy) and wagonData.wagon.name ~= "electric-locomotive" then
			--debugLog("SyncInventory: " .. wagonData.wagon.name)
			syncInventory(wagonData.wagon, proxy, wagonData.inventoryCount)
			wagonData = updateRequestSlots(wagonData)
		end
		
		
		
		if hasLiquidStorage(proxy) and not liquidSet then
			liquidSet = syncLiquidStorage(wagonData.wagon, wagonData["liquid"])
		end
		
		if not powerSet and hasEnergy(proxy) then
			--debugLog("Wagon Energy:" .. wagonData.energy)
			if updateWagonEnergy(wagonData, proxy) then
				--debugLog("Set Energy: " .. wagonData["energy"] .. " asda " .. proxy.energy)
				powerSet = true
				
				
				if wagonData.wagon.name == "electric-locomotive" then
					local inventory = wagonData.wagon.get_inventory(1)
					--debugLog("electric-locomotive energy " .. wagonData.wagon.energy)
					
					--inventory.clear()
					local needsFuel = true
					for name,count in pairs(inventory.get_contents()) do
						needsFuel = false
					end
					
					--clearInventory(wagonData.wagon, 1)
					if proxy.energy > 0 and needsFuel then
						
							
						inventory.insert({name="5d-coal",count=1})
						
						-- debugLog("ENERGY!!! :" .. wagonData.wagon.energy)
						-- wagonData.wagon.energy = 700000000000
						-- debugLog("MOARENERGY!!! :" .. wagonData.wagon.energy)
						--wagonData.wagon.energy = wagonData.wagon.energy + 100000
						--if wagonData.wagon.train.speed == 0 then
							--local pin = proxy.get_inventory(1)
							--clearInventory(proxy, 1)
							--clearInventory(proxy, 2)
						--end
					-- elseif needsFuel then
						-- local needsEnergy = true
						
						-- for i, carriage in ipairs(wagonData.wagon.train.carriages) do
							-- if carriage.valid and providesEnergy(carriage) and needsEnergy then
							
								-- debugLog("******************Why are we here again? " .. carriage.name)
								-- local energyUsed = (700000) -- (700000 / 3)is watts / times run per second. Should be calculated at runtime
								-- debugLog(energyUsed)
								
								-- local wagonData = findWagonDataFromEntity(carriage)
								-- if wagonData ~= nil and wagonData.proxy ~= nil and wagonData.proxy[1] ~= nil and wagonData.proxy[1].valid and wagonData.proxy[1].energy ~= nil and wagonData.proxy[1].energy > 0 then
									-- --wagonData.energy = 
								-- -- local tempProxies = findWagonProxies(carriage)
								-- -- if tempProxies ~= nil and tempProxies[1] ~= nil and tempProxies[1].valid and tempProxies[1].energy ~= nil and  tempProxies[1].energy > 0 then
									-- debugLog("We have an accumlator with energy " .. wagonData.proxy[1].energy)
									-- wagonData.proxy[1].energy = wagonData.proxy[1].energy - energyUsed
									-- wagonData.energy = wagonData.proxy[1].energy
									-- inventory.insert({name="coal",count=1})
									-- needsEnergy = false
								-- -- break
								-- end
							-- end
						-- end
					end
				end
			end
		end
	end
	return wagonData
end

function clearInventory(entity, inventoryNumber)
	if hasInventory(entity, inventoryNumber) then
		local inv = entity.get_inventory(1)
		for name, count in pairs(inv.get_contents()) do
			--debugLog("Remove :" .. name .. " count: " .. count)
			inv.remove({name=name,count=count})
		end
	end
end

function hasInventory(proxy, inventoryNumber)
	if inventoryNumber == nil or inventoryNumber == 0 then
		inventoryNumber = 1
	end
	
	if proxy ~= nil and proxy.valid and pcall(function () proxy.get_inventory(1) end) then
		return true
	end
	return false
end

function setInitialEnergy(proxy, energy) -- =) NEEEDS FIXING! I should either create a power cart! or use the train power.
	--debugLog("Setting max power: " .. energy)
	if proxy ~= nil and proxy.valid and energy ~= nil then
		proxy.energy = energy
		return true
	end
	return false
end

function transferEnergy(wagon, proxy)
	--debugLog(proxy.name .. ": " .. proxy.energy)
end

function updateWagonEnergy(wagonData, proxy)
	if hasValidWagon(wagonData) and proxy ~= nil and proxy.valid and proxy.energy ~= nil then
		if wagonData.wagon.name ~= "electric-locomotive" then
			--debugLog(wagonData.wagon.name .. " energy: " .. proxy.energy)
			wagonData["energy"] = proxy.energy
			--debugLog(wagonData["energy"])
		end
		return true
	end
	return false
end

function hasEnergy(proxy)
	if proxy ~= nil and proxy.valid and proxy.energy ~= nil then
		--debugLog(proxy.name .. " has energy: " .. proxy.energy)
		return true
	end
	return false
end


function destroyProxies(proxies)
	for i, proxy in ipairs(proxies) do
		if proxy.valid then
			destroyProxy(proxy)
		end
	end
end

function destroyProxy(proxy)
	if proxy.valid then
		--debugLog("Destroy " .. proxy.name)
		proxy.destroy()
	end
end


function syncInventory(wagon, proxy, inventoryCount) -- inventoryCount should be -1 for first sync
	if proxy == nil or not proxy.valid then
		debugLog("Proxy does not exist. something is wrong, we should not be here")
		--global.wagons[wagon]["proxy"] = nil
		return
	end
	local wagonInventory = wagon.get_inventory(1)
	local proxyInventory = proxy.get_inventory(1)
	
	--debugLog("currentCount: " .. wagonInventory.get_item_count() .. " previous: " .. inventoryCount)
	if wagonInventory.get_item_count() ~= inventoryCount then
		--debugLog("copy to proxy")
		local wagonInventory = wagon.get_inventory(1)
		local proxyInventory = proxy.get_inventory(1)
		if wagon.name == "cargo-wagon-roboport" then
			copyInventory(wagonInventory, proxyInventory, "logistic-robot")
			copyInventory(wagonInventory, proxyInventory, "construction-robot")
			copyInventory(wagonInventory, proxy.get_inventory(2), "repair-tool")
		elseif wagon.name == "cargo-wagon-gun-turret" then
			copyInventory(wagonInventory, proxyInventory, "ammo")
			--copyInventory(wagonInventory, proxyInventory, "piercing-bullet-magazine")
		else
			copyInventory(wagonInventory, proxyInventory, "")
		end
	elseif not compareInventories(wagonInventory, proxyInventory) then
		if wagon.name == "cargo-wagon-roboport" then
			copyInventory(proxyInventory, wagonInventory, "logistic-robot")
			copyInventory(proxyInventory, wagonInventory, "construction-robot")
			copyInventory(proxy.get_inventory(2), wagonInventory, "repair-tool")
		elseif wagon.name == "cargo-wagon-gun-turret" then
			copyInventory(proxyInventory, wagonInventory, "ammo")
			--copyInventory(proxyInventory, wagonInventory, "piercing-bullet-magazine")
			--debugLog("copy to wagon")
		else
			copyInventory(proxyInventory, wagonInventory, "*")
		end
	end
end

function compareInventories(inventoryA, inventoryB)
	if inventoryA.get_item_count() ~= inventoryB.get_item_count() then
		return false
	else
		local contentsA = inventoryA.get_contents()
		local contentsB = inventoryB.get_contents()
		for name, count in pairs(contentsA) do
			if contentsB[name] == nil or contentsB[name] ~= count then
				return false
			end
		end
	end
	return true
end

function getItemTypeFromName(name)
	local item = script.item_prototypes[name]
	if item ~= nil then
		return item.type
	end
end

function getEntityTypeFromName(name)
	local entity = script.entity_prototypes[name]
	if entity ~= nil then
		return entity.type
	end
end

function copyInventory(copyFrom, copyTo, filter)
	local activeFilter = filter
	if filter == nil or filter == "" then
		filter = "*"
	end
	
	if copyFrom ~= nil and copyTo ~= nil then
		local action = {}
		local fromContents = copyFrom.get_contents()
		local toContents = copyTo.get_contents()
		for name,count in pairs(fromContents) do
			local filterType = getItemTypeFromName(name)
			if filterType == nil or filterType == "item" then
				filterType = getEntityTypeFromName(name)
			end
			if filter == name or filter == filterType or filter == "*" then
				local diff = getItemDifference(name,fromContents[name], toContents[name])
				--debugLog(diff)
				if diff ~= 0 then
					action[name] = diff
				end
			end
		end
		for name,count in pairs(toContents) do
			local filterType = getItemTypeFromName(name)
			if filter == name or filter == filterType or filter == "*" then
				if fromContents[name] == nul then
					action[name] = getItemDifference(name,fromContents[name],toContents[name])
				end
			end
		end
		for name,diff in pairs(action) do
			--debugLog("#################itemName: " .. name .. " diff: " .. diff)
			if diff > 0 then
				copyTo.insert({name=name,count=diff})
			elseif diff < 0 then
				copyTo.remove({name=name,count=0-diff})
			end
		end
	end
	
end

function getItemDifference(item, syncFromItemCount, syncToItemCount)
	
	if syncFromItemCount == nil then
		if syncToItemCount ~= nil then
			return 0 - syncToItemCount
		end
	elseif syncToItemCount == nil then 
		return syncFromItemCount
	else
		return syncFromItemCount - syncToItemCount
	end
	
	return 0
end

function createProxy(proxyType, proxyPosition)
	local surface = game.surfaces['nauvis']
	--local proxyPosition = findNewProxyPosition(position)
	if proxyPosition == nil then
		return false
	end

	--debugLog("ncp X: " .. proxyPosition.x .. " Y: " .. proxyPosition.y)
	--if (script.canplaceentity{name="smart-chest", position=proxyPosition}) then -- Can this be taken out? Of course, I already know it is non colliding
		--debugLog("Time to create " .. proxyType .. " at " .. proxyPosition.x .. " " .. proxyPosition.y)
		surface.create_entity{name=proxyType, position=proxyPosition, force=game.players[1].force}--Cambios para el multijugador
		return true
	--end
end

function getApiVersion()
	if pcall(function () script.removepath("versioncheck") end) then
		return "0.10"
	else
		return "0.9"
	end
end

function debugLog(message)
	if false then -- set for debug
		script.getplayer().print(message)
	end
end

function printApiWarning(message)
	if apiWarning == nil or not apiWarning then
		apiWarning = true
		script.player.print(message)
	end
end

function endswith(String,End)
   return End=='' or string.sub(String,-string.len(End))==End
end

remote.add_interface("dim_trains",
{
  railCreated = function(newPos)
    updateStaticProxiesNextTick(newPos)
  end
})