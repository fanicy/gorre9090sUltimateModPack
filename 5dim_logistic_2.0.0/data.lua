require("config")

if dimoresenable == true then
--Changes
require("prototypes.ores.changes")
--Roboport
require("prototypes.ores.roboport")
--Logistic robot
require("prototypes.ores.robot-cons")
--Construction robot
require("prototypes.ores.robot-logic")
--Chest
require("prototypes.ores.passive")
require("prototypes.ores.active")
require("prototypes.ores.requester")
require("prototypes.ores.storage")
--Technology
require("prototypes.ores.tech")
else
--Changes
require("prototypes.normal.changes")
--Roboport
require("prototypes.normal.roboport")
--Logistic robot
require("prototypes.normal.robot-cons")
--Construction robot
require("prototypes.normal.robot-logic")
--Chest
require("prototypes.normal.passive")
require("prototypes.normal.active")
require("prototypes.normal.requester")
require("prototypes.normal.storage")
--Technology
require("prototypes.normal.tech")
end