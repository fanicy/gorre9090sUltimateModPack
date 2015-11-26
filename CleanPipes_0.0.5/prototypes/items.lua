function PipeItem(_NSEW, _Sorting)
	pipe = {
		type = "item",
		name = "cleanpipe-" .. _NSEW,
		icon = "__base__/graphics/icons/pipe.png",
		flags = {"goes-to-quickbar"},
		group = "clean-pipes",
		subgroup = "clean-pipes",
		order = "a[pipe]-" .. _Sorting .. "[cleanpipe-" .. _NSEW .. "]",
--		order = "a[cleanpipe-" .. _NSEW .. "]",
		place_result = "cleanpipe-" .. _NSEW,
		stack_size = 50
	}
	return pipe
end

data:extend(
{
	{
		type = "item",
		name = "cleanpipe-p",
		icon = "__CleanPipes__/graphics/cleanpipe-p-icon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "energy-pipe-distribution",
		order = "a[pipe]-c[cleanpipe-p]",
--		order = "a[cleanpipe-" .. _NSEW .. "]",
		place_result = "cleanpipe-p",
		stack_size = 50
	},
	{
		type = "item",
		name = "cleanpipe-p2",
		icon = "__CleanPipes__/graphics/cleanpipe-p2-icon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "energy-pipe-distribution",
		order = "a[pipe]-d[cleanpipe-p2]",
--		order = "a[cleanpipe-" .. _NSEW .. "]",
		place_result = "cleanpipe-p2",
		stack_size = 50
	},
	PipeItem("n", "e"),
	PipeItem("s", "e"),
	PipeItem("e", "e"),
	PipeItem("w", "e"),
	PipeItem("ns", "e"),
	PipeItem("ew", "e"),
	PipeItem("ne", "e"),
	PipeItem("nw", "e"),
	PipeItem("se", "e"),
	PipeItem("sw", "e"),
	PipeItem("nse", "e"),
	PipeItem("nsw", "e"),
	PipeItem("new", "e"),
	PipeItem("sew", "e"),
	PipeItem("nsew", "e"),
	PipeItem("2n", "e2"),
	PipeItem("2s", "e2"),
	PipeItem("2e", "e2"),
	PipeItem("2w", "e2"),
	PipeItem("2ns", "e2"),
	PipeItem("2ew", "e2"),
	PipeItem("2ne", "e2"),
	PipeItem("2nw", "e2"),
	PipeItem("2se", "e2"),
	PipeItem("2sw", "e2"),
	PipeItem("2nse", "e2"),
	PipeItem("2nsw", "e2"),
	PipeItem("2new", "e2"),
	PipeItem("2sew", "e2"),
	PipeItem("2nsew", "e2")
})