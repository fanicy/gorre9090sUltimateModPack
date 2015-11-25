
function cursedPI_addItem(base,name,icon,resultPlace,others)
	local obj = util.table.deepcopy(data.raw["item"][base])
	obj.name = name
	obj.icon = icon
	obj.place_result = resultPlace
	if others ~= nil then
		for k,v in pairs(others) do
			obj[k] = v
		end
	end
	data.raw[obj.type][obj.name] = obj
	for i1 = -1, -1 do
		for j1 = -1, 0 do
			for i2 = -1, 1 do
				for j2 = -1, 1 do
					if not (i1 == i2 and j1 == j2) and not(i2 == 0 and j2 == 0) then
						local obj = util.table.deepcopy(data.raw["item"][name])
						obj.name = name .. "_" .. 3*(i1+1)+(j1+2) .. "_" .. 3*(i2+1)+(j2+2)
						if data.raw[obj.type][obj.name] == nil then
							obj.subgroup = "cursed-noshow-inserter"
							obj.place_result = obj.name
							data.raw[obj.type][obj.name] = obj
						end
					end
				end
			end
		end
	end
end

-- cursedPI_addItem("burner-inserter","cursed-burner-inserter","__Cursed-PI__/graphics/icons/burner-inserter/cursed-burner-inserter.png","cursed-burner-inserter")
-- cursedPI_addItem("basic-inserter","cursed-basic-inserter","__Cursed-PI__/graphics/icons/basic-inserter/cursed-basic-inserter.png","cursed-basic-inserter")
-- cursedPI_addItem("long-handed-inserter","cursed-long-handed-inserter","__Cursed-PI__/graphics/icons/long-handed-inserter/cursed-long-handed-inserter.png","cursed-long-handed-inserter")
-- cursedPI_addItem("smart-inserter","cursed-smart-inserter","__Cursed-PI__/graphics/icons/smart-inserter/cursed-smart-inserter.png","cursed-smart-inserter")
-- cursedPI_addItem("fast-inserter","cursed-fast-inserter","__Cursed-PI__/graphics/icons/fast-inserter/cursed-fast-inserter.png","cursed-fast-inserter")

-- local obj = util.table.deepcopy(data.raw["item"]["burner-inserter"])
-- obj.name = "cursed-burner-inserter"
-- obj.icon = "__Cursed-PI__/graphics/icons/burner-inserter/cursed-burner-inserter.png"
-- obj.place_result = "cursed-burner-inserter"
-- data.raw[obj.type][obj.name] = obj

-- local obj = util.table.deepcopy(data.raw["item"]["basic-inserter"])
-- obj.name = "cursed-basic-inserter"
-- obj.icon = "__Cursed-PI__/graphics/icons/basic-inserter/cursed-basic-inserter.png"
-- obj.place_result = "cursed-basic-inserter"
-- data.raw[obj.type][obj.name] = obj

-- local obj = util.table.deepcopy(data.raw["item"]["long-handed-inserter"])
-- obj.name = "cursed-long-handed-inserter"
-- obj.icon = "__Cursed-PI__/graphics/icons/long-handed-inserter/cursed-long-handed-inserter.png"
-- obj.place_result = "cursed-long-handed-inserter"
-- data.raw[obj.type][obj.name] = obj

-- local obj = util.table.deepcopy(data.raw["item"]["smart-inserter"])
-- obj.name = "cursed-smart-inserter"
-- obj.icon = "__Cursed-PI__/graphics/icons/smart-inserter/cursed-smart-inserter.png"
-- obj.place_result = "cursed-smart-inserter"
-- data.raw[obj.type][obj.name] = obj

-- local obj = util.table.deepcopy(data.raw["item"]["fast-inserter"])
-- obj.name = "cursed-fast-inserter"
-- obj.icon = "__Cursed-PI__/graphics/icons/fast-inserter/cursed-fast-inserter.png"
-- obj.place_result = "cursed-fast-inserter"
-- data.raw[obj.type][obj.name] = obj
