
if data.raw["item-group"]["cursed-noshow"] == nil then
	local obj = util.table.deepcopy(data.raw["item-group"]["other"])
	obj.name = "cursed-noshow"
	obj.icon = "__Cursed-PI__/graphics/icons/group/group.png"
	data.raw[obj.type][obj.name] = obj
end

local obj = util.table.deepcopy(data.raw["item-subgroup"]["other"])
obj.name = "cursed-noshow-inserter"
obj.group = "cursed-noshow"
obj.order = "5"
data.raw[obj.type][obj.name] = obj

-- function addIconsButtons_hand(name,icon)
	-- data.raw["gui-style"]["default"]["cursed-PI-" .. name] =
	-- {
		-- type = "checkbox_style",
		-- font = "default",
		-- font_color = {r=1, g=1, b=1},
		-- width = 34,
		-- height = 34,
		-- default_background =
		-- {
			-- filename = "__Cursed-PI__/graphics/icons/gui/gui1.png",
			-- --priority = "extra-high-no-scale",
			-- width = 32,
			-- height = 32,
		-- },
		-- hovered_background =
		-- {
			-- filename = "__Cursed-PI__/graphics/icons/gui/gui1.png",
			-- --priority = "extra-high-no-scale",
			-- width = 32,
			-- height = 32
		-- },
		-- clicked_background =
		-- {
			-- filename = "__Cursed-PI__/graphics/icons/gui/gui1.png",
			-- --priority = "extra-high-no-scale",
			-- width = 32,
			-- height = 32
		-- },
		-- checked =
		-- {
			-- filename = icon,
			-- --priority = "extra-high-no-scale",
			-- width = 32,
			-- height = 32
		-- }
	-- }
-- end

-- function addIconsButtons_base(prototype)
	-- data.raw["gui-style"]["default"]["cursed-PI-" .. prototype.name .. "_base"] =
	-- {
		-- type = "checkbox_style",
		-- font = "default",
		-- font_color = {r=1, g=1, b=1},
		-- width = 34,
		-- height = 34,
		-- default_background =
		-- {
			-- filename = prototype.icon,
			-- --priority = "extra-high-no-scale",
			-- width = 32,
			-- height = 32,
		-- },
		-- hovered_background =
		-- {
			-- filename = prototype.icon,
			-- --priority = "extra-high-no-scale",
			-- width = 32,
			-- height = 32
		-- },
		-- clicked_background =
		-- {
			-- filename = prototype.icon,
			-- --priority = "extra-high-no-scale",
			-- width = 32,
			-- height = 32
		-- },
		-- checked =
		-- {
			-- filename = prototype.icon,
			-- --priority = "extra-high-no-scale",
			-- width = 32,
			-- height = 32
		-- }
	-- }
-- end

	-- data.raw["gui-style"]["default"]["cursed-PI-frame"] =
	-- {
		-- type = "checkbox_style",
		-- font = "default",
		-- font_color = {r=1, g=1, b=1},
		-- width = 34,
		-- height = 34,
		-- default_background =
		-- {
			-- filename = "__Cursed-PI__/graphics/icons/gui/gui3.png",
			-- --priority = "extra-high-no-scale",
			-- width = 32,
			-- height = 32,
		-- },
		-- hovered_background =
		-- {
			-- filename = "__Cursed-PI__/graphics/icons/gui/gui3.png",
			-- --priority = "extra-high-no-scale",
			-- width = 32,
			-- height = 32
		-- },
		-- clicked_background =
		-- {
			-- filename = "__Cursed-PI__/graphics/icons/gui/gui3.png",
			-- --priority = "extra-high-no-scale",
			-- width = 32,
			-- height = 32
		-- },
		-- checked =
		-- {
			-- filename = "__Cursed-PI__/graphics/icons/gui/gui3.png",
			-- --priority = "extra-high-no-scale",
			-- width = 32,
			-- height = 32
		-- }
	-- }

-- function addIconsButtons_base(prototype)
	-- data.raw["gui-style"]["default"]["cursed-PI-" .. prototype.name .. "_base"] =
	-- {
		-- type = "frame_style",
		-- font = "default-bold",
		-- width = 32,
		-- height = 32,
		-- title_top_padding = 0,
		-- title_left_padding = 0,
		-- title_bottom_padding = 0,
		-- title_right_padding = 0,
		-- top_padding  = 0,
		-- right_padding = 0,
		-- bottom_padding = 0,
		-- left_padding = 0,
		-- flow_style=
		-- {
			-- horizontal_spacing = 0,
			-- vertical_spacing = 0
		-- },
		-- graphical_set =
		-- {
			-- type = "monolith",
			-- top_monolith_border = 0,
			-- right_monolith_border = 0,
			-- bottom_monolith_border = 0,
			-- left_monolith_border = 0,
			-- monolith_image =
			-- {
				-- filename = prototype.icon,
				-- -- priority = "extra-high-no-scale",
				-- width = 32,
				-- height = 32
			-- }
		-- }
	-- }
-- end

-- data.raw["gui-style"]["default"]["cursed-PI-frame"] =
-- {
	-- type = "frame_style",
	-- --parent = "frame_style",
	-- font = "default-bold",
	-- width = 32,
	-- height = 32,
	-- title_top_padding = 0,
	-- title_left_padding = 0,
	-- title_bottom_padding = 0,
	-- title_right_padding = 0,
	-- top_padding  = 0,
	-- right_padding = 0,
	-- bottom_padding = 0,
	-- left_padding = 0,
	-- flow_style=
	-- {
		-- horizontal_spacing = 0,
		-- vertical_spacing = 0
	-- },
	-- graphical_set =
	-- {
		-- type = "monolith",
		-- top_monolith_border = 0,
		-- right_monolith_border = 0,
		-- bottom_monolith_border = 0,
		-- left_monolith_border = 0,
		-- monolith_image =
		-- {
			-- filename = "__Cursed-PI__/graphics/icons/gui/gui2.png",
			-- -- priority = "extra-high-no-scale",
			-- width = 32,
			-- height = 32
		-- }
	-- }
-- }
-- data.raw["gui-style"]["default"]["cursed-PI-table"] =
-- {
	-- type = "table_style",
	-- horizontal_spacing = 2,
	-- vertical_spacing = 2
-- }


		--[equipment]--
require("prototypes.entities.cursed-pi")
require("prototypes.entities.cursed-pa")

		--[Items]--
require("prototypes.items.cursed-pi")
require("prototypes.items.cursed-pa")

		--[Recipes]--
require("prototypes.recipes.cursed-pi")
require("prototypes.recipes.cursed-pa")

		--[Technologies]--
require("prototypes.technology.cursed-pi")

		--[styles]--
require("prototypes.styles")

function cursedPI_addInserter(name,baseRecipe,baseItem,baseEntity,icon,ingredients,ingMult,energy,energyMult,distIn,distOut,othersRecipe,othersItem,othersEntity)
	cursedPI_addEntity(baseEntity,name,icon,name,energy,energyMult,distIn,distOut,othersEntity)
	cursedPI_addItem(baseItem,name,icon,name,othersItem)
	cursedPI_addRecipe(baseRecipe,name,icon,ingredients,ingMult,othersRecipe)
end

cursedPI_addInserter("cursed-burner-inserter","burner-inserter","burner-inserter","burner-inserter","__Cursed-PI__/graphics/icons/burner-inserter/cursed-burner-inserter.png",nil,3,nil,3,1,1,{enabled = false})
cursedPI_addInserter("cursed-basic-inserter","basic-inserter","basic-inserter","basic-inserter","__Cursed-PI__/graphics/icons/basic-inserter/cursed-basic-inserter.png",nil,3,nil,3,1,1,{enabled = false})
cursedPI_addInserter("cursed-long-handed-inserter","long-handed-inserter","long-handed-inserter","long-handed-inserter","__Cursed-PI__/graphics/icons/long-handed-inserter/cursed-long-handed-inserter.png",nil,3,nil,3,2,2,{enabled = false})
cursedPI_addInserter("cursed-smart-inserter","smart-inserter","smart-inserter","smart-inserter","__Cursed-PI__/graphics/icons/smart-inserter/cursed-smart-inserter.png",nil,3,nil,3,1,1,{enabled = false})
cursedPI_addInserter("cursed-fast-inserter","fast-inserter","fast-inserter","fast-inserter","__Cursed-PI__/graphics/icons/fast-inserter/cursed-fast-inserter.png",nil,3,nil,3,1,1,{enabled = false})

-- addIconsButtons_base(data.raw["item"]["cursed-burner-inserter"])
-- addIconsButtons_base(data.raw["item"]["cursed-basic-inserter"])
-- addIconsButtons_base(data.raw["item"]["cursed-long-handed-inserter"])
-- addIconsButtons_base(data.raw["item"]["cursed-smart-inserter"])
-- addIconsButtons_base(data.raw["item"]["cursed-fast-inserter"])

-- addIconsButtons_hand("cursed-burner-inserter_hand","__Cursed-PI__/graphics/icons/burner-inserter/cursed-burner-inserter_hand.png")
-- addIconsButtons_hand("cursed-basic-inserter_hand","__Cursed-PI__/graphics/icons/basic-inserter/cursed-basic-inserter_hand.png")
-- addIconsButtons_hand("cursed-long-handed-inserter_hand","__Cursed-PI__/graphics/icons/long-handed-inserter/cursed-long-handed-inserter_hand.png")
-- addIconsButtons_hand("cursed-smart-inserter_hand","__Cursed-PI__/graphics/icons/smart-inserter/cursed-smart-inserter_hand.png")
-- addIconsButtons_hand("cursed-fast-inserter_hand","__Cursed-PI__/graphics/icons/fast-inserter/cursed-fast-inserter_hand.png")
