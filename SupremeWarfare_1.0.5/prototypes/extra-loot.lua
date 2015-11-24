-- biter --

local loot =
{
  item = "small-alien-artifact",
  probability = 1,
  count_min = 1,
  count_max = 1 
}

local lootB =
{
  item = "small-alien-artifact",
  probability = 1,
  count_min = 1,
  count_max = 5 
}

if data.raw.unit~=nil then
	if data.raw.unit["small-biter"].loot == nil then 
		data.raw.unit["small-biter"].loot = {}
	end
	table.insert(data.raw.unit["small-biter"].loot, loot)
end

if data.raw.unit~=nil then
	if data.raw.unit["medium-biter"].loot == nil then 
		data.raw.unit["medium-biter"].loot = {}
	end
	table.insert(data.raw.unit["medium-biter"].loot, loot)
end

if data.raw.unit~=nil then
	if data.raw.unit["big-biter"].loot == nil then 
		data.raw.unit["big-biter"].loot = {}
	end
	table.insert(data.raw.unit["big-biter"].loot, lootB)
end

-- splitter --

if data.raw.unit~=nil then
	if data.raw.unit["small-spitter"].loot == nil then 
		data.raw.unit["small-spitter"].loot = {}
	end
	table.insert(data.raw.unit["small-spitter"].loot, loot)
end

if data.raw.unit~=nil then
	if data.raw.unit["medium-spitter"].loot == nil then 
		data.raw.unit["medium-spitter"].loot = {}
	end
	table.insert(data.raw.unit["medium-spitter"].loot, loot)
end

if data.raw.unit~=nil then
	if data.raw.unit["big-spitter"].loot == nil then 
		data.raw.unit["big-spitter"].loot = {}
	end
	table.insert(data.raw.unit["big-spitter"].loot, lootB)
end

if DyTechW and enableDyTech then
	-- biter --
	if data.raw.unit~=nil then
		if data.raw.unit["young-berserk-biter"].loot == nil then 
			data.raw.unit["young-berserk-biter"].loot = {}
		end
		table.insert(data.raw.unit["young-berserk-biter"].loot, loot)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["young-elder-biter"].loot == nil then 
			data.raw.unit["young-elder-biter"].loot = {}
		end
		table.insert(data.raw.unit["young-elder-biter"].loot, loot)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["young-king-biter"].loot == nil then 
			data.raw.unit["young-king-biter"].loot = {}
		end
		table.insert(data.raw.unit["young-king-biter"].loot, loot)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["young-queen-biter"].loot == nil then 
			data.raw.unit["young-queen-biter"].loot = {}
		end
		table.insert(data.raw.unit["young-queen-biter"].loot, loot)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["teen-berserk-biter"].loot == nil then 
			data.raw.unit["teen-berserk-biter"].loot = {}
		end
		table.insert(data.raw.unit["teen-berserk-biter"].loot, loot)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["teen-elder-biter"].loot == nil then 
			data.raw.unit["teen-elder-biter"].loot = {}
		end
		table.insert(data.raw.unit["teen-elder-biter"].loot, loot)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["teen-king-biter"].loot == nil then 
			data.raw.unit["teen-king-biter"].loot = {}
		end
		table.insert(data.raw.unit["teen-king-biter"].loot, loot)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["teen-queen-biter"].loot == nil then 
			data.raw.unit["teen-queen-biter"].loot = {}
		end
		table.insert(data.raw.unit["teen-queen-biter"].loot, loot)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["adult-berserk-biter"].loot == nil then 
			data.raw.unit["adult-berserk-biter"].loot = {}
		end
		table.insert(data.raw.unit["adult-berserk-biter"].loot, lootB)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["adult-elder-biter"].loot == nil then 
			data.raw.unit["adult-elder-biter"].loot = {}
		end
		table.insert(data.raw.unit["adult-elder-biter"].loot, lootB)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["adult-king-biter"].loot == nil then 
			data.raw.unit["adult-king-biter"].loot = {}
		end
		table.insert(data.raw.unit["adult-king-biter"].loot, lootB)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["adult-queen-biter"].loot == nil then 
			data.raw.unit["adult-queen-biter"].loot = {}
		end
		table.insert(data.raw.unit["adult-queen-biter"].loot, lootB)
	end
	
	-- Spitter --
	if data.raw.unit~=nil then
		if data.raw.unit["young-berserk-spitter"].loot == nil then 
			data.raw.unit["young-berserk-spitter"].loot = {}
		end
		table.insert(data.raw.unit["young-berserk-spitter"].loot, loot)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["young-elder-spitter"].loot == nil then 
			data.raw.unit["young-elder-spitter"].loot = {}
		end
		table.insert(data.raw.unit["young-elder-spitter"].loot, loot)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["young-king-spitter"].loot == nil then 
			data.raw.unit["young-king-spitter"].loot = {}
		end
		table.insert(data.raw.unit["young-king-spitter"].loot, loot)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["young-queen-spitter"].loot == nil then 
			data.raw.unit["young-queen-spitter"].loot = {}
		end
		table.insert(data.raw.unit["young-queen-spitter"].loot, loot)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["teen-berserk-spitter"].loot == nil then 
			data.raw.unit["teen-berserk-spitter"].loot = {}
		end
		table.insert(data.raw.unit["teen-berserk-spitter"].loot, loot)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["teen-elder-spitter"].loot == nil then 
			data.raw.unit["teen-elder-spitter"].loot = {}
		end
		table.insert(data.raw.unit["teen-elder-spitter"].loot, loot)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["teen-king-spitter"].loot == nil then 
			data.raw.unit["teen-king-spitter"].loot = {}
		end
		table.insert(data.raw.unit["teen-king-spitter"].loot, loot)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["teen-queen-spitter"].loot == nil then 
			data.raw.unit["teen-queen-spitter"].loot = {}
		end
		table.insert(data.raw.unit["teen-queen-spitter"].loot, loot)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["adult-berserk-spitter"].loot == nil then 
			data.raw.unit["adult-berserk-spitter"].loot = {}
		end
		table.insert(data.raw.unit["adult-berserk-spitter"].loot, lootB)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["adult-elder-spitter"].loot == nil then 
			data.raw.unit["adult-elder-spitter"].loot = {}
		end
		table.insert(data.raw.unit["adult-elder-spitter"].loot, lootB)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["adult-king-spitter"].loot == nil then 
			data.raw.unit["adult-king-spitter"].loot = {}
		end
		table.insert(data.raw.unit["adult-king-spitter"].loot, lootB)
	end

	if data.raw.unit~=nil then
		if data.raw.unit["adult-queen-spitter"].loot == nil then 
			data.raw.unit["adult-queen-spitter"].loot = {}
		end
		table.insert(data.raw.unit["adult-queen-spitter"].loot, lootB)
	end
end