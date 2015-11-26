require("config")

if dimoresenable == true then
--Changes
require("prototypes.ores.changes")
--Electric-pole
require("prototypes.ores.electric-pole")
--Rails
require("prototypes.ores.rails-water")
require("prototypes.ores.rails-curve-water")
require("prototypes.ores.rails-energy")
require("prototypes.ores.rails-curve-energy")
require("prototypes.ores.rails-energy-water")
require("prototypes.ores.rails-curve-energy-water")
--Accumulator
require("prototypes.ores.accumulator")
--Locomotive
require("prototypes.ores.locomotive")
--Gun wagon
require("prototypes.ores.gun-wagon")
--Laser wagon
require("prototypes.ores.laser-wagon")
--Roboport
require("prototypes.ores.roboport")
--Active
require("prototypes.ores.active")
--Pasive
require("prototypes.ores.passive")
--Requester
require("prototypes.ores.requester")
--Storage
require("prototypes.ores.storage")
--Tech
require("prototypes.ores.tech")
else
--Changes
require("prototypes.normal.changes")
--Electric-pole
require("prototypes.normal.electric-pole")
--Rails
require("prototypes.normal.rails-water")
require("prototypes.normal.rails-curve-water")
require("prototypes.normal.rails-energy")
require("prototypes.normal.rails-curve-energy")
require("prototypes.normal.rails-energy-water")
require("prototypes.normal.rails-curve-energy-water")
--Accumulator
require("prototypes.normal.accumulator")
--Locomotive
require("prototypes.normal.locomotive")
--Gun wagon
require("prototypes.normal.gun-wagon")
--Laser wagon
require("prototypes.normal.laser-wagon")
--Roboport
require("prototypes.normal.roboport")
--Active
require("prototypes.normal.active")
--Pasive
require("prototypes.normal.passive")
--Requester
require("prototypes.normal.requester")
--Storage
require("prototypes.normal.storage")
--Tech
require("prototypes.normal.tech")
end