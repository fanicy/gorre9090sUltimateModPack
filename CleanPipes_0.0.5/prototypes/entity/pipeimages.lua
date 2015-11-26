local function PipeImage(_Name, _W, _H)
	local img = {
		filename = "__base__/graphics/entity/pipe/" .. _Name,
		priority = "extra-high",
		width = _W,
		height = _H
	}
	return img
end

function PipeImages(_NSEW)
	local images = {
		straight_vertical_single = 		PipeImage("pipe-straight-vertical-single.png", 44, 58),
		straight_vertical = 			PipeImage("pipe-straight-vertical.png", 44, 42),
		straight_vertical_window = 		PipeImage("pipe-straight-vertical-window.png", 44, 32),
		straight_horizontal_window = 	PipeImage("pipe-straight-horizontal-window.png", 32, 42),
		straight_horizontal = 			PipeImage("pipe-straight-horizontal.png", 32, 42),
		corner_up_right = 				PipeImage("pipe-corner-up-right.png", 32, 40),
		corner_up_left = 				PipeImage("pipe-corner-up-left.png", 44, 44),
		corner_down_right = 			PipeImage("pipe-corner-down-right.png", 32, 32),
		corner_down_left = 				PipeImage("pipe-corner-down-left.png", 36, 32),
		t_up = 							PipeImage("pipe-t-up.png", 32, 42),
		t_down = 						PipeImage("pipe-t-down.png", 40, 44),
		t_right = 						PipeImage("pipe-t-right.png", 40, 32),
		t_left = 						PipeImage("pipe-t-left.png", 44, 42),
		cross = 						PipeImage("pipe-cross.png", 40, 40),
		ending_up = 					PipeImage("pipe-ending-up.png", 44, 42),
		ending_down = 					PipeImage("pipe-ending-down.png", 44, 32),
		ending_right = 					PipeImage("pipe-ending-right.png", 32, 44),
		ending_left = 					PipeImage("pipe-ending-left.png", 58, 44),
		horizontal_window_background = 	PipeImage("pipe-horizontal-window-background.png", 32, 42),
		vertical_window_background = 	PipeImage("pipe-vertical-window-background.png", 44, 32),
		fluid_background = 				PipeImage("fluid-background.png", 32, 20),
		low_temperature_flow = 			PipeImage("fluid-flow-low-temperature.png", 160, 18),
		middle_temperature_flow = 		PipeImage("fluid-flow-medium-temperature.png", 160, 18),
		high_temperature_flow = 		PipeImage("fluid-flow-high-temperature.png", 160, 18),
	}
	if _NSEW == "e" or _NSEW == "w" then
		images["straight_vertical_single"] = PipeImage("pipe-straight-horizontal-single.png", 58, 46)
	end
	return images
end