-- Static Values
local reps_multiplier = 25
local research_time=5

local default_cost = 2
local cost_multiplier = 1
local repl_penalty = 0.5

-- Vanilla Factorio
local ore_cost = 2
local smelt_cost = 1
local plate_cost = ore_cost + smelt_cost
local steel_cost = plate_cost * 5 + smelt_cost * 5

local wood_cost = ore_cost
local gear_cost = plate_cost * 2
local cable_cost = plate_cost / 2

local water_cost = 1
local oil_cost = 2
local sulfur_cost = oil_cost * 3 + water_cost * 3
local acid_cost = sulfur_cost + plate_cost * 0.2 + water_cost * 2

local explosives_cost = sulfur_cost + ore_cost + water_cost
local plastic_cost = ore_cost + oil_cost * 3
local battery_cost = acid_cost * 2.8 + plate_cost * 2

local alien_cost = 100
local life_cost = 200

-- NOTE: For the sake of compatibility with DyTech's stone gears, the cost of transport belts is defined alongside belt replication itself
-- Similarly, for the sake of compatibility with Bob's electrical override, the cost of each circuit is defined alongside the replication of that circuit

-- DyTech
local obsidian_cost = ore_cost / 3
local crystal_cost = 31.5
local cutting_cost = water_cost * 50
local compressing_cost = ore_cost * 100

local resin_cost = wood_cost * 2
local rubber_cost = resin_cost + smelt_cost

-- Bob's Mods
local grinding_cost = (plate_cost * 0.75 + 1) * 2.5 + steel_cost / 2 + 1
local polishing_cost = ore_cost * 2.5 + steel_cost / 2 + ore_cost * 0.375 + smelt_cost * 0.5 + oil_cost * 0.75 + 5
local hydrogen_cost = water_cost / 3
local nitrogen_cost = 0.14
local oxygen_cost = water_cost * 2 / 3
local chlorine_cost = water_cost * 3.5
local tin_cost = ore_cost * 0.93 + smelt_cost
local gold_cost = ore_cost * 1.5 + chlorine_cost * 0.5

local solder_cost = 3 --resin_cost * 0.125 + ((ore_cost * 0.93 + smelt_cost) * 9 + plate_cost + (ore_cost * 0.78 + smelt_cost) * 9 + smelt_cost * 2) / 22
local tinned_cable_cost = 2.5 --cable_cost + tin_cost / 3
local silicon_wafer_cost = 1 --(ore_cost * 1.65 + smelt_cost) * 0.125
local circuit_components_1_cost = 0.8 --(ore_cost / 2 + tinned_cable_cost + smelt_cost * 2 / 3.5) / 5 --basic-electronic-components
local circuit_components_2_cost = 2.7 --(plastic_cost + tinned_cable_cost + silicon_wafer_cost * 2 + smelt_cost * 3.5 / 3.5) / 5 --electronic-components
local circuit_components_3_cost = 4.35 --(plastic_cost + tinned_cable_cost + silicon_wafer_cost * 4 + acid_cost * 0.5 + smelt_cost * 5 / 3.5) / 5 --integrated-electronics
local circuit_components_4_cost = 6.3 --((silicon_wafer_cost * 8 + smelt_cost * 1.5 + nitrogen_cost * 1.3 + smelt_cost * 2) + (cable_cost + gold_cost / 3) * 2 + silicon_wafer_cost * 6 + acid_cost * 0.5 + smelt_cost * 7 / 3.5) / 5 --cpu
local ferric_chloride_cost = (ore_cost + (hydrogen_cost + chlorine_cost) * 6) / 5
local fiberglass_cost = plastic_cost * 0.5 + ore_cost * 0.2 + smelt_cost

-- mopower
local uranium_cost = ore_cost * 62.4

-- Yuoki Industries
local unicomp_cost = ((ore_cost * 1.5) * 1.5 + 7.4) * 3 + 2.3
local charged_cost = ore_cost * 2 + 7
local richdust_cost = ore_cost * 3.5 / 2 + 1.7

-- Dark Matter Replicators
local dark_1_cost = 3
local dark_2_cost = dark_1_cost * 4 + plate_cost
local dark_3_cost = dark_2_cost * 4 + steel_cost
local dark_4_cost = dark_3_cost * 4 + dark_2_cost


-- Begin Code
local repltypes = {
	null = {tier = 0, reps = 0, cat_order = '0'},

	ore = {tier = 1, reps = 2, cat_order = '1'}, --Semi-Random
	--Uusally one tech per item, mainly used for directly mineable ores and for directly pumpable fluids, tech image shows item

	element = {tier = 2, reps = 1, cat_order = '2a'}, --Pure Element
	--One tech per used element, tech image is a periodic square containing a Bohr model

	shape = {tier = 2, reps = 2, cat_order = '2b'}, --Shaped Object
	--One tech per homogeneous semi-random or pure element substance that is shaped into items, tech image shows one or (preferably) more items

	alloy = {tier = 3, reps = 3, cat_order = '3a'}, --Alloy & Shape
	--One tech per alloy, contains all items made entirely from said alloy

	chemical = {tier = 3, reps = 3, cat_order = '3b'}, --Chemical & Shape
	--One tech per chemical, contains all items made entirely from said alloy

	device2 = {tier = 2, reps = 2, cat_order = '4b'}, --Very Simple
	device3 = {tier = 3, reps = 3, cat_order = '4c'}, --Simple
	device4 = {tier = 4, reps = 4, cat_order = '4d'}, --Complex
	device5 = {tier = 5, reps = 10, cat_order = '4e'}, --Very Complex
	--One tech per item or group of very similar items

	life = {tier=5, reps = 10, cat_order = '5'}, --Living Thing
	--One tech per item, no image guidelines

	module = {tier=0, reps = -1, cat_order = '6'}, --Module (sorting and border category only)
	--One tech per item

	exotic = {tier=0, reps = -1, cat_order = 'ex'}, --Exotic Matter (sorting and border category only)
	--Substances that cannot be categorized by normal matter, use guidelines for the closest real category

	magic = {tier=0, reps = -1, cat_order = 'myth'}, --Fantasy Material (sorting and border category only)
	--Supernatural substances originating from mythology, use guidelines for the closest real category

	alien = {tier=0, reps = -1, cat_order = 'alien'}, --??? (sorting and border category only)
	--Substances of alien origin, use guidelines for the closest real category

	science = {tier=0, reps = -1, cat_order = 'sci'}, --Science Pack (related techs must include manual tier and rep values)
	--One tech per pack, no image guidelines
}

local replcats = {}
for key, value in pairs(repltypes) do
	replcats[#replcats + 1] = {
		type = "item-subgroup",
		name = "replication-recipes-" .. key,
		group = 'replication',
		order = 'ed-' .. value.cat_order,
	}
end

data:extend({
	{
		type = "item-group",
		name = "replication",
		icon = "__dark-matter-replicators__/graphics/category-replicators.png",
		inventory_order = "g",
		order = "e"
	},
	{
		type = 'item-subgroup',
		name = 'replication-resources',
		group = 'replication',
		order = 'eb',
	},
	{
		type = 'item-subgroup',
		name = 'replicators',
		group = 'replication',
		order = 'ec'
	},
})
data:extend(replcats)

function repl_recipe(opts)
	--get variables which will be used to create an item table if no table is given
	local item=opts['item']
	local state = opts['state'] or "item"
	local default_quantity = 1
	if (state=="fluid") then
		default_quantity = 5
	end
	local quantity = opts['quantity'] or default_quantity
	local time=opts['time'] or default_cost
	local itemName = opts['itemName'] or item
	
	--get or create the table of items
	local itemTable = opts['itemTable'] or {{item=item, state=state, quantity=quantity, time=time, itemName=itemName}}
		
	--add default values to each item in the array
	for currentItem=1,#itemTable do
		if itemTable[currentItem].state == nil then
			itemTable[currentItem].state = "item"
		end
		if itemTable[currentItem].quantity == nil then
			if (state=="fluid") then
				itemTable[currentItem].quantity = 5
			else
				itemTable[currentItem].quantity = 1
			end
		end
		if itemTable[currentItem].time == nil then
			itemTable[currentItem].time = default_cost
		end
		if itemTable[currentItem].itemName == nil then
			itemTable[currentItem].itemName = itemTable[currentItem].item
		end
	end
	
	--get variables used to create the required technology
	local techName = opts['name'] or itemTable[1].itemName
	local repltype = opts['repltype'] or 'null'
	local tier=opts['tier'] or repltypes[repltype].tier
	local reps = opts['reps'] or repltypes[repltype].reps
	if reps == -1 then
		reps = tier
		if tier == 1 or tier == 5 then
			reps = reps * 2
		end
	end
	reps = reps * reps_multiplier
	local prerequisites = opts['prerequisites']
	local unit = opts['unit']
	local upgrade = opts['upgrade'] or false
	
	--remove any nonexistent items from the arrays
	for currentItem=#itemTable,1,-1 do
		if not ((itemTable[currentItem].state == 'item' and (data.raw["item"][itemTable[currentItem].item] or data.raw["tool"][itemTable[currentItem].item] or data.raw["repair-tool"][itemTable[currentItem].item] or data.raw["mining-tool"][itemTable[currentItem].item] or data.raw["ammo"][itemTable[currentItem].item] or data.raw["armor"][itemTable[currentItem].item] or data.raw["capsule"][itemTable[currentItem].item] or data.raw["gun"][itemTable[currentItem].item] or data.raw["blueprint"][itemTable[currentItem].item] or data.raw["deconstruction-item"][itemTable[currentItem].item] or data.raw["module"][itemTable[currentItem].item])) or (itemTable[currentItem].state == 'fluid' and data.raw["fluid"][itemTable[currentItem].item])) then
			table.remove(itemTable, currentItem)
		end
	end
	
	--only make the technology if at least one item will be created
	--unless some flag is set which always makes the tech
	if (#itemTable > 0) or opts['alwaysCreate'] then
	
		-- Remove non-existent technologies from the prerequisites list
		for prereqCount=#prerequisites,1,-1 do
			if not data.raw.technology[prerequisites[prereqCount]] then
				table.remove(prerequisites, prereqCount)
			end
		end
		
		-- Require the replication tier
		prerequisites[#prerequisites + 1] = 'repltech-replication-' .. tier

		if unit == nil then
			if tier == 1 then
				unit = repl_research(reps, 1, 0, 0, 0, research_time)
			elseif tier == 2 then
				unit = repl_research(reps, 1, 1, 0, 0, research_time)
			elseif tier == 3 then
				unit = repl_research(reps, 0, 1, 1, 0, research_time)
			elseif tier == 4 then
				unit = repl_research(reps, 0, 0, 1, 1, research_time)
			elseif tier == 5 then
				unit = repl_research(reps, 0, 0, 0, 1, research_time)
			end
		end
		
		--Set up temporary storage space for new data
		local repl_data = {}
		
		--generate the key used to unlock the recipes when the technology is researched
		local effects = {}
		for currentItem=1,#itemTable do
			effects[#effects + 1] = {type = "unlock-recipe", recipe = "repl-" .. itemTable[currentItem].itemName}
		end
		
		--Generate technology data
		repl_data[#repl_data + 1] = {
			type = "technology", 
			name = "repltech-" .. techName,
			icon = "__dark-matter-replicators__/graphics/icons/replication/" .. repltype .. "/" .. techName .. ".png",
			effects = effects,
			prerequisites = prerequisites,
			unit = unit,
			upgrade = upgrade,
			order = "c-a-" .. repltypes[repltype].cat_order,
		}
		
		for itemNumber=1,#itemTable do
			--Generate recipe data
			repl_data[#repl_data + 1] = {
				type = "recipe",
				category = "replication-"..tier,
				name = "repl-" .. itemTable[itemNumber].itemName,
				enabled = "false",
				energy_required = (itemTable[itemNumber].time + repl_penalty) * cost_multiplier,
				icon = "__dark-matter-replicators__/graphics/icons/replication/" .. repltype .. "/" .. itemTable[itemNumber].itemName .. ".png",
				ingredients = {},
				results=
				{
					{type=itemTable[itemNumber].state, name=itemTable[itemNumber].item, amount=itemTable[itemNumber].quantity}
				},
				subgroup='replication-recipes-' .. repltype,
				order = 'r-' .. repltypes[repltype].cat_order,
			}
		end
		
		--Add the new data to Factorio's main data structure
		data:extend(repl_data)
	end
end


function repl_tier(tier, unit)
	local preq = {}
	if tier > 1 then
		preq[#preq+1] = 'repltech-replication-'..(tier-1)
	end
	if tier == 1 then
		preq[#preq + 1] = 'electronics'
		preq[#preq + 1] = 'dark-matter-scoop'
	end
	if tier == 2 then
		preq[#preq + 1] = 'advanced-electronics'
		preq[#preq + 1] = 'dark-matter-transducer'
	end
	if tier == 4 then
		preq[#preq + 1] = 'advanced-electronics-2'
		preq[#preq + 1] = 'matter-conduit'
	end
	effects = {
			{
				type = "unlock-recipe",
				recipe = "replicator-"..tier
			},
	}
	repl_data[#repl_data + 1] = {
		type = "technology",
		name = "repltech-replication-" .. tier,
		icon = "__dark-matter-replicators__/graphics/icons/replicator-"..tier..".png",
		effects = effects,

		prerequisites = preq,
		unit = unit,
		upgrade = true,
		order = "c-a",
	}
	repl_data[#repl_data + 1] = {
		type = "recipe-category",
		name = "replication-"..tier
	}
end

repl_data = {}
repl_tier(1, repl_research(reps_multiplier * 4, 1, 0, 0, 0, research_time / 5))
repl_tier(2, repl_research(reps_multiplier * 4, 1, 1, 0, 0, research_time / 5))
repl_tier(3, repl_research(reps_multiplier * 6, 0, 1, 1, 0, research_time / 5))
repl_tier(4, repl_research(reps_multiplier * 8, 0, 0, 1, 1, research_time / 5))
repl_tier(5, repl_research(reps_multiplier * 20, 0, 0, 0, 1, research_time / 5))
data:extend(repl_data)

-- Replication products
-- Tier 1 
-- Elemental ores
repl_recipe({
	name='26-ore-iron',
	repltype='ore',
	item='iron-ore',
	time=ore_cost,
	prerequisites={}
})
repl_recipe({
	name='29-ore-copper',
	repltype='ore',
	item='copper-ore',
	time=ore_cost,
	prerequisites={}
})

repl_recipe({
	name='13-ore-aluminium',
	repltype='ore',
	item='bauxite-ore',
	time=ore_cost * 1.5,
	prerequisites={}
})
repl_recipe({
	name='14-ore-silicon',
	repltype='ore',
	itemTable = {{
		item='quartz',
		time=ore_cost * 1.4,
	}, {
		item='glass',
		time=ore_cost / 5 + smelt_cost,
	}, {
		item='obsidian',
		time=obsidian_cost,
	}},
	prerequisites={}
})
repl_recipe({
	name='22-ore-titanium',
	repltype='ore',
	item='rutile-ore',
	time=ore_cost * 1.5,
	prerequisites={}
})
repl_recipe({
	name='27-ore-cobalt',
	repltype='ore',
	item='cobalt-ore',
	time=ore_cost * 4.55,
	prerequisites={}
})
repl_recipe({
	name='28-ore-nickel',
	repltype='ore',
	item='nickel-ore',
	time=ore_cost * 1.5,
	prerequisites={}
})
repl_recipe({
	name='30-ore-zinc',
	repltype='ore',
	item='zinc-ore',
	time=ore_cost * 1.5,
	prerequisites={}
})
repl_recipe({
	name='47-ore-silver',
	repltype='ore',
	item='silver-ore',
	time=ore_cost * 0.78,
	prerequisites={}
})
repl_recipe({
	name='50-ore-tin',
	repltype='ore',
	item='tin-ore',
	time=ore_cost * 0.93,
	prerequisites={}
})
repl_recipe({
	name='74-ore-tungsten',
	repltype='ore',
	item='tungsten-ore',
	time=ore_cost * 1.5,
	prerequisites={}
})
repl_recipe({
	name='79-ore-gold',
	repltype='ore',
	item='gold-ore',
	time=ore_cost * 1.5,
	prerequisites={}
})
repl_recipe({
	name='82-ore-lead',
	repltype='ore',
	item='lead-ore',
	time=ore_cost * 0.95,
	prerequisites={}
})
repl_recipe({
	name='92-ore-uranium',
	repltype='ore',
	item='uranium-ore',
	time=uranium_cost,
	prerequisites={}
})

-- Non-Elemental Ores
repl_recipe({
	repltype='ore',
	item='coal',
	time=ore_cost,
	prerequisites={}
})
repl_recipe({
	repltype='ore',
	itemTable = {{
		item='stone',
		time=ore_cost,
	}, {
		item='sand',
		time=ore_cost / 5,
	}},
	prerequisites={}
})
repl_recipe({
	repltype='ore',
	item='wood',
	time=wood_cost,
	prerequisites={}
})
repl_recipe({
	repltype='ore',
	item='crude-oil',
	state='fluid',
	time=oil_cost * 5,
	prerequisites={}
})

repl_recipe({
	repltype='exotic',
	tier=1,
	item='tenemut',
	time=dark_1_cost,
	prerequisites={}
})

repl_recipe({
	repltype='magic',
	tier=1,
	item='ardite-ore', --Like all magical elements ardite has a rational non-integer atomic number (in this case 44.4)
	time=ore_cost * 1.25,
	prerequisites={}
})
repl_recipe({
	name='lava',
	repltype='ore',
	item='lava-600',
	itemName='lava',
	state='fluid',
	time=ore_cost*5,
	prerequisites={'repltech-stone'}
})
repl_recipe({
	repltype='ore',
	item='resin',
	time=resin_cost,
	prerequisites={'repltech-wood'}
})
repl_recipe({
	repltype='ore',
	item='rubber',
	time=rubber_cost,
	prerequisites={'repltech-resin'}
})
repl_recipe({
	repltype='ore',
	itemTable = {{
		item='crystal',
		time=crystal_cost,
	}, {
		item='raw-diamond',
		time=crystal_cost + obsidian_cost * 50 + (140+224)/3.5,
	}, {
		item='raw-emerald',
		time=crystal_cost + obsidian_cost * 10 + (100+160)/3.5,
	}, {
		item='raw-ruby',
		time=crystal_cost + (20+32)/3.5,
	}, {
		item='raw-sapphire',
		time=crystal_cost + (35+56)/3.5,
	}, {
		item='raw-topaz',
		time=crystal_cost + obsidian_cost * 25 + (60+96)/3.5,
	}, {
		item='ruby-ore',
		time=ore_cost * 10 / 1,
	}, {
		item='sapphire-ore',
		time=ore_cost * 10 / 0.8,
	}, {
		item='emerald-ore',
		time=ore_cost * 10 / 0.6,
	}, {
		item='amethyst-ore',
		time=ore_cost * 10 / 0.5,
	}, {
		item='topaz-ore',
		time=ore_cost * 10 / 0.4,
	}, {
		item='diamond-ore',
		time=ore_cost * 10 / 0.2,
	}},
	prerequisites={}
})
repl_recipe({
	repltype='ore',
	item='salt',
	time=water_cost * 2.5,
	prerequisites={}
})

repl_recipe({
	repltype='exotic',
	tier=1,
	item='y-res1', --Unicomp Ore
	time=ore_cost * 1.5,
	prerequisites={}
})
repl_recipe({
	repltype='exotic',
	tier=1,
	item='y-res2', --Charged Ore
	time=ore_cost * 2,
	prerequisites={}
})
repl_recipe({
	repltype='ore',
	item='y-slag', --Slag
	time=2,
	prerequisites={}
})


-- Tier 2
-- Elemental Plates
repl_recipe({
	name='26-iron-26',
	repltype='element',
	itemTable = {{
		item='iron-plate',
		time=plate_cost,
	}, {
		item='y-pure-iron', --Pure iron
		time=plate_cost * 2 - smelt_cost,
	}},
	prerequisites={'repltech-26-ore-iron'}
})
repl_recipe({
	name='29-copper-29',
	repltype='element',
	itemTable = {{
		item='copper-plate',
		time=plate_cost,
	}, {
		item='y-pure-copper', --Pure copper
		time=plate_cost * 2 - smelt_cost,
	}},
	prerequisites={'repltech-29-ore-copper'}
})

repl_recipe({
	name='13-aluminium-13',
	repltype='element',
	item='aluminium-plate',
	time=ore_cost * 1.75 + smelt_cost * 2,
	prerequisites={'repltech-13-ore-aluminium'}
})
repl_recipe({
	name='14-silicon-14',
	repltype='element',
	itemTable = {{
		item='silicon',
		itemName='silicon-plate',
		time=ore_cost * 1.65 + smelt_cost,
	}, {
		item='silicon-powder',
		time=ore_cost * 1.65 + smelt_cost * 2.5,
	}},
	prerequisites={'repltech-14-ore-silicon'}
})
repl_recipe({
	name='22-titanium-22',
	repltype='element',
	item='titanium-plate',
	time=ore_cost * 1.75 + smelt_cost,
	prerequisites={'repltech-22-ore-titanium'}
})
repl_recipe({
	name='27-cobalt-27',
	repltype='element',
	item='cobalt-plate',
	time=ore_cost * 5.05 + smelt_cost * 2,
	prerequisites={'repltech-27-ore-cobalt'}
})
repl_recipe({
	name='28-nickel-28',
	repltype='element',
	item='nickel-plate',
	time=ore_cost * 1.5 + smelt_cost + water_cost + oxygen_cost * 1.5,
	prerequisites={'repltech-28-ore-nickel'}
})
repl_recipe({
	name='30-zinc-30',
	repltype='element',
	item='zinc-plate',
	time=ore_cost * 1.5 + smelt_cost,
	prerequisites={'repltech-30-ore-zinc'}
})
repl_recipe({
	name='47-silver-47',
	repltype='element',
	item='silver-plate',
	time=ore_cost * 0.78 + smelt_cost,
	prerequisites={'repltech-47-ore-silver'}
})
repl_recipe({
	name='50-tin-50',
	repltype='element',
	item='tin-plate',
	time=tin_cost,
	prerequisites={'repltech-50-ore-tin'}
})
repl_recipe({
	name='74-tungsten-74',
	repltype='element',
	item='tungsten-plate',
	time=((ore_cost * 1.5 + smelt_cost * 2 + hydrogen_cost * 5 + chlorine_cost * 2) * 4 + ore_cost * 1.5 + smelt_cost + water_cost + oxygen_cost * 1.5) / 5,
	prerequisites={'repltech-74-ore-tungsten'}
})
repl_recipe({
	name='79-gold-79',
	repltype='element',
	item='gold-plate',
	time=gold_cost,
	prerequisites={'repltech-79-ore-gold'}
})
repl_recipe({
	name='82-lead-82',
	repltype='element',
	item='lead-plate',
	time=ore_cost * 1.45 + smelt_cost,
	prerequisites={'repltech-82-ore-lead'}
})
repl_recipe({
	name='92-uranium-92',
	repltype='element',
	itemTable = {{
		item='uranium-rod',
		itemName='U-235',
		time=300 - repl_penalty, --uranium_cost * 2.4,
	}, {
		item='uranium-depleted',
		itemName='U-238',
		time=200 - repl_penalty, --uranium_cost * 1.6,
	}},
	prerequisites={'repltech-92-ore-uranium'}
})

-- Elemental Non-plates
repl_recipe({
	name='01-hydrogen-01',
	repltype='element',
	item='hydrogen',
	state='fluid',
	time=hydrogen_cost * 5,
	prerequisites={'repltech-dirty-water'}
})
repl_recipe({
	name='06-carbon-06',
	repltype='element',
	itemTable = {{
		item='carbon',
		time=ore_cost / 2,
	}, {
		item='cut-diamond',
		time=crystal_cost + obsidian_cost * 50 + (140+224)/3.5,
	}, {
		item='diamond-3',
		time=(ore_cost * 10 / 0.2) / 4,
	}},
	prerequisites={'repltech-coal'}
})
repl_recipe({
	name='07-nitrogen-07',
	repltype='element',
	item='nitrogen',
	state='fluid',
	time=nitrogen_cost,
	prerequisites={'repltech-liquid-air'}
})
repl_recipe({
	name='08-oxygen-08',
	repltype='element',
	item='oxygen',
	state='fluid',
	time=oxygen_cost * 5,
	prerequisites={'repltech-dirty-water'}
})
repl_recipe({
	name='16-sulfur-16',
	repltype='element',
	item='sulfur',
	time=sulfur_cost,
	prerequisites={'repltech-crude-oil'}
})
repl_recipe({
	name='17-chlorine-17',
	repltype='element',
	item='chlorine',
	state='fluid',
	time=chlorine_cost * 5,
	prerequisites={'repltech-salt'}
})

-- Shaped Objects
repl_recipe({
	repltype='shape',
	item='iron-gear-wheel',
	time=2 * plate_cost,
	prerequisites={'repltech-26-iron-26'}
})
repl_recipe({
	repltype='shape',
	item='pipe',
	time=plate_cost,
	prerequisites={'repltech-26-iron-26'}
})
repl_recipe({
	repltype='shape',
	item='copper-cable',
	time=cable_cost,
	prerequisites={'repltech-29-copper-29'}
})
repl_recipe({
	repltype='shape',
	item='stone-brick',
	time=ore_cost * 2 + smelt_cost,
	prerequisites={'repltech-stone'}
})
repl_recipe({
	repltype='shape',
	item='stone-wall',
	time=(ore_cost * 2 + smelt_cost) * 5,
	prerequisites={'repltech-stone'}
})

repl_recipe({
	repltype='shape',
	item='stone-gear-wheel',
	time=ore_cost,
	prerequisites={'repltech-stone'}
})
repl_recipe({
	name='gem-diamond',
	repltype='shape',
	itemTable = {{
		item='compressed-diamond',
		time=crystal_cost + cutting_cost + compressing_cost + obsidian_cost * 50 + (140+224+403)/3.5,
	}, {
		item='diamond-4',
		time=(ore_cost * 10 / 0.2) / 4 + grinding_cost,
	}},
	prerequisites={'gem-processing-1', 'repltech-06-carbon-06'}
})
repl_recipe({
	repltype='shape',
	item='silicon-wafer',
	time=silicon_wafer_cost,
	prerequisites={'repltech-14-silicon-14'}
})

repl_recipe({
	repltype='shape',
	itemTable = {{
		item='landfill2by2',
		time=ore_cost * 20,
	}, {
		item='landfill4by4',
		time=ore_cost * 80,
	}},
	prerequisites={'repltech-stone'}
})

-- T2 Devices
repl_recipe({
	repltype='device2',
	item='basic-bullet-magazine',
	time=plate_cost * 2,
	prerequisites={'repltech-26-iron-26'}
})
repl_recipe({
	repltype='device2',
	item='shotgun-shell',
	time=plate_cost * 4,
	prerequisites={'military', 'repltech-26-iron-26', 'repltech-29-copper-29'}
})
repl_recipe({
	repltype='device2',
	item='basic-grenade',
	time=ore_cost * 10 + plate_cost * 5,
	prerequisites={'military-2', 'repltech-coal', 'repltech-26-iron-26'}
})

repl_recipe({
	repltype='device2',
	item='dark-matter-scoop',
	time=dark_2_cost,
	prerequisites={'repltech-tenemut', 'repltech-26-iron-26'}
})

repl_recipe({
	repltype='device2',
	item='tinned-copper-cable',
	time=tinned_cable_cost,
	prerequisites={'repltech-29-copper-29', 'repltech-50-tin-50'}
})
local circuit_0_cost
local circuit_0_repltech
if data.raw["item"]["basic-circuit-board"] then
	circuit_0_cost = wood_cost * 0.5 + cable_cost * 3
	circuit_0_repltech = 'repltech-bob-early-circuit'
	repl_recipe({
		repltype='device2',
		item='basic-circuit-board',
		name='bob-early-circuit',
		itemName='bob-early-circuit',
		time=circuit_0_cost,
		prerequisites={'repltech-wood', 'repltech-copper-cable'}
	})
else
	circuit_0_cost = plate_cost + cable_cost * 3
	circuit_0_repltech = 'repltech-electronic-circuit'
end

-- Other Tier 2 
repl_recipe({
	repltype='magic',
	tier=2,
	reps=1,
	item='ardite-plate',
	time=ore_cost / 4 * 5 + smelt_cost,
	prerequisites={'repltech-ardite-ore'}
})

repl_recipe({
	repltype='exotic',
	tier=2,
	reps=1,
	item='y-refined-yres1', --Unicomp cylinders
	time=(ore_cost * 1.5) * 1.5 + 7.4,
	prerequisites={'repltech-y-res1'}
})
repl_recipe({
	repltype='exotic',
	tier=2,
	item='y-unicomp-raw', --Durotal blocks, the most commonly used form of unicomp
	time=unicomp_cost,
	prerequisites={'repltech-y-refined-yres1'}
})
repl_recipe({
	repltype='exotic',
	tier=2,
	reps=1,
	item='y-refined-yres2', --Charged cylinders
	time=charged_cost,
	prerequisites={'repltech-y-res2'}
})
repl_recipe({
	repltype='exotic',
	tier=2,
	item='y-raw-fuelnium', --Krakon gems, the most commonly used form of alien fuel
	time=charged_cost,
	prerequisites={'repltech-y-refined-yres2'}
})
repl_recipe({
	repltype='exotic',
	tier=2,
	reps=1,
	item='y-richdust', --Rich dust
	time=richdust_cost,
	prerequisites={'repltech-y-res1', 'repltech-y-res2'}
})
repl_recipe({
	repltype='exotic',
	tier=2,
	item='y-unicomp-a2', --UC-A2
	time=richdust_cost * 20 + smelt_cost,
	prerequisites={'repltech-y-richdust'}
})
repl_recipe({
	repltype='exotic',
	tier=2,
	item='y-orange-stuff', --Orange Stuff
	time=(richdust_cost * 3 + smelt_cost) / 2,
	prerequisites={'repltech-y-richdust'}
})
repl_recipe({
	repltype='alien',
	tier=2,
	item='y-crystal2', --Ancient Alien Data Fragments
	time=16,
	prerequisites={}
})


-- Tier 3
-- Alloys
repl_recipe({
	repltype='alloy',
	item='steel-plate',
	time=steel_cost,
	prerequisites={'repltech-06-carbon-06', 'repltech-26-iron-26'}
})

repl_recipe({
	repltype='alloy',
	item='solder',
	time=solder_cost,
	prerequisites={'repltech-resin', 'repltech-50-tin-50', 'repltech-29-copper-29', 'repltech-47-silver-47'}
})

-- Chemicals
if (data.raw.fluid['clean-water']) then
	repl_recipe({
		repltype='ore',
		item='water',
		name='dirty-water',
		itemName='dirty-water',
		state='fluid',
		time=water_cost * 5,
		prerequisites={}
	})
	repl_recipe({
		repltype='chemical',
		item='clean-water',
		name='water',
		itemName='water',
		state='fluid',
		time=water_cost * 5,
		prerequisites={'repltech-dirty-water'}
	})
else
	repl_recipe({
		repltype='chemical',
		item='water',
		state='fluid',
		time=water_cost * 5,
		prerequisites={}
	})
end
repl_recipe({
	repltype='chemical',
	item='concrete',
	time=ore_cost * 1.1 + smelt_cost * 0.5 + water_cost,
	prerequisites={'repltech-26-iron-26', 'repltech-stone', 'repltech-water'}
})
repl_recipe({
	repltype='chemical',
	item='heavy-oil',
	state='fluid',
	time=oil_cost * 5,
	prerequisites={'repltech-crude-oil'}
})
repl_recipe({
	repltype='chemical',
	item='light-oil',
	state='fluid',
	time=oil_cost * 5,
	prerequisites={'repltech-crude-oil'}
})
repl_recipe({
	repltype='chemical',
	item='petroleum-gas',
	state='fluid',
	time=oil_cost * 5,
	prerequisites={'repltech-crude-oil'}
})
repl_recipe({
	repltype='chemical',
	item='solid-fuel',
	time=oil_cost,
	prerequisites={'repltech-crude-oil'}
})
repl_recipe({
	repltype='chemical',
	item='lubricant',
	state='fluid',
	time=oil_cost * 5,
	prerequisites={'repltech-crude-oil'}
})
repl_recipe({
	repltype='chemical',
	item='sulfuric-acid',
	state='fluid',
	time=acid_cost * 5,
	prerequisites={'repltech-16-sulfur-16', 'repltech-water'}
})
repl_recipe({
	repltype='chemical',
	item='plastic-bar',
	time=plastic_cost,
	prerequisites={'repltech-crude-oil'}
})
repl_recipe({
	repltype='chemical',
	item='explosives',
	time=explosives_cost,
	prerequisites={'repltech-coal', 'repltech-01-hydrogen-01', 'repltech-06-carbon-06', 'repltech-08-oxygen-08', 'repltech-16-sulfur-16'}
})

repl_recipe({
	name='gem-ruby',
	repltype='chemical',
	itemTable = {{
		item='cut-ruby',
		time=crystal_cost + cutting_cost + (20+32)/3.5,
	}, {
		item='compressed-ruby',
		time=crystal_cost + cutting_cost + compressing_cost + (20+32+58)/3.5,
	}, {
		item='ruby-3',
		time=(ore_cost * 10 / 1) / 4,
	}, {
		item='ruby-4',
		time=(ore_cost * 10 / 1) / 4 + grinding_cost,
	}},
	prerequisites={'gem-processing-1', 'repltech-crystal'}--'repltech-08-oxygen-08', 'repltech-13-aluminium-13', 'repltech-24-chromium-24'}
})
repl_recipe({
	name='gem-sapphire',
	repltype='chemical',
	itemTable = {{
		item='cut-sapphire',
		time=crystal_cost + cutting_cost + (35+56)/3.5,
	}, {
		item='compressed-sapphire',
		time=crystal_cost + cutting_cost + compressing_cost + (35+56+101)/3.5,
	}, {
		item='sapphire-3',
		time=(ore_cost * 10 / 0.8) / 4,
	}, {
		item='sapphire-4',
		time=(ore_cost * 10 / 0.8) / 4 + grinding_cost,
	}},
	prerequisites={'gem-processing-1', 'repltech-crystal'}--'repltech-08-oxygen-08', 'repltech-13-aluminium-13'}
})
repl_recipe({
	name='gem-emerald',
	repltype='chemical',
	itemTable = {{
		item='cut-emerald',
		time=crystal_cost + cutting_cost + obsidian_cost * 10 + (100+160)/3.5,
	}, {
		item='compressed-emerald',
		time=crystal_cost + cutting_cost + compressing_cost + obsidian_cost * 10 + (100+160+288)/3.5,
	}, {
		item='emerald-3',
		time=(ore_cost * 10 / 0.6) / 4,
	}, {
		item='emerald-4',
		time=(ore_cost * 10 / 0.6) / 4 + grinding_cost,
	}},
	prerequisites={'gem-processing-1', 'repltech-crystal'}--'repltech-04-beryllium-04', 'repltech-08-oxygen-08', 'repltech-13-aluminium-13', 'repltech-14-silicon-14'}
})
repl_recipe({
	name='gem-amethyst',
	repltype='chemical',
	itemTable = {{
		item='amethyst-3',
		time=(ore_cost * 10 / 0.5) / 4,
	}, {
		item='amethyst-4',
		time=(ore_cost * 10 / 0.5) / 4 + grinding_cost,
	}},
	prerequisites={'gem-processing-1', 'repltech-crystal'}--'repltech-08-oxygen-08', 'repltech-14-silicon-14'}
})
repl_recipe({
	name='gem-topaz',
	repltype='chemical',
	itemTable = {{
		item='cut-topaz',
		time=crystal_cost + cutting_cost + obsidian_cost * 25 + (60+96)/3.5,
	}, {
		item='compressed-topaz',
		time=crystal_cost + cutting_cost + compressing_cost + obsidian_cost * 25 + (60+96+173)/3.5,
	}, {
		item='topaz-3',
		time=(ore_cost * 10 / 0.4) / 4,
	}, {
		item='topaz-4',
		time=(ore_cost * 10 / 0.4) / 4 + grinding_cost,
	}},
	prerequisites={'gem-processing-1', 'repltech-crystal'}--'repltech-01-hydrogen-01', 'repltech-08-oxygen-08', 'repltech-09-fluorine-09', 'repltech-13-aluminium-13', 'repltech-14-silicon-14'}
})
repl_recipe({
	name='gem-shining',
	repltype='chemical',
	itemTable = {{
		item='ruby-5',
		time=(ore_cost * 10 / 1) / 4 + grinding_cost + polishing_cost,
	}, {
		item='sapphire-5',
		time=(ore_cost * 10 / 0.8) / 4 + grinding_cost + polishing_cost,
	}, {
		item='emerald-5',
		time=(ore_cost * 10 / 0.6) / 4 + grinding_cost + polishing_cost,
	}, {
		item='amethyst-5',
		time=(ore_cost * 10 / 0.5) / 4 + grinding_cost + polishing_cost,
	}, {
		item='topaz-5',
		time=(ore_cost * 10 / 0.4) / 4 + grinding_cost + polishing_cost,
	}, {
		item='diamond-5',
		time=(ore_cost * 10 / 0.2) / 4 + grinding_cost + polishing_cost,
	}},
	prerequisites={'gem-processing-2', 'repltech-13-aluminium-13', 'repltech-light-oil', 'repltech-gem-ruby', 'repltech-gem-sapphire', 'repltech-gem-emerald', 'repltech-gem-amethyst', 'repltech-gem-topaz', 'repltech-gem-diamond'}
})

repl_recipe({
	repltype='chemical',
	item='y-toxic-dust', --Toxic Dust
	time=(acid_cost - water_cost * 3)/12,
	prerequisites={}
})

repl_recipe({
	repltype='chemical',
	item='tf-medicine',
	time=life_cost * 3 - repl_penalty,
	prerequisites={'tf-medicine'}
})

-- T3 Components
repl_recipe({
	repltype='device3',
	item='basic-electronic-components',
	time=circuit_components_1_cost,
	prerequisites={'repltech-06-carbon-06', 'repltech-tinned-copper-cable'}
})
repl_recipe({
	repltype='device3',
	item='electronic-components',
	time=circuit_components_2_cost,
	prerequisites={'repltech-basic-electronic-components', 'repltech-plastic-bar', 'repltech-silicon-wafer'}
})

local circuit_1_cost
local circuit_1_repltech
if data.raw["item"]["basic-circuit-board"] then
	circuit_1_cost = circuit_0_cost + circuit_components_1_cost * 5 + solder_cost
	circuit_1_repltech = 'repltech-bob-electronic-circuit'
	repl_recipe({
		repltype='device3',
		item='electronic-circuit',
		name='bob-electronic-circuit',
		itemName='bob-electronic-circuit',
		time=circuit_1_cost,
		prerequisites={circuit_0_repltech, 'repltech-basic-electronic-components', 'repltech-solder'}
	})
else
	circuit_1_cost = plate_cost + cable_cost * 3
	circuit_1_repltech = 'repltech-electronic-circuit'
	repl_recipe({
		repltype='device3',
		item='electronic-circuit',
		time=circuit_1_cost,
		prerequisites={'repltech-26-iron-26', 'repltech-copper-cable'}
	})
end
repl_recipe({
	repltype='device3',
	item='battery',
	time=battery_cost,
	prerequisites={'repltech-sulfuric-acid', 'repltech-29-copper-29', 'repltech-26-iron-26'}
})
repl_recipe({
	repltype='device3',
	item='engine-unit',
	time=steel_cost + plate_cost * 4,
	prerequisites={'repltech-pipe', 'repltech-steel-plate', 'repltech-iron-gear-wheel', 'engine'}
})
repl_recipe({
	repltype='device3',
	item='electric-engine-unit',
	time=steel_cost + plate_cost * 4 + circuit_1_cost * 2,
	prerequisites={'repltech-pipe', 'repltech-steel-plate', 'repltech-iron-gear-wheel', circuit_1_repltech, 'repltech-lubricant', 'electric-engine'}
})

repl_recipe({
	repltype='device3',
	item='dark-matter-transducer',
	time=dark_2_cost * 5 + steel_cost,
	prerequisites={'repltech-dark-matter-scoop', 'repltech-steel-plate'}
})


-- T3 Logistics
repl_recipe({
	repltype='device3',
	item='small-electric-pole',
	time=wood_cost + cable_cost,
	prerequisites={'repltech-copper-cable', 'repltech-wood'}
})
repl_recipe({
	repltype='device3',
	itemTable = {{
		item='medium-electric-pole',
		time=plate_cost * 2 + steel_cost * 2,
	}, {
		item='big-electric-pole',
		time=plate_cost * 5 + steel_cost * 5,
	}},
	prerequisites={'electric-energy-distribution-1', 'repltech-29-copper-29', 'repltech-steel-plate'}
})
repl_recipe({
	repltype='device3',
	itemTable = {{
		item='straight-rail',
		time=ore_cost + plate_cost / 4 + steel_cost / 2,
	}, {
		item='curved-rail',
		time=ore_cost * 4 + plate_cost + steel_cost * 2,
	}},
	prerequisites={'repltech-stone', 'repltech-steel-plate', 'railway'}
})
repl_recipe({
	repltype='device3',
	itemTable = {{
		item='rail-signal',
		time=circuit_1_cost * 5 + plate_cost,
	}, {
		item='rail-chain-signal',
		time=circuit_1_cost * 5 + plate_cost,
	}},
	prerequisites={'repltech-26-iron-26', circuit_1_repltech, 'rail-signals'}
})
repl_recipe({
	repltype='device3',
	item='gate',
	time=(ore_cost * 2 + smelt_cost) * 5 + steel_cost * 2 + circuit_1_cost * 2,
	prerequisites={'repltech-stone-wall', 'repltech-steel-plate', circuit_1_repltech, 'gates'}
})
repl_recipe({
	repltype='device3',
	item='smart-chest',
	time=steel_cost * 8 + circuit_1_cost * 3,
	prerequisites={circuit_1_repltech, 'repltech-steel-plate', 'circuit-network'}
})
local belt_cost
if data.raw["item"]["stone-gear-wheel"] then
	belt_cost = (plate_cost + ore_cost) / 2
	repl_recipe({
		repltype='device3',
		item='basic-transport-belt',
		time=belt_cost,
		prerequisites={'repltech-stone-gear-wheel', 'repltech-26-iron-26'}
	})
else
	belt_cost = (plate_cost + gear_cost) / 2
	repl_recipe({
		repltype='device3',
		item='basic-transport-belt',
		time=belt_cost,
		prerequisites={'repltech-iron-gear-wheel'}
	})
end
repl_recipe({
	repltype='device3',
	item='fast-transport-belt',
	time=belt_cost + gear_cost * 5,
	prerequisites={'logistics-2', 'repltech-basic-transport-belt'}
})
repl_recipe({
	repltype='device3',
	item='basic-inserter',
	time=plate_cost + gear_cost + circuit_0_cost,
	prerequisites={circuit_0_repltech, 'repltech-iron-gear-wheel'}
})

if data.raw["item"]["stone-gear-wheel"] then
	repl_recipe({
		name='science-pack-a',
		itemName='science-pack-a',
		repltype='science',
		tier=3,
		item='science-pack-1',
		time=ore_cost + plate_cost,
		prerequisites={'repltech-stone-gear-wheel', 'repltech-29-copper-29'}
	})
else
	repl_recipe({
		name='science-pack-a',
		itemName='science-pack-a',
		repltype='science',
		tier=3,
		item='science-pack-1',
		time=plate_cost * 3,
		prerequisites={'repltech-iron-gear-wheel', 'repltech-29-copper-29'}
	})
end

-- T3 Production
repl_recipe({
	repltype='device3',
	item='solar-panel',
	time=steel_cost * 5 + circuit_1_cost * 15 + plate_cost * 5,
	prerequisites={'solar-energy', 'repltech-steel-plate', circuit_1_repltech}
})

repl_recipe({
	repltype='device3',
	item='replicator-1',
	time=circuit_1_cost * 1 + dark_2_cost * 4 + plate_cost * 4,
	upgrade=true,
	prerequisites={'repltech-dark-matter-scoop', 'repltech-26-iron-26', circuit_1_repltech}
})

repl_recipe({
	repltype='device3',
	item='wind-turbine',
	time=gear_cost * 10 + steel_cost * 10 + circuit_1_cost * 5,
	prerequisites={'windpower', 'repltech-iron-gear-wheel', 'repltech-steel-plate', circuit_1_repltech}
})

-- T3 Military
repl_recipe({
	repltype='device3',
	item='piercing-bullet-magazine',
	time=steel_cost + plate_cost * 5,
	prerequisites={'military-2', 'repltech-29-copper-29', 'repltech-steel-plate'}
})
repl_recipe({
	repltype='device3',
	item='piercing-shotgun-shell',
	time=plate_cost * 2 + steel_cost * 2,
	prerequisites={'military-4', 'repltech-steel-plate', 'repltech-29-copper-29'}
})
repl_recipe({
	repltype='device3',
	item='flame-thrower-ammo',
	time=oil_cost * 5 + plate_cost * 5,
	prerequisites={'flame-thrower', 'repltech-crude-oil', 'repltech-26-iron-26'}
})
repl_recipe({
	repltype='device3',
	item='rocket',
	time=circuit_1_cost + explosives_cost + plate_cost * 2,
	prerequisites={'rocketry', circuit_1_repltech, 'repltech-explosives', 'repltech-26-iron-26'}
})
repl_recipe({
	repltype='device3',
	item='cannon-shell',
	time=steel_cost * 4 + plastic_cost * 2 + explosives_cost,
	prerequisites={'tanks', 'repltech-steel-plate', 'repltech-plastic-bar', 'repltech-explosives'}
})
repl_recipe({
	repltype='device3',
	item='explosive-cannon-shell',
	time=steel_cost * 4 + plastic_cost * 2 + explosives_cost * 4,
	prerequisites={'tanks', 'repltech-steel-plate', 'repltech-plastic-bar', 'repltech-explosives'}
})
repl_recipe({
	repltype='device3',
	item='poison-capsule',
	time=steel_cost * 3 + circuit_1_cost * 3 + ore_cost * 10,
	prerequisites={'military-3', 'repltech-steel-plate', circuit_1_repltech, 'repltech-coal'}
})
repl_recipe({
	repltype='device3',
	item='slowdown-capsule',
	time=steel_cost * 2 + circuit_1_cost * 2 + ore_cost * 5,
	prerequisites={'military-3', 'repltech-steel-plate', circuit_1_repltech, 'repltech-coal'}
})
repl_recipe({
	repltype='device3',
	item='land-mine',
	time=steel_cost / 4 + explosives_cost / 2,
	prerequisites={'land-mine', 'repltech-steel-plate', 'repltech-explosives'}
})
repl_recipe({
	repltype='device3',
	item='defender-capsule',
	time=steel_cost + plate_cost * 5 + circuit_1_cost * 2 + gear_cost * 3,
	prerequisites={'combat-robotics', 'repltech-piercing-bullet-magazine', circuit_1_repltech, 'repltech-iron-gear-wheel'}
})
repl_recipe({
	repltype='device3',
	item='gun-turret',
	time=gear_cost * 5 + plate_cost * 15,
	prerequisites={'turrets', 'repltech-iron-gear-wheel', 'repltech-29-copper-29'}
})

-- Other Tier 3
repl_recipe({
	repltype='device3',
	item='repair-pack',
	time=circuit_0_cost + gear_cost,
	prerequisites={circuit_0_repltech, 'repltech-iron-gear-wheel'}
})
repl_recipe({
	repltype='device3',
	item='small-lamp',
	time=circuit_1_cost + plate_cost * 2.5,
	prerequisites={circuit_1_repltech, 'repltech-26-iron-26', 'optics'}
})

repl_recipe({
	repltype='exotic',
	tier=3,
	item='y-quantrinum', --Quantrinum
	time=(richdust_cost * 20 + smelt_cost) * 15 + charged_cost * 12 + unicomp_cost * 12 + 16 * 8,
	prerequisites={'repltech-y-unicomp-a2', 'repltech-y-raw-fuelnium', 'repltech-y-unicomp-raw', 'repltech-y-crystal2'}
})
repl_recipe({
	repltype='exotic',
	tier=3,
	item='y-crystal-cnd', --Lachnan Crystal
	time=(plate_cost * 2 - smelt_cost) * 10 + 2 * 40 + (richdust_cost * 20 + smelt_cost) * 8 + 16 * 10,
	prerequisites={'repltech-y-pure-iron', 'repltech-y-slag', 'repltech-y-unicomp-a2', 'repltech-y-crystal2'}
})


-- Tier 4
-- Complex Devices

-- T4 Components
local circuit_2_cost
local circuit_2_repltech
if data.raw["item"]["basic-circuit-board"] then
	circuit_2_cost = 29.5 --resin_cost * 0.5 + wood_cost * 0.5 + plate_cost + tin_cost + ferric_chloride_cost * 0.5 + circuit_components_1_cost * 4 + circuit_components_2_cost * 4 + solder_cost + smelt_cost
	circuit_2_repltech = 'repltech-bob-advanced-circuit'
	repl_recipe({
		repltype='device4',
		item='advanced-circuit',
		name='bob-advanced-circuit',
		itemName='bob-advanced-circuit',
		time=circuit_2_cost,
		prerequisites = {'repltech-electronic-components', 'repltech-solder'}
	})
else
	circuit_2_cost = plastic_cost * 2 + circuit_1_cost * 2 + cable_cost * 4
	circuit_2_repltech = 'repltech-advanced-circuit'
	repl_recipe({
		repltype='device4',
		item='advanced-circuit',
		time=circuit_2_cost,
		prerequisites = {circuit_1_repltech, 'repltech-copper-cable', 'repltech-plastic-bar'}
	})
end

repl_recipe({
	repltype='device4',
	item='matter-conduit',
	time=dark_4_cost,
	prerequisites={'repltech-dark-matter-transducer'}
})

repl_recipe({
	repltype='device4',
	name='integrated-electronics',
	itemTable = {{
		item='intergrated-electronics',
		itemName='integrated-electronics',
		time=circuit_components_3_cost,
	}, {
		item='integrated-electronics', --Just in case Bobingabout fixes the spelling error
		time=circuit_components_3_cost,
	}},
	prerequisites={'repltech-electronic-components', 'repltech-sulfuric-acid'}
})
repl_recipe({
	repltype='device4',
	item='processing-electronics',
	time=circuit_components_4_cost,
	prerequisites={'advanced-electronics-3', 'repltech-integrated-electronics', 'repltech-07-nitrogen-07', 'repltech-79-gold-79'}
})

-- T4 Logistics
repl_recipe({
	repltype='device4',
	item='substation',
	time=steel_cost * 10 + circuit_2_cost * 5 + plate_cost * 5,
	prerequisites = {'electric-energy-distribution-2', circuit_2_repltech, 'repltech-29-copper-29', 'repltech-steel-plate'}
})
repl_recipe({
	repltype='device4',
	item='construction-robot',
	time=steel_cost * 2 + plate_cost * 6 + circuit_1_cost * 7 + battery_cost * 2,
	prerequisites={'repltech-electric-engine-unit', 'construction-robotics'}
})
repl_recipe({
	repltype='device4',
	item='logistic-robot',
	time=steel_cost * 2 + plate_cost * 6 + circuit_1_cost * 5 + battery_cost * 2 + circuit_2_cost * 2,
	prerequisites={'repltech-electric-engine-unit', circuit_2_repltech, 'logistic-robotics'}
})
repl_recipe({
	repltype='device4',
	item='express-transport-belt',
	time=belt_cost + gear_cost * 10 + oil_cost * 2,
	prerequisites={'logistics-3', 'repltech-fast-transport-belt', 'repltech-lubricant'}
})
repl_recipe({
	repltype='device4',
	item='fast-inserter',
	time=plate_cost * 3 + gear_cost + circuit_1_cost * 3,
	prerequisites={'logistics', 'repltech-basic-inserter'}
})
repl_recipe({
	repltype='device4',
	item='smart-inserter',
	time=plate_cost * 3 + gear_cost + circuit_1_cost * 7,
	prerequisites={'repltech-fast-inserter'}
})

-- T4 Production
repl_recipe({
	repltype='device4',
	item='basic-accumulator',
	time=battery_cost * 5 + plate_cost * 2,
	prerequisites={'electric-energy-accumulators-1', 'repltech-26-iron-26', 'repltech-battery'}
})

repl_recipe({
	repltype='device4',
	item='replicator-2',
	time=circuit_1_cost * 3 + dark_2_cost * 4 + dark_3_cost * 2 + plate_cost * 4,
	upgrade=true,
	prerequisites={'repltech-replicator-1', 'repltech-dark-matter-transducer'}
})
repl_recipe({
	repltype='device4',
	item='replicator-3',
	time=circuit_1_cost * 3 + circuit_2_cost + dark_2_cost * 4 + dark_3_cost * 6 + plate_cost * 4,
	upgrade=true,
	prerequisites={'repltech-replicator-2', circuit_2_repltech}
})

-- T4 Military
repl_recipe({
	repltype='device4',
	item='laser-turret',
	time=steel_cost * 5 + circuit_1_cost * 5 + battery_cost * 3,
	prerequisites={'laser-turrets', 'repltech-steel-plate', circuit_1_repltech, 'repltech-battery'}
})
repl_recipe({
	repltype='device4',
	item='distractor-capsule',
	time=((steel_cost + plate_cost * 5 + circuit_1_cost * 2 + gear_cost * 3) * 4 + circuit_2_cost * 3),
	prerequisites={'combat-robotics-2', circuit_2_repltech, 'repltech-iron-gear-wheel'}
})
repl_recipe({
	repltype='device4',
	item='explosive-rocket',
	time=circuit_1_cost + explosives_cost * 6 + plate_cost * 2,
	prerequisites={'explosive-rocketry', 'repltech-rocket'}
})

-- Other Tier 4
repl_recipe({
	name='science-pack-b',
	itemName='science-pack-b',
	repltype='science',
	tier=4,
	item='science-pack-2',
	time=belt_cost + plate_cost + gear_cost + circuit_1_cost,
	prerequisites={'repltech-basic-transport-belt', 'repltech-basic-inserter'}
})
repl_recipe({
	repltype='alien',
	tier=4,
	item='alien-artifact',
	time=alien_cost - repl_penalty,
	prerequisites={'alien-technology'}
})
repl_recipe({
	name='science-pack-d',
	itemName='science-pack-d',
	repltype='science',
	tier=4,
	item='alien-science-pack',
	time=alien_cost / 10,
	prerequisites={'repltech-alien-artifact'}
})


-- Tier 5
-- No More Limits

-- T5 Devices
local circuit_3_cost
local circuit_3_repltech
if data.raw["item"]["basic-circuit-board"] then
	circuit_3_cost = 46 --fiberglass_cost + plate_cost + gold_cost + ferric_chloride_cost * 0.5 + circuit_components_1_cost * 2 + circuit_components_2_cost * 4 + circuit_components_3_cost * 2 + solder_cost * 2 + smelt_cost * 3
	circuit_3_repltech = 'repltech-bob-advanced-circuit'
	repl_recipe({
		repltype='device5',
		item='processing-unit',
		name='bob-processing-unit',
		itemName='bob-processing-unit',
		time=circuit_3_cost,
		prerequisites = {'repltech-integrated-electronics', 'repltech-solder'}
	})
else
	circuit_3_cost = circuit_1_cost * 20 + circuit_2_cost * 2 + acid_cost * 0.5
	circuit_3_repltech = 'repltech-processing-unit'
	repl_recipe({
		repltype='device5',
		item='processing-unit',
		time=circuit_3_cost,
		prerequisites={circuit_1_repltech, circuit_2_repltech}
	})
end

repl_recipe({
	repltype='device5',
	item='roboport',
	time=(circuit_2_cost + gear_cost + steel_cost) * 45 - repl_penalty,
	prerequisites={circuit_2_repltech, 'repltech-steel-plate', 'repltech-iron-gear-wheel'}
})

repl_recipe({
	repltype='device5',
	item='replicator-4',
	time=circuit_1_cost * 3 + circuit_2_cost * 3 + dark_2_cost * 4 + dark_3_cost * 6 + dark_4_cost * 2 + plate_cost * 4,
	upgrade=true,
	prerequisites={'repltech-replicator-3', 'repltech-matter-conduit'}
})
repl_recipe({
	repltype='device5',
	item='replicator-5',
	time=circuit_1_cost * 23 + circuit_2_cost * 5 + dark_2_cost * 4 + dark_3_cost * 6 + dark_4_cost * 6 + plate_cost * 4,
	upgrade=true,
	prerequisites={'repltech-replicator-4', circuit_3_repltech}
})

local circuit_4_cost
local circuit_4_repltech
if data.raw["item"]["basic-circuit-board"] then
	circuit_4_cost = 79.5 --fiberglass_cost + plate_cost * 2 + gold_cost + ferric_chloride_cost * 2 + circuit_components_1_cost * 1 + circuit_components_2_cost * 2 + circuit_components_3_cost * 4 + circuit_components_4_cost * 2 + solder_cost * 4 + smelt_cost * 4
	circuit_4_repltech = 'repltech-bob-advanced-processing-unit'
	repl_recipe({
		repltype='device5',
		item='advanced-processing-unit',
		name='bob-advanced-processing-unit',
		itemName='bob-advanced-processing-unit',
		time=circuit_4_cost,
		prerequisites = {'repltech-processing-electronics', 'repltech-solder'}
	})
else
	circuit_4_cost = circuit_3_cost * 5 + (ore_cost * 1.5 + smelt_cost) * 6 + cable_cost * 10 + circuit_1_cost * 10 + rubber_cost * 10
	circuit_4_repltech = 'repltech-advanced-processing-unit'
	repl_recipe({
	repltype='device5',
	item='advanced-processing-unit',
	time=circuit_4_cost,
	prerequisites={'advanced-processing-unit', circuit_3_repltech}
})
end
local circuit_5_cost = (crystal_cost + cutting_cost + compressing_cost + obsidian_cost * 50 + (140+224+403)/3.5) + acid_cost * 15 + circuit_4_cost + oil_cost * 10 + smelt_cost * 100
repl_recipe({
	repltype='device5',
	item='logic-diamond-processor',
	time=circuit_5_cost,
	prerequisites={'logic-diamond-processor', 'repltech-gem-diamond', 'repltech-sulfuric-acid', circuit_4_repltech, 'repltech-lubricant'}
})

repl_recipe({
	repltype='device5',
	item='water-bomb',
	time=steel_cost * 33 + plate_cost * (4 + 32 / 5) + circuit_1_cost * 2 + circuit_3_cost + explosives_cost * 24,
	prerequisites={'repltech-electric-engine-unit', circuit_3_repltech, 'repltech-water', 'repltech-explosives'}
})

-- Living Things
repl_recipe({
	repltype='life',
	item='raw-fish',
	time=life_cost - repl_penalty,
	prerequisites={}
})

repl_recipe({
	repltype='life',
	item='tf-germling',
	time=life_cost - repl_penalty,
	prerequisites={}
})

-- Other Tier 5
repl_recipe({
	name='science-pack-c',
	itemName='science-pack-c',
	repltype='science',
	tier=5,
	item='science-pack-3',
	time=battery_cost + circuit_2_cost + (plate_cost * 3 + gear_cost + circuit_1_cost * 7) + steel_cost,
	prerequisites={'repltech-battery', circuit_2_repltech, 'repltech-smart-inserter', 'repltech-steel-plate'}
})


-- Modules
local module_1_cost
local module_2_cost
local module_3_cost

if data.raw.technology["god-module-1"] then
	local module_case_cost = plastic_cost * 2 + (ore_cost * 1.75 + smelt_cost * 2) * 5
	local module_contact_cost = 1.5 --(plate_cost + gold_cost) / 5
	local module_board_0_cost = 11.5 --plate_cost + tin_cost + resin_cost * 0.5 + wood_cost * 0.5 + ferric_chloride_cost * 0.5
	local module_board_1_cost = 12.5 --(plate_cost + tin_cost + resin_cost * 0.5 + wood_cost * 0.5 + ferric_chloride_cost * 0.5) / 4 + circuit_components_1_cost * 2 + circuit_components_2_cost * 2 + solder_cost
	local module_board_2_cost = 24 --(plate_cost + gold_cost + fiberglass_cost + ferric_chloride_cost * 0.5)/ 4 + circuit_components_2_cost * 2 + circuit_components_3_cost * 2 + solder_cost * 2
	local module_board_3_cost = 30.5 --(plate_cost * 2 + gold_cost * 2 + fiberglass_cost + ferric_chloride_cost)/ 4 + circuit_components_3_cost * 2 + circuit_components_4_cost + solder_cost * 3
	module_1_cost = 73.5 --module_board_0_cost + module_board_1_cost + module_case_cost + module_contact_cost * 4
	module_2_cost = 109 --module_1_cost + module_board_1_cost * 2 + module_contact_cost * 5 + solder_cost
	module_3_cost = 200.5 --module_2_cost + module_board_2_cost * 3 + solder_cost * 2 + circuit_components_2_cost * 5
	local module_4_cost = 335 --module_3_cost + module_board_2_cost * 4 + module_contact_cost * 5 + solder_cost * 3 + circuit_components_3_cost * 5
	local module_5_cost = 543 --module_4_cost + module_board_2_cost * 5 + module_contact_cost * 5 + solder_cost * 4 + circuit_components_3_cost * 5 + ((ore_cost * 10 / 1) / 4 + grinding_cost + polishing_cost)
	local module_6_cost = 820.5 --module_5_cost + module_board_3_cost * 6 + module_contact_cost * 5 + solder_cost * 5 + circuit_components_3_cost * 5 + ((ore_cost * 10 / 0.6) / 4 + grinding_cost + polishing_cost)
	local module_7_cost = 1188 --module_6_cost + module_board_3_cost * 8 + module_contact_cost * 5 + solder_cost * 7 + circuit_components_3_cost * 5 + circuit_components_4_cost * 3 + ((ore_cost * 10 / 0.4) / 4 + grinding_cost + polishing_cost)
	local module_8_cost = 1658 --module_7_cost + module_board_3_cost * 10 + module_contact_cost * 5 + solder_cost * 8 + circuit_components_2_cost * 5 + circuit_components_3_cost * 5 + circuit_components_4_cost * 5 + ((ore_cost * 10 / 0.2) / 4 + grinding_cost + polishing_cost)
	
	--Common module components
	repl_recipe({
		name='bob-module-case',
		itemName='bob-module-case',
		repltype='module',
		tier=3,
		item='module-case',
		time=module_case_cost,
		prerequisites={'modules', 'repltech-plastic-bar', 'repltech-13-aluminium-13'}
	})
	repl_recipe({
		name='bob-module-contact',
		itemName='bob-module-contact',
		repltype='module',
		tier=2,
		item='module-contact',
		time=module_contact_cost,
		prerequisites={'modules', 'repltech-29-copper-29', 'repltech-79-gold-79'}
	})
	repl_recipe({
		name='bob-module-circuit-board',
		itemName='bob-module-circuit-board',
		repltype='module',
		tier=3,
		item='module-circuit-board',
		time=module_board_0_cost,
		prerequisites={'modules', 'repltech-29-copper-29', 'repltech-50-tin-50', 'repltech-plastic-bar', 'repltech-14-ore-silicon'}
	})
	
	--Module boards
	repl_recipe({
		name='bob-module-boards-1',
		repltype='module',
		tier=3,
		itemTable = {{
			itemName='bob-speed-processor',
			item='speed-processor',
			time=module_board_1_cost,
		}, {
			itemName='bob-effectivity-processor',
			item='effectivity-processor',
			time=module_board_1_cost,
		}, {
			itemName='bob-productivity-processor',
			item='productivity-processor',
			time=module_board_1_cost,
		}, {
			itemName='bob-pollution-clean-processor',
			item='pollution-clean-processor',
			time=module_board_1_cost,
		}, {
			itemName='bob-pollution-create-processor',
			item='pollution-create-processor',
			time=module_board_1_cost,
		}},
		upgrade=true,
		prerequisites={'modules', 'repltech-electronic-components', 'repltech-solder'}
	})
	repl_recipe({
		name='bob-module-boards-2',
		repltype='module',
		tier=4,
		itemTable = {{
			itemName='bob-speed-processor-2',
			item='speed-processor-2',
			time=module_board_2_cost,
		}, {
			itemName='bob-effectivity-processor-2',
			item='effectivity-processor-2',
			time=module_board_2_cost,
		}, {
			itemName='bob-productivity-processor-2',
			item='productivity-processor-2',
			time=module_board_2_cost,
		}, {
			itemName='bob-pollution-clean-processor-2',
			item='pollution-clean-processor-2',
			time=module_board_2_cost,
		}, {
			itemName='bob-pollution-create-processor-2',
			item='pollution-create-processor-2',
			time=module_board_2_cost,
		}},
		upgrade=true,
		prerequisites={'repltech-bob-module-boards-1', 'repltech-integrated-electronics'}
	})
	repl_recipe({
		name='bob-module-boards-3',
		repltype='module',
		tier=4,
		itemTable = {{
			itemName='bob-speed-processor-3',
			item='speed-processor-3',
			time=module_board_3_cost,
		}, {
			itemName='bob-effectivity-processor-3',
			item='effectivity-processor-3',
			time=module_board_3_cost,
		}, {
			itemName='bob-productivity-processor-3',
			item='productivity-processor-3',
			time=module_board_3_cost,
		}, {
			itemName='bob-pollution-clean-processor-3',
			item='pollution-clean-processor-3',
			time=module_board_3_cost,
		}, {
			itemName='bob-pollution-create-processor-3',
			item='pollution-create-processor-3',
			time=module_board_3_cost,
		}},
		upgrade=true,
		prerequisites={'repltech-bob-module-boards-2', 'repltech-processing-electronics'}
	})
	
	--Basic Modules
	-- 1 {'repltech-bob-module-boards-1', 'repltech-bob-module-case', 'repltech-bob-module-circuit-board', 'repltech-bob-module-contact'}
	-- 3 {'repltech-bob-module-boards-2'}
	-- 5 {'repltech-gem-shining'}
	-- 6 {'repltech-bob-module-boards-3'}
	repl_recipe({
		name='bob-speed-module-1',
		itemName='bob-speed-module-1',
		repltype='module',
		tier=3,
		item='speed-module',
		time=module_1_cost,
		upgrade=true,
		prerequisites={'speed-module', 'repltech-bob-module-boards-1', 'repltech-bob-module-case', 'repltech-bob-module-circuit-board', 'repltech-bob-module-contact'}
	})
	repl_recipe({
		name='bob-speed-module-2',
		itemName='bob-speed-module-2',
		repltype='module',
		tier=4,
		item='speed-module-2',
		time=module_2_cost,
		upgrade=true,
		prerequisites={'speed-module-2', 'repltech-bob-speed-module-1'}
	})
	repl_recipe({
		name='bob-speed-module-3',
		itemName='bob-speed-module-3',
		repltype='module',
		tier=4,
		item='speed-module-3',
		time=module_3_cost,
		upgrade=true,
		prerequisites={'speed-module-3', 'repltech-bob-speed-module-2', 'repltech-bob-module-boards-2'}
	})
	repl_recipe({
		name='bob-speed-module-4',
		itemName='bob-speed-module-4',
		repltype='module',
		tier=5,
		item='speed-module-4',
		time=module_4_cost,
		upgrade=true,
		prerequisites={'speed-module-4', 'repltech-bob-speed-module-3'}
	})
	repl_recipe({
		name='bob-speed-module-5',
		itemName='bob-speed-module-5',
		repltype='module',
		tier=5,
		item='speed-module-5',
		time=module_5_cost,
		upgrade=true,
		prerequisites={'speed-module-5', 'repltech-bob-speed-module-4', 'repltech-gem-shining'}
	})
	repl_recipe({
		name='bob-speed-module-6',
		itemName='bob-speed-module-6',
		repltype='module',
		tier=5,
		item='speed-module-6',
		time=module_6_cost,
		upgrade=true,
		prerequisites={'speed-module-6', 'repltech-bob-speed-module-5', 'repltech-bob-module-boards-3'}
	})
	repl_recipe({
		name='bob-speed-module-7',
		itemName='bob-speed-module-7',
		repltype='module',
		tier=5,
		item='speed-module-7',
		time=module_7_cost,
		upgrade=true,
		prerequisites={'speed-module-7', 'repltech-bob-speed-module-6'}
	})
	repl_recipe({
		name='bob-speed-module-8',
		itemName='bob-speed-module-8',
		repltype='module',
		tier=5,
		item='speed-module-8',
		time=module_8_cost,
		upgrade=true,
		prerequisites={'speed-module-8', 'repltech-bob-speed-module-7'}
	})
	
	repl_recipe({
		name='bob-effectivity-module-1',
		itemName='bob-effectivity-module-1',
		repltype='module',
		tier=3,
		item='effectivity-module',
		time=module_1_cost,
		upgrade=true,
		prerequisites={'effectivity-module', 'repltech-bob-module-boards-1', 'repltech-bob-module-case', 'repltech-bob-module-circuit-board', 'repltech-bob-module-contact'}
	})
	repl_recipe({
		name='bob-effectivity-module-2',
		itemName='bob-effectivity-module-2',
		repltype='module',
		tier=4,
		item='effectivity-module-2',
		time=module_2_cost,
		upgrade=true,
		prerequisites={'effectivity-module-2', 'repltech-bob-effectivity-module-1'}
	})
	repl_recipe({
		name='bob-effectivity-module-3',
		itemName='bob-effectivity-module-3',
		repltype='module',
		tier=4,
		item='effectivity-module-3',
		time=module_3_cost,
		upgrade=true,
		prerequisites={'effectivity-module-3', 'repltech-bob-effectivity-module-2', 'repltech-bob-module-boards-2'}
	})
	repl_recipe({
		name='bob-effectivity-module-4',
		itemName='bob-effectivity-module-4',
		repltype='module',
		tier=5,
		item='effectivity-module-4',
		time=module_4_cost,
		upgrade=true,
		prerequisites={'effectivity-module-4', 'repltech-bob-effectivity-module-3'}
	})
	repl_recipe({
		name='bob-effectivity-module-5',
		itemName='bob-effectivity-module-5',
		repltype='module',
		tier=5,
		item='effectivity-module-5',
		time=module_5_cost,
		upgrade=true,
		prerequisites={'effectivity-module-5', 'repltech-bob-effectivity-module-4', 'repltech-gem-shining'}
	})
	repl_recipe({
		name='bob-effectivity-module-6',
		itemName='bob-effectivity-module-6',
		repltype='module',
		tier=5,
		item='effectivity-module-6',
		time=module_6_cost,
		upgrade=true,
		prerequisites={'effectivity-module-6', 'repltech-bob-effectivity-module-5', 'repltech-bob-module-boards-3'}
	})
	repl_recipe({
		name='bob-effectivity-module-7',
		itemName='bob-effectivity-module-7',
		repltype='module',
		tier=5,
		item='effectivity-module-7',
		time=module_7_cost,
		upgrade=true,
		prerequisites={'effectivity-module-7', 'repltech-bob-effectivity-module-6'}
	})
	repl_recipe({
		name='bob-effectivity-module-8',
		itemName='bob-effectivity-module-8',
		repltype='module',
		tier=5,
		item='effectivity-module-8',
		time=module_8_cost,
		upgrade=true,
		prerequisites={'effectivity-module-8', 'repltech-bob-effectivity-module-7'}
	})
	repl_recipe({
		name='bob-productivity-module-1',
		itemName='bob-productivity-module-1',
		repltype='module',
		tier=3,
		item='productivity-module',
		time=module_1_cost,
		upgrade=true,
		prerequisites={'productivity-module', 'repltech-bob-module-boards-1', 'repltech-bob-module-case', 'repltech-bob-module-circuit-board', 'repltech-bob-module-contact'}
	})
	repl_recipe({
		name='bob-productivity-module-2',
		itemName='bob-productivity-module-2',
		repltype='module',
		tier=4,
		item='productivity-module-2',
		time=module_2_cost,
		upgrade=true,
		prerequisites={'productivity-module-2', 'repltech-bob-productivity-module-1'}
	})
	repl_recipe({
		name='bob-productivity-module-3',
		itemName='bob-productivity-module-3',
		repltype='module',
		tier=4,
		item='productivity-module-3',
		time=module_3_cost,
		upgrade=true,
		prerequisites={'productivity-module-3', 'repltech-bob-productivity-module-2', 'repltech-bob-module-boards-2'}
	})
	repl_recipe({
		name='bob-productivity-module-4',
		itemName='bob-productivity-module-4',
		repltype='module',
		tier=5,
		item='productivity-module-4',
		time=module_4_cost,
		upgrade=true,
		prerequisites={'productivity-module-4', 'repltech-bob-productivity-module-3'}
	})
	repl_recipe({
		name='bob-productivity-module-5',
		itemName='bob-productivity-module-5',
		repltype='module',
		tier=5,
		item='productivity-module-5',
		time=module_5_cost,
		upgrade=true,
		prerequisites={'productivity-module-5', 'repltech-bob-productivity-module-4', 'repltech-gem-shining'}
	})
	repl_recipe({
		name='bob-productivity-module-6',
		itemName='bob-productivity-module-6',
		repltype='module',
		tier=5,
		item='productivity-module-6',
		time=module_6_cost,
		upgrade=true,
		prerequisites={'productivity-module-6', 'repltech-bob-productivity-module-5', 'repltech-bob-module-boards-3'}
	})
	repl_recipe({
		name='bob-productivity-module-7',
		itemName='bob-productivity-module-7',
		repltype='module',
		tier=5,
		item='productivity-module-7',
		time=module_7_cost,
		upgrade=true,
		prerequisites={'productivity-module-7', 'repltech-bob-productivity-module-6'}
	})
	repl_recipe({
		name='bob-productivity-module-8',
		itemName='bob-productivity-module-8',
		repltype='module',
		tier=5,
		item='productivity-module-8',
		time=module_8_cost,
		upgrade=true,
		prerequisites={'productivity-module-8', 'repltech-bob-productivity-module-7'}
	})
	
	--Simple Combined Modules
	local simple_combined_module_1_cost = 86 --module_board_0_cost + module_board_1_cost * 2 + module_case_cost + module_contact_cost * 4
	local simple_combined_module_2_cost = 149.5 --simple_combined_module_1_cost + module_board_1_cost * 4 + module_contact_cost * 5 + solder_cost * 2
	local simple_combined_module_3_cost = 321.5 --simple_combined_module_2_cost + module_board_2_cost * 6 + solder_cost * 3 + circuit_components_2_cost * 7
	local simple_combined_module_4_cost = 566.5 --simple_combined_module_3_cost + module_board_2_cost * 8 + module_contact_cost * 5 + solder_cost * 5 + circuit_components_3_cost * 7
	local simple_combined_module_5_cost = 909.5 --simple_combined_module_4_cost + module_board_2_cost * 10 + module_contact_cost * 5 + solder_cost * 6 + circuit_components_3_cost * 7 + ((ore_cost * 10 / 1) / 4 + grinding_cost + polishing_cost)
	local simple_combined_module_6_cost = 1384.5 --simple_combined_module_5_cost + module_board_3_cost * 12 + module_contact_cost * 5 + solder_cost * 7 + circuit_components_3_cost * 7 + ((ore_cost * 10 / 0.6) / 4 + grinding_cost + polishing_cost)
	local simple_combined_module_7_cost = 2030.5 --simple_combined_module_6_cost + module_board_3_cost * 16 + module_contact_cost * 5 + solder_cost * 10 + circuit_components_3_cost * 8 + circuit_components_4_cost * 5 + ((ore_cost * 10 / 0.4) / 4 + grinding_cost + polishing_cost)
	local simple_combined_module_8_cost = 2857.5 --simple_combined_module_7_cost + module_board_3_cost * 20 + module_contact_cost * 5 + solder_cost * 12 + circuit_components_2_cost * 8 + circuit_components_3_cost * 8 + circuit_components_4_cost * 8 + ((ore_cost * 10 / 0.2) / 4 + grinding_cost + polishing_cost)
	
	repl_recipe({
		name='bob-raw-speed-module-1',
		itemName='bob-raw-speed-module-1',
		repltype='module',
		tier=3,
		item='raw-speed-module-1',
		time=simple_combined_module_1_cost,
		upgrade=true,
		prerequisites={'raw-speed-module-1', 'repltech-bob-module-boards-1', 'repltech-bob-module-case', 'repltech-bob-module-circuit-board', 'repltech-bob-module-contact'}
	})
	repl_recipe({
		name='bob-raw-speed-module-2',
		itemName='bob-raw-speed-module-2',
		repltype='module',
		tier=4,
		item='raw-speed-module-2',
		time=simple_combined_module_2_cost,
		upgrade=true,
		prerequisites={'raw-speed-module-2', 'repltech-bob-raw-speed-module-1'}
	})
	repl_recipe({
		name='bob-raw-speed-module-3',
		itemName='bob-raw-speed-module-3',
		repltype='module',
		tier=4,
		item='raw-speed-module-3',
		time=simple_combined_module_3_cost,
		upgrade=true,
		prerequisites={'raw-speed-module-3', 'repltech-bob-raw-speed-module-2', 'repltech-bob-module-boards-2'}
	})
	repl_recipe({
		name='bob-raw-speed-module-4',
		itemName='bob-raw-speed-module-4',
		repltype='module',
		tier=5,
		item='raw-speed-module-4',
		time=simple_combined_module_4_cost,
		upgrade=true,
		prerequisites={'raw-speed-module-4', 'repltech-bob-raw-speed-module-3'}
	})
	repl_recipe({
		name='bob-raw-speed-module-5',
		itemName='bob-raw-speed-module-5',
		repltype='module',
		tier=5,
		item='raw-speed-module-5',
		time=simple_combined_module_5_cost,
		upgrade=true,
		prerequisites={'raw-speed-module-5', 'repltech-bob-raw-speed-module-4', 'repltech-gem-shining'}
	})
	repl_recipe({
		name='bob-raw-speed-module-6',
		itemName='bob-raw-speed-module-6',
		repltype='module',
		tier=5,
		item='raw-speed-module-6',
		time=simple_combined_module_6_cost,
		upgrade=true,
		prerequisites={'raw-speed-module-6', 'repltech-bob-raw-speed-module-5', 'repltech-bob-module-boards-3'}
	})
	repl_recipe({
		name='bob-raw-speed-module-7',
		itemName='bob-raw-speed-module-7',
		repltype='module',
		tier=5,
		item='raw-speed-module-7',
		time=simple_combined_module_7_cost,
		upgrade=true,
		prerequisites={'raw-speed-module-7', 'repltech-bob-raw-speed-module-6'}
	})
	repl_recipe({
		name='bob-raw-speed-module-8',
		itemName='bob-raw-speed-module-8',
		repltype='module',
		tier=5,
		item='raw-speed-module-8',
		time=simple_combined_module_8_cost,
		upgrade=true,
		prerequisites={'raw-speed-module-8', 'repltech-bob-raw-speed-module-7'}
	})
	
	repl_recipe({
		name='bob-green-module-1',
		itemName='bob-green-module-1',
		repltype='module',
		tier=3,
		item='green-module-1',
		time=simple_combined_module_1_cost,
		upgrade=true,
		prerequisites={'green-module-1', 'repltech-bob-module-boards-1', 'repltech-bob-module-case', 'repltech-bob-module-circuit-board', 'repltech-bob-module-contact'}
	})
	repl_recipe({
		name='bob-green-module-2',
		itemName='bob-green-module-2',
		repltype='module',
		tier=4,
		item='green-module-2',
		time=simple_combined_module_2_cost,
		upgrade=true,
		prerequisites={'green-module-2', 'repltech-bob-green-module-1'}
	})
	repl_recipe({
		name='bob-green-module-3',
		itemName='bob-green-module-3',
		repltype='module',
		tier=4,
		item='green-module-3',
		time=simple_combined_module_3_cost,
		upgrade=true,
		prerequisites={'green-module-3', 'repltech-bob-green-module-2', 'repltech-bob-module-boards-2'}
	})
	repl_recipe({
		name='bob-green-module-4',
		itemName='bob-green-module-4',
		repltype='module',
		tier=5,
		item='green-module-4',
		time=simple_combined_module_4_cost,
		upgrade=true,
		prerequisites={'green-module-4', 'repltech-bob-green-module-3'}
	})
	repl_recipe({
		name='bob-green-module-5',
		itemName='bob-green-module-5',
		repltype='module',
		tier=5,
		item='green-module-5',
		time=simple_combined_module_5_cost,
		upgrade=true,
		prerequisites={'green-module-5', 'repltech-bob-green-module-4', 'repltech-gem-shining'}
	})
	repl_recipe({
		name='bob-green-module-6',
		itemName='bob-green-module-6',
		repltype='module',
		tier=5,
		item='green-module-6',
		time=simple_combined_module_6_cost,
		upgrade=true,
		prerequisites={'green-module-6', 'repltech-bob-green-module-5', 'repltech-bob-module-boards-3'}
	})
	repl_recipe({
		name='bob-green-module-7',
		itemName='bob-green-module-7',
		repltype='module',
		tier=5,
		item='green-module-7',
		time=simple_combined_module_7_cost,
		upgrade=true,
		prerequisites={'green-module-7', 'repltech-bob-green-module-6'}
	})
	repl_recipe({
		name='bob-green-module-8',
		itemName='bob-green-module-8',
		repltype='module',
		tier=5,
		item='green-module-8',
		time=simple_combined_module_8_cost,
		upgrade=true,
		prerequisites={'green-module-8', 'repltech-bob-green-module-7'}
	})
	
	--Complex Combined Modules
	local complex_combined_module_1_cost = 98.5 --module_board_0_cost + module_board_1_cost * 3 + module_case_cost + module_contact_cost * 4
	local complex_combined_module_2_cost = 187 --complex_combined_module_1_cost + module_board_1_cost * 6 + module_contact_cost * 5 + solder_cost * 2
	local complex_combined_module_3_cost = 431 --complex_combined_module_2_cost + module_board_2_cost * 9 + solder_cost * 3 + circuit_components_2_cost * 7
	local complex_combined_module_4_cost = 772 --complex_combined_module_3_cost + module_board_2_cost * 12 + module_contact_cost * 5 + solder_cost * 5 + circuit_components_3_cost * 7
	local complex_combined_module_5_cost = 1234 --complex_combined_module_4_cost + module_board_2_cost * 15 + module_contact_cost * 5 + solder_cost * 6 + circuit_components_3_cost * 7 + ((ore_cost * 10 / 1) / 4 + grinding_cost + polishing_cost)
	local complex_combined_module_6_cost = 1893 --complex_combined_module_5_cost + module_board_3_cost * 18 + module_contact_cost * 5 + solder_cost * 7 + circuit_components_3_cost * 7 + ((ore_cost * 10 / 0.6) / 4 + grinding_cost + polishing_cost)
	local complex_combined_module_7_cost = 2783 --complex_combined_module_6_cost + module_board_3_cost * 24 + module_contact_cost * 5 + solder_cost * 10 + circuit_components_3_cost * 8 + circuit_components_4_cost * 5 + ((ore_cost * 10 / 0.4) / 4 + grinding_cost + polishing_cost)
	local complex_combined_module_8_cost = 3915 --complex_combined_module_7_cost + module_board_3_cost * 30 + module_contact_cost * 5 + solder_cost * 12 + circuit_components_2_cost * 8 + circuit_components_3_cost * 8 + circuit_components_4_cost * 8 + ((ore_cost * 10 / 0.2) / 4 + grinding_cost + polishing_cost)
	
	repl_recipe({
		name='bob-raw-productivity-module-1',
		itemName='bob-raw-productivity-module-1',
		repltype='module',
		tier=3,
		item='raw-productivity-module-1',
		time=complex_combined_module_1_cost,
		upgrade=true,
		prerequisites={'raw-productivity-module-1', 'repltech-bob-module-boards-1', 'repltech-bob-module-case', 'repltech-bob-module-circuit-board', 'repltech-bob-module-contact'}
	})
	repl_recipe({
		name='bob-raw-productivity-module-2',
		itemName='bob-raw-productivity-module-2',
		repltype='module',
		tier=4,
		item='raw-productivity-module-2',
		time=complex_combined_module_2_cost,
		upgrade=true,
		prerequisites={'raw-productivity-module-2', 'repltech-bob-raw-productivity-module-1'}
	})
	repl_recipe({
		name='bob-raw-productivity-module-3',
		itemName='bob-raw-productivity-module-3',
		repltype='module',
		tier=4,
		item='raw-productivity-module-3',
		time=complex_combined_module_3_cost,
		upgrade=true,
		prerequisites={'raw-productivity-module-3', 'repltech-bob-raw-productivity-module-2', 'repltech-bob-module-boards-2'}
	})
	repl_recipe({
		name='bob-raw-productivity-module-4',
		itemName='bob-raw-productivity-module-4',
		repltype='module',
		tier=5,
		item='raw-productivity-module-4',
		time=complex_combined_module_4_cost,
		upgrade=true,
		prerequisites={'raw-productivity-module-4', 'repltech-bob-raw-productivity-module-3'}
	})
	repl_recipe({
		name='bob-raw-productivity-module-5',
		itemName='bob-raw-productivity-module-5',
		repltype='module',
		tier=5,
		item='raw-productivity-module-5',
		time=complex_combined_module_5_cost,
		upgrade=true,
		prerequisites={'raw-productivity-module-5', 'repltech-bob-raw-productivity-module-4', 'repltech-gem-shining'}
	})
	repl_recipe({
		name='bob-raw-productivity-module-6',
		itemName='bob-raw-productivity-module-6',
		repltype='module',
		tier=5,
		item='raw-productivity-module-6',
		time=complex_combined_module_6_cost,
		upgrade=true,
		prerequisites={'raw-productivity-module-6', 'repltech-bob-raw-productivity-module-5', 'repltech-bob-module-boards-3'}
	})
	repl_recipe({
		name='bob-raw-productivity-module-7',
		itemName='bob-raw-productivity-module-7',
		repltype='module',
		tier=5,
		item='raw-productivity-module-7',
		time=complex_combined_module_7_cost,
		upgrade=true,
		prerequisites={'raw-productivity-module-7', 'repltech-bob-raw-productivity-module-6'}
	})
	repl_recipe({
		name='bob-raw-productivity-module-8',
		itemName='bob-raw-productivity-module-8',
		repltype='module',
		tier=5,
		item='raw-productivity-module-8',
		time=complex_combined_module_8_cost,
		upgrade=true,
		prerequisites={'raw-productivity-module-8', 'repltech-bob-raw-productivity-module-7'}
	})
	
	local god_module_1_cost = 243.5 --module_board_1_cost * 14 + module_case_cost + module_board_0_cost + module_contact_cost * 5 + solder_cost * 2
	local god_module_2_cost = 987.39 --god_module_1_cost + module_board_2_cost * 28 + module_contact_cost * 5 + solder_cost * 5 + circuit_components_2_cost * 7 + circuit_components_3_cost * 7
	local god_module_3_cost = 2422.5 --god_module_2_cost + module_board_3_cost * 42 + module_contact_cost * 5 + solder_cost * 7 + circuit_components_3_cost * 7 + ((ore_cost * 10 / 1) / 4 + grinding_cost + polishing_cost) + ((ore_cost * 10 / 0.8) / 4 + grinding_cost + polishing_cost)
	local god_module_4_cost = 4809.5 --god_module_3_cost + module_board_3_cost * 70 + module_contact_cost * 5 + solder_cost * 12 + circuit_components_2_cost * 8 + circuit_components_3_cost * 8 + circuit_components_4_cost * 8 + ((ore_cost * 10 / 0.5) / 4 + grinding_cost + polishing_cost) + ((ore_cost * 10 / 0.6) / 4 + grinding_cost + polishing_cost)
	local god_module_5_cost = 8319.5 --god_module_4_cost + module_board_3_cost * 105 + module_contact_cost * 5 + solder_cost * 15 + circuit_components_2_cost * 10 + circuit_components_3_cost * 10 + circuit_components_4_cost * 10 + ((ore_cost * 10 / 0.4) / 4 + grinding_cost + polishing_cost) + ((ore_cost * 10 / 0.2) / 4 + grinding_cost + polishing_cost)
	
	repl_recipe({
		name='bob-god-module-1',
		itemName='bob-god-module-1',
		repltype='module',
		tier=3,
		item='god-module-1',
		time=god_module_1_cost,
		upgrade=true,
		prerequisites={'god-module-1', 'repltech-bob-module-boards-1', 'repltech-bob-module-case', 'repltech-bob-module-circuit-board', 'repltech-bob-module-contact'}
	})
	repl_recipe({
		name='bob-god-module-2',
		itemName='bob-god-module-2',
		repltype='module',
		tier=4,
		item='god-module-2',
		time=god_module_2_cost,
		upgrade=true,
		prerequisites={'god-module-2', 'repltech-bob-god-module-1', 'repltech-bob-module-boards-2'}
	})
	repl_recipe({
		name='bob-god-module-3',
		itemName='bob-god-module-3',
		repltype='module',
		tier=5,
		item='god-module-3',
		time=god_module_3_cost,
		upgrade=true,
		prerequisites={'god-module-3', 'repltech-bob-god-module-2', 'repltech-bob-module-boards-3', 'repltech-gem-shining'}
	})
	repl_recipe({
		name='bob-god-module-4',
		itemName='bob-god-module-4',
		repltype='module',
		tier=5,
		item='god-module-4',
		time=god_module_4_cost,
		upgrade=true,
		prerequisites={'god-module-4', 'repltech-bob-god-module-3'}
	})
	repl_recipe({
		name='bob-god-module-5',
		itemName='bob-god-module-5',
		repltype='module',
		tier=5,
		item='god-module-5',
		time=god_module_5_cost,
		upgrade=true,
		prerequisites={'god-module-5', 'repltech-bob-god-module-4'}
	})
	
	
elseif data.raw.technology["dymodule"] then
	-- DyTech modules (if DyTech Modules are enabled and Bob's Modules are not)
	module_1_cost = plate_cost * 10 + circuit_1_cost * 5
	module_2_cost = module_1_cost + plate_cost * 5 + steel_cost * 5 + circuit_1_cost * 5
	module_3_cost = module_2_cost + steel_cost * 5 + circuit_1_cost * 5 + circuit_2_cost * 5
	repl_recipe({
		name='speed-module-1',
		itemName='speed-module-1',
		repltype='module',
		tier=3,
		item='speed-module',
		time=module_1_cost,
		upgrade=true,
		prerequisites={'speed-module', circuit_1_repltech, 'repltech-26-iron-26', 'repltech-29-copper-29'}
	})
	repl_recipe({
		name='effectivity-module-1',
		itemName='effectivity-module-1',
		repltype='module',
		tier=3,
		item='effectivity-module',
		time=module_1_cost,
		upgrade=true,
		prerequisites={'effectivity-module', circuit_1_repltech, 'repltech-26-iron-26', 'repltech-29-copper-29'}
	})
	repl_recipe({
		name='productivity-module-1',
		itemName='productivity-module-1',
		repltype='module',
		tier=3,
		item='productivity-module',
		time=module_1_cost,
		upgrade=true,
		prerequisites={'productivity-module', circuit_1_repltech, 'repltech-26-iron-26', 'repltech-29-copper-29'}
	})
	repl_recipe({
		repltype='module',
		tier=4,
		item='speed-module-2',
		time=module_2_cost,
		upgrade=true,
		prerequisites={'speed-module-2', 'repltech-speed-module-1', 'repltech-steel-plate'}
	})
	repl_recipe({
		repltype='module',
		tier=4,
		item='effectivity-module-2',
		time=module_2_cost,
		upgrade=true,
		prerequisites={'effectivity-module-2', 'repltech-effectivity-module-1', 'repltech-steel-plate'}
	})
	repl_recipe({
		repltype='module',
		tier=4,
		item='productivity-module-2',
		time=module_2_cost,
		upgrade=true,
		prerequisites={'productivity-module-2', 'repltech-productivity-module-1', 'repltech-steel-plate'}
	})
	repl_recipe({
		repltype='module',
		tier=4,
		item='speed-module-3',
		time=module_2_cost,
		upgrade=true,
		prerequisites={'speed-module-3', 'repltech-speed-module-2', circuit_2_repltech}
	})
	repl_recipe({
		repltype='module',
		tier=4,
		item='effectivity-module-3',
		time=module_2_cost,
		upgrade=true,
		prerequisites={'effectivity-module-3', 'repltech-effectivity-module-2', circuit_2_repltech}
	})
	repl_recipe({
		repltype='module',
		tier=4,
		item='productivity-module-3',
		time=module_2_cost,
		upgrade=true,
		prerequisites={'productivity-module-3', 'repltech-productivity-module-2', circuit_2_repltech}
	})
else
	-- Vanilla modules (if neither Bob's Modules nor DyTech Modules are enabled)
	module_1_cost = circuit_1_cost * 5 + circuit_2_cost * 5
	module_2_cost = module_1_cost * 4 + circuit_2_cost * 5 + circuit_3_cost * 5
	module_3_cost = module_2_cost * 4 + circuit_2_cost * 5 + circuit_3_cost * 5 + alien_cost
	repl_recipe({
		name='speed-module-1',
		itemName='speed-module-1',
		repltype='module',
		tier=4,
		item='speed-module',
		time=module_1_cost,
		upgrade=true,
		prerequisites={'speed-module', circuit_1_repltech, circuit_2_repltech}
	})
	repl_recipe({
		repltype='module',
		tier=5,
		item='speed-module-2',
		time=module_2_cost,
		upgrade=true,
		prerequisites={'speed-module-2', 'repltech-speed-module-1', circuit_3_repltech}
	})
	repl_recipe({
		repltype='module',
		tier=5,
		item='speed-module-3',
		time=module_3_cost,
		upgrade=true,
		prerequisites={'speed-module-3', 'repltech-speed-module-2', 'repltech-alien-artifact'}
	})
	repl_recipe({
		name='effectivity-module-1',
		itemName='effectivity-module-1',
		repltype='module',
		tier=4,
		item='effectivity-module',
		time=module_1_cost,
		upgrade=true,
		prerequisites={'effectivity-module', circuit_1_repltech, circuit_2_repltech}
	})
	repl_recipe({
		repltype='module',
		tier=5,
		item='effectivity-module-2',
		time=module_2_cost,
		upgrade=true,
		prerequisites={'effectivity-module-2', 'repltech-effectivity-module-1', circuit_3_repltech}
	})
	repl_recipe({
		repltype='module',
		tier=5,
		item='effectivity-module-3',
		time=module_3_cost,
		upgrade=true,
		prerequisites={'effectivity-module-3', 'repltech-effectivity-module-2', 'repltech-alien-artifact'}
	})
	repl_recipe({
		name='productivity-module-1',
		itemName='productivity-module-1',
		repltype='module',
		tier=4,
		item='productivity-module',
		time=module_1_cost,
		upgrade=true,
		prerequisites={'productivity-module', circuit_1_repltech, circuit_2_repltech}
	})
	repl_recipe({
		repltype='module',
		tier=5,
		item='productivity-module-2',
		time=module_2_cost,
		upgrade=true,
		prerequisites={'productivity-module-2', 'repltech-productivity-module-1', circuit_3_repltech}
	})
	repl_recipe({
		repltype='module',
		tier=5,
		item='productivity-module-3',
		time=module_3_cost,
		upgrade=true,
		prerequisites={'productivity-module-3', 'repltech-productivity-module-2', 'repltech-alien-artifact'}
	})
end

-- Things which require modules
repl_recipe({
	repltype='device5',
	item='destroyer-capsule',
	time=(((steel_cost + plate_cost * 5 + circuit_1_cost * 2 + gear_cost * 3) * 4 + circuit_2_cost * 3) * 4 + module_1_cost),
	prerequisites={'combat-robotics-3', 'repltech-bob-speed-module-1', 'repltech-speed-module-1', 'repltech-iron-gear-wheel', circuit_2_repltech}
})
