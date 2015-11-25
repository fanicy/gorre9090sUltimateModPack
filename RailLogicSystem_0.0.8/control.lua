require("defines")
require("util")
require("helpers.gui_helpers")

--local data={}
local classes = {}
--local _debug=false

local function debugLog(message)
  if _debug then -- set for debug
    game.player.print(tostring(message))
  end
end

local function ttostring(tab)
  local res=""
  if type(tab)=="table" then
    res="{"
    for k,v in pairs(tab) do
      res=res.." "..tostring(k).." = "..ttostring(v)..","
    end
    res=res.."}"
  else
    res=tostring(tab)
  end
  return res
end

local function getArea(pos,size)
	size=size or 1
	return {{pos.x-size,pos.y-size},{pos.x+size,pos.y+size}}
end

local function destroy(entity)
entity.destroy()
end

--Rail Switch
classes["rail-switch-lamp"]={
  onPlace=function(entity)
    debugLog("Placed switch")
    local rail = entity.surface.find_entities_filtered({area = getArea(entity.position, 0.5), type = "rail"})[1]
    if rail ~= nil then
      return {entity=entity,rail=rail,position=rail.position,railname=rail.name,active=true,direction=rail.direction}
    else
      return {entity=entity,rail=nil,active=false}
    end
  end,
  onDestroy=function(data)
    local rail = data.rail
    debugLog("Removed switch")
    if rail and rail.valid then
		pcall(destroy,rail)
    end
  end,
  onTick=function(data)
    local entity = data.entity
	if entity.energy < 0.5 then
		return
	end
    local r=entity.get_circuit_condition(1).fulfilled
    if r~=data.active then
      if r then -- activate
        local rail = entity.surface.find_entities_filtered({area = getArea(data.position or entity.position, 0.5), type = "rail"})[1]
        if rail then
          data.rail = rail
        else
          data.rail = entity.surface.create_entity({name=data.railname or "straight-rail",position=data.position or entity.position,force=entity.force,direction=data.direction})
        end
    else -- deactivate
        if data.rail and data.rail.valid then
          data.direction=data.rail.direction
		  data.railname=data.rail.name
		  data.position=data.rail.position
		  if not pcall(destroy,data.rail) then
			return
		  end
		  data.rail=nil
        else
          local rail = entity.surface.find_entities_filtered({area = getArea(data.position or entity.position, 0.5), type = "rail"})[1]
          if rail then
            data.direction=rail.direction
			data.position=rail.position
            data.railname=rail.name
            rail.destroy()
          else
            entity.die()
          end
        end
      end
      data.active=r
    end
  end
}

--Rail Signal Reader
classes["rail-signal-detector"]={
  onPlace=function(entity) return {entity=entity} end,
  onDestroy=function() end,
  onTick=function(k)
    local sum=0
    for i1,k1 in ipairs(k.entity.surface.find_entities_filtered({area=getArea(k.entity.position),type="rail-signal"})) do
      sum=sum+k1.signal_state
    end
    for i1,k1 in ipairs(k.entity.surface.find_entities_filtered({area=getArea(k.entity.position),type="rail-chain-signal"})) do
      sum=sum+k1.signal_state
    end
    local r=k.entity.get_circuit_condition(1)
    for i1,k1 in pairs(r.parameters) do
      k1.count=sum
    end
    k.entity.set_circuit_condition(1,r)
  end
}

local function getTrain(entity)
  return entity.train
end

local function OpenSCGUI(playerIndex,k,i)
  if k.gui[playerIndex] ~= nil then
    return
  end
  debugLog("Open Gui")
  GUI.PushLeftSection(playerIndex)
  k.gui[playerIndex] = GUI.PushParent(GUI.Frame("station_controller_"..i, "Set Destination Station", GUI.HORIZONTAL))
  GUI.PushParent(GUI.Flow("flow", GUI.VERTICAL))
  GUI.TextField("input", k.station).text = k.station
  GUI.PopAll()
end

local function CloseSCGUI(playerIndex,k,i)
  if k.gui[playerIndex]==nil then
    return
  end
  debugLog("Close Gui")
  k.gui[playerIndex].destroy()
  k.gui[playerIndex]=nil
end

classes["rail-station-controller"]={
onPlace=function(entity)
  return {entity=entity,gui={},station=""}
end,
onDestroy=function(entity)
	for k,v in pairs(entity.gui) do
		v.destroy()
	end
end,
onTick=function(obj,index)
  for playerIndex = 1, #game.players do
    if util.distance(game.players[playerIndex].position, obj.entity.position) < 2 then
      OpenSCGUI(playerIndex,obj,index)
    else
      CloseSCGUI(playerIndex,obj,index)
    end
    if obj.gui[playerIndex] then
      obj.station=obj.gui[playerIndex].flow.input.text
    end
  end

  if obj.entity.get_circuit_condition(1).fulfilled and obj.entity.energy > 0.5 then
	for i,k in ipairs(obj.entity.surface.find_entities(getArea(obj.entity.position))) do
	  local ok,train=pcall(getTrain,k)
	  if ok then
		for i,k in ipairs(train.schedule.records) do
			if tostring(k.station) == tostring(obj.station) then
				local sch=train.schedule
				if sch.current ~= i then
					if not train.manual_mode then
						train.manual_mode = true
						train.manual_mode = false
					end
					sch.current=i
					train.schedule=sch
					break
				end
			end
		end
		break
	  end
	end
  end
end
}

--Rail Train Detector
classes["rail-train-detector"]={
  onPlace=function(entity) return {entity=entity} end,
  onDestroy=function() end,
  onTick=function(k)
    local res=0
    for i,k in ipairs(k.entity.surface.find_entities(getArea(k.entity.position))) do
	  local ok,train=pcall(getTrain,k)
	  if ok then
		res=1
		break
	  end
    end
    local r=k.entity.get_circuit_condition(1)
    for i1,k1 in pairs(r.parameters) do
      k1.count=res
    end
    k.entity.set_circuit_condition(1,r)
  end
}

--Cargo Inventory Reader
classes["rail-cargo-reader"]={
  onPlace=function(entity) return {entity=entity} end,
  onDestroy=function() end,
  onTick=function(k)
	local cargos = (k.entity.surface.find_entities_filtered({area=getArea(k.entity.position),type="cargo-wagon"}))
	
	local out=k.entity.get_circuit_condition(1)
	local inv = {}
	for i=1,#cargos do
		for k,v in pairs(cargos[i].get_inventory(1).get_contents()) do
			inv[k] = (inv[k] or 0) + v
		end
	end

	local i=1
	for k,v in pairs(inv) do
		out.parameters[i]={signal={type = "item",name = k},count=v,index = i}
		i=i+1
		if i>30 then break end
	end
	for c=i,30 do 
		out.parameters[i]={signal={type = "item",name = nil},count = 1,index = i}
	end
	k.entity.set_circuit_condition(1,out)
  end
}


local function OpenMCGUI(playerIndex,k,i)
  if k.gui[playerIndex] ~= nil then
    return
  end
  debugLog("Open Gui")
  GUI.PushLeftSection(playerIndex)
  k.gui[playerIndex] = {GUI.PushParent(GUI.Frame("mode_controller_"..i, "When condition then", GUI.HORIZONTAL))}
  GUI.PushParent(GUI.Flow("flow", GUI.VERTICAL))
  k.gui[playerIndex].checkbox=GUI.CheckboxNOCLB( "setmode", "Set mode to", k.setmode )
  GUI.PopAll()
end

local function CloseMCGUI(playerIndex,k,i)
  if k.gui[playerIndex]==nil then
    return
  end
  debugLog("Close Gui")
  k.gui[playerIndex][1].destroy()
  k.gui[playerIndex]=nil
end

classes["rail-mode-controller"]={
onPlace=function(entity)
  return {entity=entity,gui={},setmode=false,checkbox=nil}
end,
onDestroy=function(entity)
	for k,v in pairs(entity.gui) do
		if v then
			v.destroy()
		end
	end
end,
onTick=function(obj,index)
  for playerIndex = 1, #game.players do
    if util.distance(game.players[playerIndex].position, obj.entity.position) < 2 then
      OpenMCGUI(playerIndex,obj,index)
    else
      CloseMCGUI(playerIndex,obj,index)
    end
    if obj.gui[playerIndex] then
      obj.setmode = obj.gui[playerIndex].checkbox.state
    end
  end

  if obj.entity.get_circuit_condition(1).fulfilled and obj.entity.energy > 0.5 then
	for i,k in ipairs(obj.entity.surface.find_entities(getArea(obj.entity.position))) do
	  local ok,train=pcall(getTrain,k)
	  if ok then
		if train.manual_mode~=obj.setmode then
			train.manual_mode = obj.setmode
		end
		break
	  end
	end
  end
end
}

--Cargo Inventory Reader
classes["rail-cargo-reader2"]={
  onPlace=function(entity) return {entity=entity} end,
  onDestroy=function() end,
  onTick=function(k)
	local inv = {}
	for i,k in ipairs(k.entity.surface.find_entities(getArea(k.entity.position))) do
	  local ok,train=pcall(getTrain,k)
	  if ok then
		if train.carriages.type == "cargo-wagon" then
			for k,v in pairs(train.carriages.get_inventory(1).get_contents()) do
				inv[k] = (inv[k] or 0) + v
			end
		end
		break
	  end
	end

	local i=1
	local out=k.entity.get_circuit_condition(1)
	for k,v in pairs(inv) do
		out.parameters[i]={signal={type = "item",name = k},count=v,index = i}
		i=i+1
		if i>60 then break end
	end
	for c=i,60 do 
		out.parameters[i]={signal={type = "item",name = nil},count = 1,index = i}
	end
	k.entity.set_circuit_condition(1,out)
  end
}

local function entityBuilt(event)
  if classes[event.created_entity.name]~= nil then
	local tab = global.railLogicSystem[event.created_entity.name]
    table.insert(tab,classes[event.created_entity.name].onPlace(event.created_entity))
	global.railLogicSystem[event.created_entity.name] = tab
  end
end

local function entityRemoved(event)
  if classes[event.entity.name]~= nil then
	for k, v in ipairs(global.railLogicSystem[event.entity.name]) do
      if v.entity==event.entity then
		local tab = global.railLogicSystem[event.entity.name]
        table.remove(tab,k)
		classes[event.entity.name].onDestroy(v)
		global.railLogicSystem[event.entity.name] = tab
        break
      end
    end
  end
end

local function onTick()
	for k, v in pairs(classes) do
		for q, i in pairs(global.railLogicSystem[k]) do
			if i.entity.valid then
				v.onTick(i,q)
			end
		end
	end
end

local function onLoad()
  if not global.railLogicSystem then global.railLogicSystem = {} end
  for k,v in pairs(classes) do
	global.railLogicSystem[k]=global.railLogicSystem[k] or {}
  end
end

script.on_init(onLoad)
script.on_load(onLoad)

script.on_event(defines.events.on_tick, onTick)

script.on_event(defines.events.on_built_entity, entityBuilt)
script.on_event(defines.events.on_robot_built_entity, entityBuilt)

script.on_event(defines.events.on_preplayer_mined_item, entityRemoved)
script.on_event(defines.events.on_robot_pre_mined, entityRemoved)
script.on_event(defines.events.on_entity_died, entityRemoved)