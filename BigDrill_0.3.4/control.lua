require "util"
require "defines"

script.on_init(function() On_Load() end)
script.on_load(function() On_Load() end)
script.on_event(defines.events.on_tick, function() On_Tick() end)

script.on_event(defines.events.on_built_entity, function(event) On_Built(event) end)
script.on_event(defines.events.on_robot_built_entity, function(event) On_Built(event) end)

script.on_event(defines.events.on_preplayer_mined_item, function(event) On_Removed(event) end)
script.on_event(defines.events.on_robot_pre_mined, function(event) On_Removed(event) end)
script.on_event(defines.events.on_entity_died, function(event) On_Removed(event) end)

--Values set at start..
tickerA = 120
function On_Load()
	if not global.unloaders then
		global.unloaders = {}
	--else
		--for k, unloader in pairs(global.unloaders) do
          --unloader(unloader)
		--end
	end
end

function On_Tick()
    if tickerA == 0 then
    tickerA = 120	
	 for k,v in pairs(global.unloaders) do
		findInv(k,v)
	 end
	else
	 tickerA = tickerA - 1
	end
end

function On_Built(event)
	  local ent = event.created_entity
    if ent ~= nil then
	  if ent.name == "ore-unloader" or ent.name == "ore-unloader-mk2" or ent.name == "ore-unloader-mk3"then
		table.insert(global.unloaders, ent)
	  end
	end
end

function On_Removed(event)
	local ent = event.entity
	if ent.name == "ore-unloader" or ent.name == "ore-unloader-mk2" or ent.name == "ore-unloader-mk3" then
		for i, unloader in pairs(global.unloaders) do
			if unloader == ent then
				table.remove(global.unloaders, i)
				return
			end
		end
	end
end

results = {}
radius = 2
n = 0
t = 0
--Default stacksize
maxStack = 50
maxInv = 800
function findInv(numb, info)
    if info.valid then
	n = 0
	moved = 0
	filled = info.get_item_count("iron-ore") + info.get_item_count("coal") + info.get_item_count("copper-ore") + info.get_item_count("stone")
	 --table.insert(radius, 
     local results = info.surface.find_entities{{info.position.x-radius,info.position.y-radius},{info.position.x+radius,info.position.y+radius}}
	     for d,e in pairs(results) do
		    if e.name == "cargo-wagon" then
			n = n + 1
			 local inv = e.get_inventory(1)
			 if info.name == "ore-unloader" then
			   maxMove = 50
			   maxInv = 800
			 elseif info.name == "ore-unloader-mk2" then
			   maxMove = 100
			   maxInv = 1200
			 elseif info.name == "ore-unloader-mk3" then
			   maxMove = 200
			   maxInv = 50*52
			 end
			 for itemname, count in pairs(inv.get_contents()) do
					local stack = {name = itemname, count = count}
					-- If we can dump it, dump it.
					--game.players[1].print(stack[1])
					if itemname == "copper-ore" or itemname == "iron-ore" or itemname == "coal" or itemname == "stone" and moved == 0 then
					moved = 1
					  if filled < maxInv then 
					   if count > maxMove then
					   --If stack is greater than 50(max stack for coal) then it moves only 50!
					    moving = {name = itemname, count = maxMove}
					    info.insert(moving)
					    inv.remove(moving)
					   else
					   --If it's less then just move it all
					    info.insert(stack)
					    inv.remove(stack)
					   end
                      end					   				  
					end							     	
			 end
			end		 
		end
	end
end




