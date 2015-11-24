local base_speed = 1
local base_power = 400
local base_pollution = 1 / base_power

local speed_factor = 2
local power_factor = 2.5
local pollution_factor = 0.7

function replicatorpipepictures()
	return {
		north =
		{
			filename = "__dark-matter-replicators__/graphics/entity/replicators/pipe-north.png",
			priority = "extra-high",
			width = 41,
			height = 40,
			shift = {0.125, -0.1}
		},
		east =
		{
			filename = "__dark-matter-replicators__/graphics/entity/replicators/pipe-east.png",
			priority = "extra-high",
			width = 41,
			height = 40,
			shift = {-0.4, 0.15}
		},
		south =
		{
			filename = "__dark-matter-replicators__/graphics/entity/replicators/pipe-south.png",
			priority = "extra-high",
			width = 41,
			height = 40,
			shift = {-0.05, -0.75}
		},
		west =
		{
			filename = "__dark-matter-replicators__/graphics/entity/replicators/pipe-west.png",
			priority = "extra-high",
			width = 41,
			height = 40,
			shift = {0.45, -0.175}
		}
	}
end

function make_replicator(tier, ingredients)
	--Create the list of recipe categories that this replicator can replicate
	local categories = {}
	for repTier=1,tier do
		categories[#categories+1] = 'replication-' .. repTier
	end
	
	--Add the previous tier of replicator as a requried ingredient
	if tier > 1 then
		ingredients[#ingredients + 1] = {'replicator-'..(tier-1), 1}
	end
	
	--I don't really know, this part comes entirely from jamupsi before he abandoned the mod and I never needed to change it.
	data:extend({
		{
			type = "recipe",
			name = "replicator-"..tier,
			enabled = "false",
			ingredients = ingredients,
			result = "replicator-"..tier,
			subgroup = "replicators",
			order = "b"..tier,
		},
		{
			type = "item",
			name = "replicator-"..tier,
			icon = "__dark-matter-replicators__/graphics/icons/replicator-"..tier..".png",
			flags = {"goes-to-quickbar"},
			subgroup = "production-machine",
			order = "b"..tier,
			place_result = "replicator-"..tier,
			stack_size = 50
		},
		
		{
			type = "assembling-machine",
			name = "replicator-"..tier,
			icon = "__dark-matter-replicators__/graphics/icons/replicator-"..tier..".png",
			flags = {"placeable-neutral", "placeable-player", "player-creation"},
			minable = {hardness = 0.2, mining_time = 0.5, result = "replicator-"..tier},
			max_health = 200,
			corpse = "big-remnants",
			dying_explosion = "big-explosion",
			resistances = {
				{
					type = "fire",
					percent = 70
				}
			},
			fluid_boxes = {
				{
					base_area = 10,
					base_level = 1,
					production_type = "output",
					pipe_picture = replicatorpipepictures(),
					pipe_covers = pipecoverspictures(),
					pipe_connections =
					{
						{ position = {0.575, 1.15} }
					},
				},
				off_when_no_fluid_recipe = true
			},
			
			collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
			selection_box = {{-1.0, -1.0}, {1.0, 1.0}},
			light = {intensity = 1.00, size = 8},
			
			
			fast_replaceable_group = "replicator",
			animation =
			{
				filename = "__dark-matter-replicators__/graphics/entity/replicators/replicator-"..tier..".png",
				priority="high",
				width = 113,
				height = 91,
				frame_count = 33,
				line_length = 11,
				animation_speed = 1/3,
				shift = {0.2, 0.15},
				scale = 0.66
			},
			crafting_categories = categories,
			crafting_speed = base_speed * speed_factor^(tier-1),
			energy_source =
			{
				type = "electric",
				usage_priority = "secondary-input",
				emissions = base_pollution * pollution_factor^(tier-1),
			},
			energy_usage = (base_power * power_factor^(tier-1)) .. "kW",
			ingredient_count = -0,
			module_specification =
			{
				module_slots = math.floor(tier / 2) + 1
			},
			allowed_effects = {"consumption", "speed", "productivity", "pollution"},
			open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
			close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
			working_sound = {
				sound = {
					{
					filename = "__base__/sound/lab.ogg",
					volume = 0.7
					},
				},
				idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
				apparent_volume = 1.5,
			}
		}
	})
end

make_replicator(1, {
	{"iron-plate", 4},
	{"electronic-circuit", 1},
	{"dark-matter-scoop", 4},
})
make_replicator(2, {
	{"electronic-circuit", 2},
	{"dark-matter-transducer", 2},
})
make_replicator(3, {
	{"advanced-circuit", 1},
	{"dark-matter-transducer", 4},
})
make_replicator(4, {
	{"advanced-circuit", 2},
	{"matter-conduit", 2},
})
make_replicator(5, {
	{"processing-unit", 1},
	{"matter-conduit", 4},
})
