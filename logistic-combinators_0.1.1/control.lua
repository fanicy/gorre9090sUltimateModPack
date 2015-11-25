require "config"

local mod_version="0.1.3"

local lcombs={}

logistic_polling_rate=math.min(logistic_polling_rate,60)

local polling_cycles = math.floor(60/logistic_polling_rate)

---[[
local function print(...)
  return game.player.print(...)
end
--]]

--swap comment to toggle debug prints
--local function debug() end
local debug = print


local function deduceSignalValue(entity,signal,condNum)
  local t=2^31
  local v=0
  condNum=condNum or 1
  local condition=entity.get_circuit_condition(condNum)

  condition.condition.first_signal=signal
  condition.condition.comparator="<"
  while t~=1 do
    condition.condition.constant=v
    entity.set_circuit_condition(condNum,condition)
    t=t/2
    if entity.get_circuit_condition(condNum).fulfilled==true then
      v=v-t
    else
      v=v+t
    end
  end
  condition.condition.constant=v
  entity.set_circuit_condition(condNum,condition)
  if entity.get_circuit_condition(condNum).fulfilled then
    v=v-1
  end
  return v
end

local function onLoad()
  if not global.logistic_combinators then
    --unlock if needed
    for _,force in pairs(game.forces) do
      force.reset_recipes()
      force.reset_technologies()

      local techs=force.technologies
      local recipes=force.recipes
      if techs["logistic-robotics"].researched then
        recipes["logistic-combinator"].enabled=true
      end
    end

    global.logistic_combinators={lcombs={},version=mod_version}

  end
end


local function onTick(event)
  if event.tick%polling_cycles == polling_cycles-1 then
    for i=1,#lcombs do
      local lc=lcombs[i]
      if lc.comb.valid and lc.inserter.valid then
        local params=lc.comb.get_circuit_condition(1).parameters
        for i=1,15 do
          if params[i].signal.name and params[i].signal.type=="item" then
            --it's set to something, so deduce it
            local c=deduceSignalValue(lc.inserter,params[i].signal,2)
            if c~=params[i].count then
              params[i].count=c
            end
          elseif params[i].count~=0 then
            params[i].count=0
          end
        end
        lc.comb.set_circuit_condition(1,{parameters=params})
      end
    end
  global.logistic_combinators.lcombs = lcombs
  end

end

local function onPlaceEntity(event)
  local entity=event.created_entity
  if entity.name=="logistic-combinator" then
    local inserter=entity.surface.create_entity{
        name="lcomb-hidden-inserter",
        position=entity.position,
        force=entity.force,
      }
    inserter.insert({name="coal",count=1})
    lcombs[#lcombs+1]={comb=entity, inserter=inserter}
  end

end

local function onRemoveEntity(entity)
  for k,v in pairs(lcombs) do
    if v.comb==entity then
      v.inserter.clear_items_inside()
      v.inserter.destroy()
      break
    end
  end
end

script.on_init(onLoad)
script.on_load(onLoad)

script.on_event(defines.events.on_built_entity,onPlaceEntity)
script.on_event(defines.events.on_robot_built_entity,onPlaceEntity)

script.on_event(defines.events.on_preplayer_mined_item, function(event) onRemoveEntity(event.entity) end)
script.on_event(defines.events.on_robot_pre_mined, function(event) onRemoveEntity(event.entity) end)
script.on_event(defines.events.on_entity_died, function(event) onRemoveEntity(event.entity) end)

script.on_event(defines.events.on_tick,onTick)
