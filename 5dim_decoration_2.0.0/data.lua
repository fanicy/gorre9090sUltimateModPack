require("config")

if dimoresenable == true then
--Entity
require("prototypes.ores.entity")
--Item
require("prototypes.ores.item")
--Recipe
require("prototypes.ores.recipe")
--Technologies
require("prototypes.ores.tech")
else
--Entity
require("prototypes.normal.entity")
--Item
require("prototypes.normal.item")
--Recipe
require("prototypes.normal.recipe")
--Technologies
require("prototypes.normal.tech")
end