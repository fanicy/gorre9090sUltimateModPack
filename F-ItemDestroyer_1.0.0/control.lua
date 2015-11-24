require "defines"

script.on_event(defines.events.on_tick, function(event)
	if global.destroyer~=nil and math.random(30)==1 then
		for i,d in pairs(global.destroyer) do
			if d.entity.valid then
				d.entity.get_inventory(defines.inventory.chest).clear()
			else
				table.remove(global.destroyer,i)
			end
		end
	end
end)
script.on_event(defines.events.on_built_entity, function(event)
	if event.created_entity.name == "item-destroyer" then
		if global.destroyercount==nil then
			global.destroyer={}
			global.destroyercount=0
		end
		global.destroyercount=global.destroyercount+1
		global.destroyer[global.destroyercount]={}
		global.destroyer[global.destroyercount].entity=event.created_entity
		event.created_entity.operable=false
	end
end)