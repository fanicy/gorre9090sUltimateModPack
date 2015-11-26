data:extend(
	{
		{
			type = "recipe",
			name = "cleanpipe-p",
			ingredients = {{"pipe", 1}},
			result = "cleanpipe-p",
			enabled = "true"
		},
		{
			type = "recipe",
			name = "cleanpipe-p2",
			ingredients = {{"pipe", 1}},
			result = "cleanpipe-p2",
			enabled = "true"
		},
	}
)

function pipeRecipe(_NSEW, _twoSided)
	local cost = "cleanpipe-p"
	
	if _twoSided then
		cost = cost .. "2"
	end
	
	return {
		type = "recipe",
		name = "cleanpipe-" .. _NSEW,
		ingredients = {{cost, 1}},
		result = "cleanpipe-" .. _NSEW,
		enabled = "true"
	}
end

data:extend(
	{
		{
			type = "item-group",
			name = "clean-pipes",
			order = "x-z",
			inventory_order = "z",
			icon = "__base__/graphics/technology/fluid-handling.png",
		},
		{
			type = "item-subgroup",
			name = "clean-pipes",
			group = "clean-pipes",
			order = "z"
		}
	}
)

data:extend(
	{
		pipeRecipe("n"),
		pipeRecipe("s"),
		pipeRecipe("e"),
		pipeRecipe("w"),
		pipeRecipe("ns"),
		pipeRecipe("ew"),
		pipeRecipe("ne"),
		pipeRecipe("nw"),
		pipeRecipe("se"),
		pipeRecipe("sw"),
		pipeRecipe("nse"),
		pipeRecipe("nsw"),
		pipeRecipe("new"),
		pipeRecipe("sew"),
		pipeRecipe("nsew"),
		pipeRecipe("2n", true),
		pipeRecipe("2s", true),
		pipeRecipe("2e", true),
		pipeRecipe("2w", true),
		pipeRecipe("2ns", true),
		pipeRecipe("2ew", true),
		pipeRecipe("2ne", true),
		pipeRecipe("2nw", true),
		pipeRecipe("2se", true),
		pipeRecipe("2sw", true),
		pipeRecipe("2nse", true),
		pipeRecipe("2nsw", true),
		pipeRecipe("2new", true),
		pipeRecipe("2sew", true),
		pipeRecipe("2nsew", true)
	}
)


