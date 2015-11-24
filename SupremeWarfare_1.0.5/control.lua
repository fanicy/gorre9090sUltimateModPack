require "defines"
require "scripts/conf_artillery"
require "scripts/artillery"

--remote.addinterface("supremewarfare", {version= function()return "1.0.4"end})

local loaded

function reduceCooldown()
	if global.listArty ~= nil then
		for k,v in pairs(global.listArty) do
			if v[1].valid and v[2].valid then
				v[3]=v[3]-1
				if v[3] <=0 then
					processArty(v)
				end
			else
				if v[1].valid then
					v[1].destroy()
				end
				if v[2].valid then
					v[2].destroy()
				end
				table.remove(global.listArty, k)
				if #global.listArty == 0 then
					global.listArty = nil
				end
			end
		end
	end
end

function ticker()
	if global.listArty ~= nil then
		if global.sbticks == 0 or global.sbticks == nil then
			global.sbticks = 60
			reduceCooldown()
		else
			global.sbticks = global.sbticks - 1
		end
	else
		game.on_event(defines.events.on_tick, nil)
	end
end

script.on_load(function()
	if not loaded then
		loaded = true
		if global.listArty ~= nil then
			game.on_event(defines.events.on_tick, ticker)
		end
	end
end)

script.on_init(function()
	loaded = true
	
	if global.listArty ~= nil then
		game.on_event(defines.events.on_tick, ticker)
	end
end)

function isArty(name)
if name =="sb-artillery-mk1" or name =="sb-artillery-mk2" or name =="sb-artillery-mk3" or name =="sb-rocketlauncher-mk3" or name =="sb-artillery-mk4" then
	return true
else
	return false
end
end
function isTarget(name)
if name == "sb-smoke-cloud" then
	return true
else
	return false
end
end

function builtEntity(event)
	local newArty
	local newArtyI
	local artyName
	
	if isArty(event.created_entity.name) then
		artyName=event.created_entity.name
	end
	
	if artyName ~= nil then
		newArty = game.surfaces["nauvis"].create_entity({name = artyName, position = event.created_entity.position, direction = event.created_entity.direction, force = game.forces.player})
		newArtyI = game.surfaces["nauvis"].create_entity({name = artyName.."i", position = event.created_entity.position, direction = event.created_entity.direction, force = game.forces.player})
		newArtyI.health = event.created_entity.health
		newArty.health = event.created_entity.health
		newArty.destructible = false
		event.created_entity.destroy()
		newArty.operable = false
		newArtyI.operable = true
		if global.listArty == nil then
			global.listArty = {}
			game.on_event(defines.events.on_tick, ticker)
		end
		table.insert(global.listArty, {newArty,newArtyI,0})
	end
end
--[[
function destroyArty(event)
	if event.entity.name == "sb-artillery-mk1i" or event.entity.name =="sb-artillery-mk2i" or event.entity.name =="sb-artillery-mk3i" or event.entity.name =="sb-artillery-mk4i" then
		for k,v in pairs(global.listArty) do
			if v[1].valid ==false or v[2].valid == false then
				if v[1].valid then
					v[1].destroy()
				end
				if v[2].valid then
					v[2].destroy()
				end
				table.remove(global.listArty, k)
				if #global.listArty == 0 then
					global.listArty = nil
				end
			end
		end
	end
end
]]
function addTarget(event)
	if isTarget(event.entity.name) then
		if global.listTarget == nil then
			global.listTarget = {}
		end
		table.insert(global.listTarget, event.entity)
	end
end
script.on_event(defines.events.on_built_entity, builtEntity)
script.on_event(defines.events.on_robot_built_entity, builtEntity)
script.on_event(defines.events.on_trigger_created_entity, addTarget)
--game.onevent(defines.events.onpreplayermineditem, destroyArty)