
pipepictureswithcolour = function(colour, horizontal)
  local pictures = {
    straight_vertical_single =
    {
      filename = "__StraightPipes__/graphics/pipe_" .. colour .. "/" .. colour .. "_pipe-straight-vertical-single.png",
      priority = "extra-high",
      width = 44,
      height = 58
    },
    straight_vertical =
    {
      filename = "__StraightPipes__/graphics/pipe_" .. colour .. "/" .. colour .. "_pipe-straight-vertical.png",
      priority = "extra-high",
      width = 44,
      height = 42
    },
    straight_vertical_window =
    {
      filename = "__StraightPipes__/graphics/pipe_" .. colour .. "/" .. colour .. "_pipe-straight-vertical-window.png",
      priority = "extra-high",
      width = 44,
      height = 32
    },
    straight_horizontal_window =
    {
      filename = "__StraightPipes__/graphics/pipe_" .. colour .. "/" .. colour .. "_pipe-straight-horizontal-window.png",
      priority = "extra-high",
      width = 32,
      height = 42
    },
    straight_horizontal =
    {
      filename = "__StraightPipes__/graphics/pipe_" .. colour .. "/" .. colour .. "_pipe-straight-horizontal.png",
      priority = "extra-high",
      width = 32,
      height = 42
    },
    corner_up_right =
    {
      filename = "__StraightPipes__/graphics/pipe_" .. colour .. "/" .. colour .. "_pipe-corner-up-right.png",
      priority = "extra-high",
      width = 32,
      height = 40
    },
    corner_up_left =
    {
      filename = "__StraightPipes__/graphics/pipe_" .. colour .. "/" .. colour .. "_pipe-corner-up-left.png",
      priority = "extra-high",
      width = 44,
      height = 44
    },
    corner_down_right =
    {
      filename = "__StraightPipes__/graphics/pipe_" .. colour .. "/" .. colour .. "_pipe-corner-down-right.png",
      priority = "extra-high",
      width = 32,
      height = 32
    },
    corner_down_left =
    {
      filename = "__StraightPipes__/graphics/pipe_" .. colour .. "/" .. colour .. "_pipe-corner-down-left.png",
      priority = "extra-high",
      width = 36,
      height = 32
    },
    t_up =
    {
      filename = "__StraightPipes__/graphics/pipe_" .. colour .. "/" .. colour .. "_pipe-t-up.png",
      priority = "extra-high",
      width = 32,
      height = 42
    },
    t_down =
    {
      filename = "__StraightPipes__/graphics/pipe_" .. colour .. "/" .. colour .. "_pipe-t-down.png",
      priority = "extra-high",
      width = 40,
      height = 44
    },
    t_right =
    {
      filename = "__StraightPipes__/graphics/pipe_" .. colour .. "/" .. colour .. "_pipe-t-right.png",
      priority = "extra-high",
      width = 40,
      height = 32
    },
    t_left =
    {
      filename = "__StraightPipes__/graphics/pipe_" .. colour .. "/" .. colour .. "_pipe-t-left.png",
      priority = "extra-high",
      width = 44,
      height = 42
    },
    cross =
    {
      filename = "__StraightPipes__/graphics/pipe_" .. colour .. "/" .. colour .. "_pipe-cross.png",
      priority = "extra-high",
      width = 40,
      height = 40
    },
    ending_up =
    {
      filename = "__StraightPipes__/graphics/pipe_" .. colour .. "/" .. colour .. "_pipe-ending-up.png",
      priority = "extra-high",
      width = 44,
      height = 42
      },
    ending_down =
    {
      filename = "__StraightPipes__/graphics/pipe_" .. colour .. "/" .. colour .. "_pipe-ending-down.png",
      priority = "extra-high",
      width = 44,
      height = 32
    },
    ending_right =
    {
      filename = "__StraightPipes__/graphics/pipe_" .. colour .. "/" .. colour .. "_pipe-ending-right.png",
      priority = "extra-high",
      width = 32,
      height = 44
    },
    ending_left =
    {
      filename = "__StraightPipes__/graphics/pipe_" .. colour .. "/" .. colour .. "_pipe-ending-left.png",
      priority = "extra-high",
      width = 58,
      height = 44
    },
    horizontal_window_background =
    {
      filename = "__StraightPipes__/graphics/pipe_" .. colour .. "/" .. colour .. "_pipe-horizontal-window-background.png",
      priority = "extra-high",
      width = 32,
      height = 42
    },
    vertical_window_background =
    {
      filename = "__StraightPipes__/graphics/pipe_" .. colour .. "/" .. colour .. "_pipe-vertical-window-background.png",
      priority = "extra-high",
      width = 44,
      height = 32
    },
    fluid_background =
    {
      filename = "__StraightPipes__/graphics/base_pipe/fluid-background.png",
      priority = "extra-high",
      width = 32,
      height = 20
    },
    low_temperature_flow =
    {
      filename = "__StraightPipes__/graphics/base_pipe/fluid-flow-low-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    middle_temperature_flow =
    {
      filename = "__StraightPipes__/graphics/base_pipe/fluid-flow-medium-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    high_temperature_flow =
    {
      filename = "__StraightPipes__/graphics/base_pipe/fluid-flow-high-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    }
  }
  
  if horizontal then
	pictures["straight_vertical_single"] =
    {
      filename = "__StraightPipes__/graphics/pipe_" .. colour .. "/" .. colour .. "_pipe-straight-horizontal-single.png",
      priority = "extra-high",
      width = 58,
      height = 44
    }
  end
  return pictures
end

pipenewpicturesstraight = function(horizontal)
  local pictures = {
    straight_vertical_single =
    {
      filename = "__StraightPipes__/graphics/pipe_new/pipe-straight-vertical-single.png",
      priority = "extra-high",
      width = 44,
      height = 58
    },
    straight_vertical =
    {
      filename = "__StraightPipes__/graphics/pipe_new/pipe-straight-vertical.png",
      priority = "extra-high",
      width = 44,
      height = 42
    },
    straight_vertical_window =
    {
      filename = "__StraightPipes__/graphics/pipe_new/pipe-straight-vertical-window.png",
      priority = "extra-high",
      width = 44,
      height = 32
    },
    straight_horizontal_window =
    {
      filename = "__StraightPipes__/graphics/pipe_new/pipe-straight-horizontal-window.png",
      priority = "extra-high",
      width = 32,
      height = 42
    },
    straight_horizontal =
    {
      filename = "__StraightPipes__/graphics/pipe_new/pipe-straight-horizontal.png",
      priority = "extra-high",
      width = 32,
      height = 42
    },
    corner_up_right =
    {
      filename = "__StraightPipes__/graphics/pipe_new/pipe-corner-up-right.png",
      priority = "extra-high",
      width = 32,
      height = 40
    },
    corner_up_left =
    {
      filename = "__StraightPipes__/graphics/pipe_new/pipe-corner-up-left.png",
      priority = "extra-high",
      width = 44,
      height = 44
    },
    corner_down_right =
    {
      filename = "__StraightPipes__/graphics/pipe_new/pipe-corner-down-right.png",
      priority = "extra-high",
      width = 32,
      height = 32
    },
    corner_down_left =
    {
      filename = "__StraightPipes__/graphics/pipe_new/pipe-corner-down-left.png",
      priority = "extra-high",
      width = 36,
      height = 32
    },
    t_up =
    {
      filename = "__StraightPipes__/graphics/pipe_new/pipe-t-up.png",
      priority = "extra-high",
      width = 32,
      height = 42
    },
    t_down =
    {
      filename = "__StraightPipes__/graphics/pipe_new/pipe-t-down.png",
      priority = "extra-high",
      width = 40,
      height = 44
    },
    t_right =
    {
      filename = "__StraightPipes__/graphics/pipe_new/pipe-t-right.png",
      priority = "extra-high",
      width = 40,
      height = 32
    },
    t_left =
    {
      filename = "__StraightPipes__/graphics/pipe_new/pipe-t-left.png",
      priority = "extra-high",
      width = 44,
      height = 42
    },
    cross =
    {
      filename = "__StraightPipes__/graphics/pipe_new/pipe-cross.png",
      priority = "extra-high",
      width = 40,
      height = 40
    },
    ending_up =
    {
      filename = "__StraightPipes__/graphics/pipe_new/pipe-ending-up.png",
      priority = "extra-high",
      width = 44,
      height = 42
      },
    ending_down =
    {
      filename = "__StraightPipes__/graphics/pipe_new/pipe-ending-down.png",
      priority = "extra-high",
      width = 44,
      height = 32
    },
    ending_right =
    {
      filename = "__StraightPipes__/graphics/pipe_new/pipe-ending-right.png",
      priority = "extra-high",
      width = 32,
      height = 44
    },
    ending_left =
    {
      filename = "__StraightPipes__/graphics/pipe_new/pipe-ending-left.png",
      priority = "extra-high",
      width = 58,
      height = 44
    },
    horizontal_window_background =
    {
      filename = "__StraightPipes__/graphics/pipe_new/pipe-horizontal-window-background.png",
      priority = "extra-high",
      width = 32,
      height = 42
    },
    vertical_window_background =
    {
      filename = "__StraightPipes__/graphics/pipe_new/pipe-vertical-window-background.png",
      priority = "extra-high",
      width = 44,
      height = 32
    },
    fluid_background =
    {
      filename = "__StraightPipes__/graphics/base_pipe/fluid-background.png",
      priority = "extra-high",
      width = 32,
      height = 20
    },
    low_temperature_flow =
    {
      filename = "__StraightPipes__/graphics/base_pipe/fluid-flow-low-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    middle_temperature_flow =
    {
      filename = "__StraightPipes__/graphics/base_pipe/fluid-flow-medium-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    },
    high_temperature_flow =
    {
      filename = "__StraightPipes__/graphics/base_pipe/fluid-flow-high-temperature.png",
      priority = "extra-high",
      width = 160,
      height = 18
    }
  }
  
  if horizontal~= nil and horizontal then
	pictures["straight_vertical_single"] =
    {
      filename = "__StraightPipes__/graphics/pipe_new/pipe-straight-horizontal-single.png",
      priority = "extra-high",
      width = 58,
      height = 44
    }
  end
  return pictures
end