require "defines"

script.on_event(defines.events.on_tick, function(event)
	if global.stonepiles~=nil and event.tick%60==0 then								--STONE PILE--
		for i,d in pairs(global.stonepiles) do
			if d.entity.valid then
				local stonecount=d.entity.get_item_count("stone")
				if stonecount>0 then
					d.entity.get_inventory(1).remove{name="stone",count=stonecount}
				end
				if d.entity.get_inventory(1).get_item_count("waste")~=0 then
					wastecount=99-d.entity.get_inventory(1).get_item_count("waste")
				else
					wastecount=99
				end
				waste=d.entity.get_inventory(1).get_item_count("waste")
				if wastecount>=1 then
					d.entity.insert({name="waste",count=wastecount})
				end
				if d.entity.get_inventory(1).can_insert({name="waste",count=1})==false then
					d.entity.get_inventory(1).clear()
					if stonecount~=0 then
						d.entity.insert{name="stone",count=stonecount}
					end
					d.entity.insert({name="waste",count=5+waste})
				else
					d.entity.get_inventory(1).clear()
					if stonecount~=0 then
						d.entity.insert{name="stone",count=stonecount}
					end
					if waste>=1 then
						d.entity.insert({name="waste",count=waste})
					end
				end
			end
		end
	end
	if global.coalpiles~=nil and event.tick%60==0 then								--COAL PILE--
		for i,d in pairs(global.coalpiles) do
			if d.entity.valid then
				local coalcount=d.entity.get_item_count("coal")
				if coalcount>0 then
					d.entity.get_inventory(1).remove{name="coal",count=coalcount}
				end
				if d.entity.get_inventory(1).get_item_count("waste")~=0 then
					wastecount=99-d.entity.get_inventory(1).get_item_count("waste")
				else
					wastecount=99
				end
				waste=d.entity.get_inventory(1).get_item_count("waste")
				if wastecount>=1 then
					d.entity.insert({name="waste",count=wastecount})
				end
				if d.entity.get_inventory(1).can_insert({name="waste",count=1})==false then
					d.entity.get_inventory(1).clear()
					if coalcount~=0 then
						d.entity.insert{name="coal",count=coalcount}
					end
					d.entity.insert({name="waste",count=5+waste})
				else
					d.entity.get_inventory(1).clear()
					if coalcount~=0 then
						d.entity.insert{name="coal",count=coalcount}
					end
					if waste>=1 then
						d.entity.insert({name="waste",count=waste})
					end
				end
			end
		end
	end
	if global.ironorepiles~=nil and event.tick%60==0 then							--IRON ORE PILE--
		for i,d in pairs(global.ironorepiles) do
			if d.entity.valid then
				local ironorecount=d.entity.get_item_count("iron-ore")
				if ironorecount>0 then
					d.entity.get_inventory(1).remove{name="iron-ore",count=ironorecount}
				end
				if d.entity.get_inventory(1).get_item_count("waste")~=0 then
					wastecount=99-d.entity.get_inventory(1).get_item_count("waste")
				else
					wastecount=99
				end
				waste=d.entity.get_inventory(1).get_item_count("waste")
				if wastecount>=1 then
					d.entity.insert({name="waste",count=wastecount})
				end
				if d.entity.get_inventory(1).can_insert({name="waste",count=1})==false then
					d.entity.get_inventory(1).clear()
					if ironorecount~=0 then
						d.entity.insert{name="iron-ore",count=ironorecount}
					end
					d.entity.insert({name="waste",count=5+waste})
				else
					d.entity.get_inventory(1).clear()
					if ironorecount~=0 then
						d.entity.insert{name="iron-ore",count=ironorecount}
					end
					if waste>=1 then
						d.entity.insert({name="waste",count=waste})
					end
				end
			end
		end
	end
	if global.copperorepiles~=nil and event.tick%60==0 then							--COPPER ORE PILE--
		for i,d in pairs(global.copperorepiles) do
			if d.entity.valid then
				local copperorecount=d.entity.get_item_count("copper-ore")
				if copperorecount>0 then
					d.entity.get_inventory(1).remove{name="copper-ore",count=copperorecount}
				end
				if d.entity.get_inventory(1).get_item_count("waste")~=0 then
					wastecount=99-d.entity.get_inventory(1).get_item_count("waste")
				else
					wastecount=99
				end
				waste=d.entity.get_inventory(1).get_item_count("waste")
				if wastecount>=1 then
					d.entity.insert({name="waste",count=wastecount})
				end
				if d.entity.get_inventory(1).can_insert({name="waste",count=1})==false then
					d.entity.get_inventory(1).clear()
					if copperorecount~=0 then
						d.entity.insert{name="copper-ore",count=copperorecount}
					end
					d.entity.insert({name="waste",count=5+waste})
				else
					d.entity.get_inventory(1).clear()
					if copperorecount~=0 then
						d.entity.insert{name="copper-ore",count=copperorecount}
					end
					if waste>=1 then
						d.entity.insert({name="waste",count=waste})
					end
				end
			end
		end
	end
	if global.mixedresourcepiles~=nil and event.tick%60==0 then						--MIXED RESOURCE PILE--
		for i,d in pairs(global.mixedresourcepiles) do
			if d.entity.valid then
				local stonecount=d.entity.get_item_count("stone")
				if stonecount>0 then
					d.entity.get_inventory(1).remove{name="stone",count=stonecount}
				end
				local coalcount=d.entity.get_item_count("coal")
				if coalcount>0 then
					d.entity.get_inventory(1).remove{name="coal",count=coalcount}
				end
				local ironorecount=d.entity.get_item_count("iron-ore")
				if ironorecount>0 then
					d.entity.get_inventory(1).remove{name="iron-ore",count=ironorecount}
				end
				local copperorecount=d.entity.get_item_count("copper-ore")
				if copperorecount>0 then
					d.entity.get_inventory(1).remove{name="copper-ore",count=copperorecount}
				end
				if d.entity.get_inventory(1).get_item_count("waste")~=0 then
					wastecount=69-d.entity.get_inventory(1).get_item_count("waste")
				else
					wastecount=69
				end
				waste=d.entity.get_inventory(1).get_item_count("waste")
				if wastecount>=1 then
					d.entity.insert({name="waste",count=wastecount})
				end
				if d.entity.get_inventory(1).can_insert({name="waste",count=1})==false then
					d.entity.get_inventory(1).clear()
					if stonecount~=0 then
						d.entity.insert{name="stone",count=stonecount}
					end
					if coalcount~=0 then
						d.entity.insert{name="coal",count=coalcount}
					end
					if ironorecount~=0 then
						d.entity.insert{name="iron-ore",count=ironorecount}
					end
					if copperorecount~=0 then
						d.entity.insert{name="copper-ore",count=copperorecount}
					end
					d.entity.insert({name="waste",count=5+waste})
				else
					d.entity.get_inventory(1).clear()
					if stonecount~=0 then
						d.entity.insert{name="stone",count=stonecount}
					end
					if coalcount~=0 then
						d.entity.insert{name="coal",count=coalcount}
					end
					if ironorecount~=0 then
						d.entity.insert{name="iron-ore",count=ironorecount}
					end
					if copperorecount~=0 then
						d.entity.insert{name="copper-ore",count=copperorecount}
					end
					if waste>=1 then
						d.entity.insert({name="waste",count=waste})
					end
				end
			end
		end
	end
end)
script.on_event(defines.events.on_built_entity, function(event)
	if event.created_entity.name == "stone-pile" then								--STONE PILE--
		if global.stonepilescount==nil then
			global.stonepiles={}
			global.stonepilescount=0
		end
		global.stonepilescount=global.stonepilescount+1
		global.stonepiles[global.stonepilescount]={}
		global.stonepiles[global.stonepilescount].entity=event.created_entity
	end
	if event.created_entity.name == "coal-pile" then								--COAL PILE--
		if global.coalpilescount==nil then
			global.coalpiles={}
			global.coalpilescount=0
		end
		global.coalpilescount=global.coalpilescount+1
		global.coalpiles[global.coalpilescount]={}
		global.coalpiles[global.coalpilescount].entity=event.created_entity
	end
	if event.created_entity.name == "iron-ore-pile" then							--IRON ORE PILE--
		if global.ironorepilescount==nil then
			global.ironorepiles={}
			global.ironorepilescount=0
		end
		global.ironorepilescount=global.ironorepilescount+1
		global.ironorepiles[global.ironorepilescount]={}
		global.ironorepiles[global.ironorepilescount].entity=event.created_entity
	end
	if event.created_entity.name == "copper-ore-pile" then							--COPPER ORE PILE--
		if global.copperorepilescount==nil then
			global.copperorepiles={}
			global.copperorepilescount=0
		end
		global.copperorepilescount=global.copperorepilescount+1
		global.copperorepiles[global.copperorepilescount]={}
		global.copperorepiles[global.copperorepilescount].entity=event.created_entity
	end
	if event.created_entity.name == "mixed-resource-pile" then						--MIXED RESOURCE PILE--
		if global.mixedresourcepilescount==nil then
			global.mixedresourcepiles={}
			global.mixedresourcepilescount=0
		end
		global.mixedresourcepilescount=global.mixedresourcepilescount+1
		global.mixedresourcepiles[global.mixedresourcepilescount]={}
		global.mixedresourcepiles[global.mixedresourcepilescount].entity=event.created_entity
	end
end)