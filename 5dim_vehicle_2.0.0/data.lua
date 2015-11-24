require("config")

if dimoresenable == true then
--Changes
require("prototypes.ores.changes")
--Air plane
require("prototypes.ores.air-plane")
--Boat
require("prototypes.ores.boat")
--Truck
require("prototypes.ores.truck")
--Tech
require("prototypes.ores.tech")
else
--Changes
require("prototypes.normal.changes")
--Air plane
require("prototypes.normal.air-plane")
--Boat
require("prototypes.normal.boat")
--Truck
require("prototypes.normal.truck")
--Tech
require("prototypes.normal.tech")
end