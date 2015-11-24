require "util"
require "defines"
require "config"

local _debug = false

--Save/Load
script.on_init(function()
	onLoad()
end)

script.on_load(function()
	onLoad()
end)

function onLoad()
	if not global.logicBelts then
		debugLog("Loading Table")
		global.logicBelts = {}
	end
	if not global.logicBelts.lbelts then
		debugLog("Loading lbelts")
		global.logicBelts.lbelts = {}
	end
	if not global.logicBelts.cbelts then
		debugLog("Loading cbelts")
		global.logicBelts.cbelts = {}
	end
	if not global.logicBelts.lsignals then
		debugLog("Loading lsignals")
		global.logicBelts.lsignals = {}
	end
	if not global.logicBelts.rsignals then
		debugLog("Loading rsignals")
		global.logicBelts.rsignals = {}
	end
	if not global.logicBelts.vpipes then
		debugLog("Loading vpipes")
		global.logicBelts.vpipes = {}
	end
	if not global.logicBelts.rpipes then
		debugLog("Loading rpipes")
		global.logicBelts.rpipes = {}
	end
	if not global.logicBelts.tpipes then
		debugLog("Loading tpipes")
		global.logicBelts.tpipes = {}
	end
end

--Events
script.on_event(defines.events.on_built_entity, function(event)
	entity_build(event.created_entity)
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
	entity_build(event.created_entity)
end)

script.on_event(defines.events.on_preplayer_mined_item, function(event)
	entity_removed(event.entity)
end)

script.on_event(defines.events.on_robot_pre_mined, function(event)
	entity_removed(event.entity)
end)

script.on_event(defines.events.on_entity_died, function(event)
	entity_removed(event.entity)
end)

script.on_event(defines.events.on_tick, function(event)
	checkCondition(event)
	checkCount(event)
	checkLogicSignal(event)
	checkSignalReader(event)
	checkValveCondition(event)
	checkReaderPipes(event)
	checkTemperaturePipe(event)
end)

--Logic
function checkCondition(event)
	for i, group in ipairs(global.logicBelts.lbelts) do
		--condition 1 is the wire condition, 2 is the logistics system condition
		if group.belt.valid then
			if group.ghost.energy > 0 then --Turns the Belt off when the ghost(controller) has no energy
				if group.ghost.get_circuit_condition(1).fulfilled or group.ghost.get_circuit_condition(2).fulfilled then
					group.belt.direction = util.oppositedirection(group.ghost.direction)
					setLampState(group, "on")
				else
					group.belt.direction = group.ghost.direction
					setLampState(group, "off")
				end
			end
			
		else
			if group.ghost.valid then
				group.ghost.destroy() end
			if group.lamp.valid then
				group.lamp.destroy() end
			table.remove(global.logicBelts.lbelts,i)
		end
		
		if event.tick % 600 == 123 then
			group.ghost.clear_filter(1)
		end
	end
end

function checkCount(event)
	for i, group in ipairs(global.logicBelts.cbelts) do
		if group.belt.valid then
			if false then
			--[[ !!BROKEN!!
				if event.tick % 60 == 31 then
					local lane1 = group.belt.get_transport_line(1).get_contents()
					local lane2 = group.belt.get_transport_line(2).get_contents()
					
					debugLog("Lane1:" .. #lane1)
					for k, v in ipairs(lane1) do debugLog(k .. ":" .. v) end
					debugLog("Lane2:" .. #lane2)
					for k, v in ipairs(lane2) do debugLog(k .. ":" .. v) end
					
					for k, v in ipairs(lane2) do
						if lane1[k] ~= nil then
							lane1[k] = lane1[k] + valid
						else
							lane1[k] = v
						end
					end
					
					debugLog("Merge")
					for k, v in ipairs(lane1) do debugLog(k .. ":" .. v) end
					
					group.ghost.get_inventory(1).clear()
					
					local i = 1
					for itemName, itemCount in ipairs(lane1) do
						group.ghost.get_inventory(1)[i].set_stack({name = itemName, count = 1})
						i = i + 1
					end
				end
				]]
			else
				local itemCount = group.belt.get_item_count()
				
				if itemCount == 0 then
					group.ghost.get_inventory(1)[1].clear()
				else		
					if group.ghost.get_inventory(1)[1].valid_for_read then
						group.ghost.get_inventory(1)[1].count = itemCount
					else
						group.ghost.get_inventory(1)[1].set_stack({name = 'counter-signal', count = itemCount})--insert({name = 'iron-plate', count = itemCount})
					end
				end
			end
		else
			if group.ghost.valid then
				group.ghost.destroy() end
			table.remove(global.logicBelts.cbelts,i)
		end
	end
end

function checkLogicSignal(event)
	if event.tick % 351 == 0 then
		--debugLog("Number of Logic Signals, #" .. #global.logicBelts.lsignals)
	end
	
	for i, group in ipairs(global.logicBelts.lsignals) do
		if group.signal.valid then
			debugLog(i .. ", valid")
			local state
			if group.ghost.energy > 0 then
				if group.ghost.get_circuit_condition(1).fulfilled or group.ghost.get_circuit_condition(2).fulfilled then
					state = "open"
				else
					state = "closed"
				end
			end
			
			if group.signal.signal_state ~= defines.signal_state.reserved then
				setSignState(group, state)
			end
			
		end
	end
end

function checkSignalReader(event)
	for i, group in ipairs(global.logicBelts.rsignals) do
		if group.signal.valid then
			local state = group.signal.signal_state
			
			if group.lastState ~= state then
				if state == 0 then
					group.ghost.get_inventory(1)[1].clear()
				else
					if group.ghost.get_inventory(1)[1].valid_for_read then
						group.ghost.get_inventory(1)[1].count = state
					else
						group.ghost.get_inventory(1)[1].set_stack({name = 'signal-reader-state', count = state})--insert({name = 'iron-plate', count = itemCount})
					end
				end
			end
			
			group.lastState = state
		end
	end
end

function checkValveCondition(event)
	for i, group in ipairs(global.logicBelts.vpipes) do
		--condition 1 is the wire condition, 2 is the logistics system condition
		if group.pipe.valid then
			if group.ghost.energy > 0 then --Turns the Belt off when the ghost(controller) has no energy
				if group.ghost.get_circuit_condition(1).fulfilled or group.ghost.get_circuit_condition(2).fulfilled then
					group.pipe.active = true
				else
					group.pipe.active = false
				end
			end
		else
			if group.ghost.valid then
				group.ghost.destroy() end
			table.remove(global.logicBelts.vpipes,i)
		end
	
		if event.tick % 600 == 231 then
			group.ghost.clear_filter(1)
		end
	end
end

function checkReaderPipes(event)
	for i, group in ipairs(global.logicBelts.rpipes) do
		if group.pipe.valid then
		
			if group.pipe.fluidbox[1] ~= nil then
				group.ghost.fluidbox[1] = {type = group.pipe.fluidbox[1].type, amount = group.pipe.fluidbox[1].amount * 10}
			else
				group.ghost.fluidbox[1] = nil
			end
			
			
		end
	end
end

function checkTemperaturePipe(event)
	for i, group in ipairs(global.logicBelts.tpipes) do
		if group.pipe.valid then
			local temperature = 0
			if notNil(group.pipe.fluidbox[1], "temperature") then
				temperature = group.pipe.fluidbox[1].temperature
			end
			
			if temperature == 0 then
				group.ghost.get_inventory(1)[1].clear()
			else	
				if group.ghost.get_inventory(1)[1].valid_for_read then
					group.ghost.get_inventory(1)[1].count = temperature
				else
					group.ghost.get_inventory(1)[1].set_stack({name = 'temperature-signal', count = temperature})--insert({name = 'iron-plate', count = temperature})
				end
			end
		else
			if group.ghost.valid then
				group.ghost.destroy()
			end
			table.remove(global.logicBelts.tpipes,i)
		end
	end
end

function entity_build(entity)
	if isLogicBelt(entity.name) then
		logicBeltBuild(entity)
	elseif isCounterBelt(entity.name) then
		counterBeltBuild(entity)
	elseif isLogicSignal(entity.name) then
		logicSignalBuild(entity)
	elseif isSignalReader(entity.name) then
		signalReaderBuild(entity)
	elseif isValvePipe(entity.name) then
		valvePipeBuild(entity)
	elseif isReaderPipe(entity.name) then
		readerPipeBuild(entity)
	elseif isTemperaturePipe(entity.name) then
		temperaturePipeBuild(entity)
	end
end

function logicBeltBuild(entity)
	local new_group = {}
		
	new_group.belt = entity
	
	--Spawn ghost
	local new_ghost = game.surfaces[entity.surface.name].create_entity({name="logic-belt-ghost", position = entity.position, direction = util.oppositedirection(entity.direction), force = game.forces.player})
	new_group.ghost = new_ghost
	
	new_ghost.minable = false
	new_ghost.destructible = false
	new_ghost.active = false
	
	--Spawn lamp
	setLampState(new_group, "off")
	
	--Insert new group into table
	table.insert(global.logicBelts.lbelts, new_group)
end

function counterBeltBuild(entity)
	local new_group = {}
	
	new_group.belt = entity
	
	--Spawn ghost
	local new_ghost = game.surfaces[entity.surface.name].create_entity({name="counter-belt-ghost", position = entity.position, force = entity.force})
	new_group.ghost = new_ghost
	
	new_ghost.minable = false
	new_ghost.destructible = false
	new_ghost.operable = false
	
	--Insert new group into table
	table.insert(global.logicBelts.cbelts, new_group)
end

function logicSignalBuild(entity)
	local new_group = {}
	
	new_group.signal = entity
	
	--Spawn ghost
	local pos = getLogicSignalGhostPosition(entity.position, entity.direction)
	local new_ghost = game.surfaces[entity.surface.name].create_entity({name="logic-signal-ghost", position = pos, force = entity.force})
	new_group.ghost = new_ghost
	
	new_ghost.minable = false
	new_ghost.destructible = false
	new_ghost.active = false
	
	new_group.sign = nil
	
	table.insert(global.logicBelts.lsignals, new_group)
	debugLog("Logic Signal Build, #" .. #global.logicBelts.lsignals)
end

function signalReaderBuild(entity)
	local new_group = {}
	
	new_group.signal = entity
	
	--Spawn ghost
	local pos = getLogicSignalGhostPosition(entity.position, entity.direction)
	local new_ghost = game.surfaces[entity.surface.name].create_entity({name="signal-reader-ghost", position = pos, force = entity.force})
	
	new_group.ghost = new_ghost
	
	new_ghost.minable = false
	new_ghost.destructible = false
	new_ghost.operable = false
	
	table.insert(global.logicBelts.rsignals, new_group)
end

function valvePipeBuild(entity)
	local new_group = {}
	
	new_group.pipe = entity
	
	--Spawn Ghost
	local new_ghost = game.surfaces[entity.surface.name].create_entity({name="valve-pipe-ghost", position = entity.position, force = entity.force})
	
	new_group.ghost = new_ghost
	
	new_ghost.minable = false
	new_ghost.destructible = false
	new_ghost.active = false
	
	table.insert(global.logicBelts.vpipes, new_group)
end

function readerPipeBuild(entity)
	local new_group = {}
	
	new_group.pipe = entity
	
	--Spawn Ghost
	local new_ghost = game.surfaces[entity.surface.name].create_entity({name="reader-pipe-ghost", position = entity.position, force = entity.force})
	
	new_group.ghost = new_ghost
	
	new_ghost.minable = false
	new_ghost.destructible = false
	
	table.insert(global.logicBelts.rpipes, new_group)
end

function temperaturePipeBuild(entity)
	local new_group = {}
	
	new_group.pipe = entity
	
	--Spawn ghost
	local new_ghost = game.surfaces[entity.surface.name].create_entity({name="temperature-pipe-ghost", position = entity.position, force = entity.force})
	
	new_group.ghost = new_ghost
	
	new_ghost.minable = false
	new_ghost.destructible = false
	new_ghost.operable = false
	
	table.insert(global.logicBelts.tpipes, new_group)
end


function entity_removed(entity)
	if isLogicBelt(entity.name) then
		logicBeltRemoved(entity)
	elseif isCounterBelt(entity.name) then
		counterBeltRemoved(entity)
	elseif isLogicSignal(entity.name) then
		logicSignalRemoved(entity)
	elseif isSignalReader(entity.name) then
		signalReaderRemoved(entity)
	elseif isValvePipe(entity.name) then
		valvePipeRemoved(entity)
	elseif isReaderPipe(entity.name) then
		readerPipeRemoved(entity)
	elseif isTemperaturePipe(entity.name) then
		temperaturePipeRemoved(entity)
	end
end

function logicBeltRemoved(entity)
	for i, group in ipairs(global.logicBelts.lbelts) do
		if notNil(group.belt, "position") then
			--Searching for the position of the belt to remove the lamp and the ghost(controller)
			if group.belt.position.x == entity.position.x and group.belt.position.y == entity.position.y then
			
				if group.ghost.valid then
					group.ghost.destroy() end
				if group.lamp.valid then
					group.lamp.destroy() end
					
				table.remove(global.logicBelts.lbelts, i)
				break
			end
		end
	end
end

function counterBeltRemoved(entity)
	for i, group in ipairs(global.logicBelts.cbelts) do
		if notNil(group.belt, "position") then
			--Searching for the position of the belt to remove the ghost
			if group.belt.position.x == entity.position.x and group.belt.position.y == entity.position.y then
			
				if group.ghost.valid then
					group.ghost.destroy() end
				
				table.remove(global.logicBelts.cbelts, i)
				break
			end
		end
	end
end

function logicSignalRemoved(entity)
	for i, group in ipairs(global.logicBelts.lsignals) do
		if notNil(group.signal, "position") then
			--Searching for the position of the signal to remove the ghost
			if group.signal.position.x == entity.position.x and group.signal.position.y == entity.position.y then
				
				if group.ghost.valid then
					group.ghost.destroy()
				end
					
				if group.sign ~= nil then
					if group.sign.valid then
						group.sign.destroy()
					end 
				end
				
				table.remove(global.logicBelts.lsignals, i)
				break
			end
		end
	end
end

function signalReaderRemoved(entity)
	for i, group in ipairs(global.logicBelts.rsignals) do
		if notNil(group.signal, "position") then
			--Searching for the position of the signal to remove the ghost
			if group.signal.position.x == entity.position.x and group.signal.position.y == entity.position.y then
				
				if group.ghost.valid then
					group.ghost.destroy()
				end
				
				table.remove(global.logicBelts.rsignals, i)
				break
			end
		end
	end
end

function valvePipeRemoved(entity)
	for i, group in ipairs(global.logicBelts.vpipes) do
		if notNil(group.pipe, "position") then
			--Searching for the position of the pipe to remove the ghost
			if group.pipe.position.x == entity.position.x and group.pipe.position.y == entity.position.y then
			
				if group.ghost.valid then
					group.ghost.destroy() end
				
				table.remove(global.logicBelts.vpipes, i)
				break
			end
		end
	end
end

function readerPipeRemoved(entity)
	for i, group in ipairs(global.logicBelts.rpipes) do
		if notNil(group.pipe, "position") then
			--Searching for the position of the pipe to remove the ghost
			if group.pipe.position.x == entity.position.x and group.pipe.position.y == entity.position.y then
			
				if group.ghost.valid then
					group.ghost.destroy() end
				
				table.remove(global.logicBelts.rpipes, i)
				break
			end
		end
	end
end

function temperaturePipeRemoved(entity)
	for i, group in ipairs(global.logicBelts.tpipes) do
		if notNil(group.pipe, "position") then
			--Searching for the position of the pipe to remove the ghost
			if group.pipe.position.x == entity.position.x and group.pipe.position.y == entity.position.y then
			
				if group.ghost.valid then
					group.ghost.destroy() end
				
				table.remove(global.logicBelts.tpipes, i)
				break
			end
		end
	end
end

function setLampState(group, state)
	if group.lastState == state then return end
	
	if group.lamp ~= nil then
		if group.lamp.valid then
			group.lamp.destroy()
		end
	end
	
	local pos = { x = group.belt.position.x + 0.4, y = group.belt.position.y + 0.38 }
	local e_name = nil
	
	if state == "on" then
		e_name = "logic-belt-lamp-on"
		group.lastState = "on"
	else
		e_name = "logic-belt-lamp-off"
		group.lastState = "off"
	end
	group.lamp = game.surfaces["nauvis"].create_entity({name= e_name, position = pos, force = game.forces.player})
	group.lamp.minable = false
	group.lamp.destructible = false
end

function setSignState(group, state)
	if group.lastState == state then
		--debugLog("No Change")
		return
	end
	
	if state == "open" then
		--debugLog("Remove Sign")
		if group.sign ~= nil then
			if group.sign.valid then
				group.sign.destroy()
			end
			group.sign = nil
		end
		group.lastState = state
	elseif state == "closed" then
		--debugLog("Build Sign")
		if group.sign == nil then
			if group.signal.signal_state ~= defines.signal_state.closed and safe_placement then
				local pos = getLogiclsignalsignPosition(group.signal.position, group.signal.direction)
				group.sign = game.surfaces["nauvis"].create_entity({name="stop-sign", position = pos, direction = group.signal.direction, force = game.forces.player})
				
				if group.sign ~= nil then
					group.lastState = state
					
					group.sign.minable = false
					group.sign.destructible = false
					--group.sign.active = false
				end
			end
		end
	end
end

function isLogicBelt(name)
	if string.match(name, "logic%-transport%-belt") ~= nil then
		return true
	else
		return false
	end
end

function isCounterBelt(name)
	if string.match(name, "counter%-transport%-belt") ~= nil then
		return true
	else
		return false
	end
end

function isLogicSignal(name)
	if string.match(name, "logic%-signal") ~= nil then
		return true
	else
		return false
	end
end

function isSignalReader(name)
	if string.match(name, "signal%-reader") ~= nil then
		return true
	else
		return false
	end
end

function isValvePipe(name)
	if string.match(name, "valve%-pipe") ~= nil then
		return true
	else
		return false
	end
end

function isReaderPipe(name)
	if string.match(name, "reader%-pipe") ~= nil then
		return true
	else
		return false
	end
end

function isTemperaturePipe(name)
	if string.match(name, "temperature%-pipe") ~= nil then
		return true
	else
		return false
	end
end

function getLogicSignalGhostPosition(position, direction)
	if direction == defines.direction.north then
		return {position.x +	0.5,	position.y +	0}
	elseif direction == defines.direction.northeast then
		return {position.x +	0,		position.y +	0.5}
	elseif direction == defines.direction.east then
		return {position.x +	0,		position.y +	0.5}
	elseif direction == defines.direction.southeast then
		return {position.x +	-0.5,	position.y +	0}
	elseif direction == defines.direction.south then
		return {position.x +	-0.5,	position.y +	0}
	elseif direction == defines.direction.southwest then
		return {position.x +	0,		position.y +	-0.5}
	elseif direction == defines.direction.west then
		return {position.x +	0,		position.y +	-0.5}
	elseif direction == defines.direction.northwest then
		return {position.x +	0.5,	position.y +	0}
	end
end

function getLogiclsignalsignPosition(position, direction)
	if direction == defines.direction.north then
		return {position.x +	1.5,	position.y +	1.25}
	elseif direction == defines.direction.northeast then
		return {position.x +	0.3,	position.y +	1.4}
	elseif direction == defines.direction.east then
		return {position.x +	-1.5,	position.y +	1.5}
	elseif direction == defines.direction.southeast then
		return {position.x +	-1.2,	position.y +	0.75}
	elseif direction == defines.direction.south then
		return {position.x +	-1.5,	position.y +	-1.7}
	elseif direction == defines.direction.southwest then
		return {position.x +	-0.6,	position.y +	-1.4}
	elseif direction == defines.direction.west then
		return {position.x +	1.5,	position.y +	-1.5}
	elseif direction == defines.direction.northwest then
		return {position.x +	1.5,	position.y +	0.1}
	end
end

function debugLog(message)
	if _debug then -- set for debug
		for _, player in ipairs(game.players) do
			player.print(tostring(message))
		end
	end
end

function notNil(class, var)
	value = false
	pcall(function()
		if class[var]
		then
			value = true
		end
	end)
	return value
end

--[[
for k, v in ipairs(game.local_player.selected.get_inventory(1).get_contents()) do
	game.local_player.print(tostring(k..":"..v))
end
]]
