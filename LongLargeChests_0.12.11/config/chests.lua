---------------------------------------------------------
-- list of chests
--  - { width, height }
---------------------------------------------------------
ldLC_chest_dimentions = { {2, 2}, {3, 3}, {5, 5} };

function ldLC_make_chest_name(chest_width, chest_height)
  return  "ldLC-chest-" .. chest_width .. "x" .. chest_height;
end
