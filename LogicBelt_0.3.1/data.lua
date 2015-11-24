require("prototypes.group")
---------------
--logic belts--
---------------
require("prototypes.belts.logic-belts.basic-logic-belt")
require("prototypes.belts.logic-belts.fast-logic-belt")
require("prototypes.belts.logic-belts.express-logic-belt")

require("prototypes.belts.logic-belt-lamp.logic-belt-lamp-on")
require("prototypes.belts.logic-belt-lamp.logic-belt-lamp-off")

require("prototypes.belts.logic-belt-ghost.logic-belt-ghost")


--Dytech belts
if data.raw.item["super-transport-belt"] then
	require("prototypes.belts.logic-belts.super-logic-belt")
end
if data.raw.item["extreme-transport-belt"] then
	require("prototypes.belts.logic-belts.extreme-logic-belt")
end

--Bob logistics belts
if data.raw.item["green-transport-belt"] then
	require("prototypes.belts.logic-belts.green-logic-belt")
end
if data.raw.item["purple-transport-belt"] then
	require("prototypes.belts.logic-belts.purple-logic-belt")
end


-----------------
--counter belts--
-----------------
require("prototypes.belts.counter-belts.basic-counter-belt")
require("prototypes.belts.counter-belts.fast-counter-belt")
require("prototypes.belts.counter-belts.express-counter-belt")

require("prototypes.belts.counter-belt-ghost.counter-belt-ghost")

require("prototypes.belts.counter-signal.counter-signal")

--Dytech belts
if data.raw.item["super-transport-belt"] then
	require("prototypes.belts.counter-belts.super-counter-belt")
end
if data.raw.item["extreme-transport-belt"] then
	require("prototypes.belts.counter-belts.extreme-counter-belt")
end

--Bob logistics belts
if data.raw.item["green-transport-belt"] then
	require("prototypes.belts.counter-belts.green-counter-belt")
end
if data.raw.item["purple-transport-belt"] then
	require("prototypes.belts.counter-belts.purple-counter-belt")
end


----------------
--logic signal--
----------------
require("prototypes.signals.logic-signal.logic-signal")
require("prototypes.signals.logic-signal.chain-logic-signal")
require("prototypes.signals.stop-sign.stop-sign")

require("prototypes.signals.logic-signal-ghost.logic-signal-ghost")

-----------------
--signal reader--
-----------------
require("prototypes.signals.signal-reader.signal-reader")
require("prototypes.signals.signal-reader.chain-signal-reader")

require("prototypes.signals.signal-reader-ghost.signal-reader-ghost")

require("prototypes.signals.signal-reader-state.signal-reader-state")


---------------
--valve pipes--
---------------
require("prototypes.pipes.valve-pipe.basic-valve-pipe")
require("prototypes.pipes.valve-pipe-ghost.valve-pipe-ghost")

----------------
--reader pipes--
----------------
require("prototypes.pipes.reader-pipe.basic-reader-pipe")
require("prototypes.pipes.reader-pipe-ghost.reader-pipe-ghost")

---------------------
--temperature pipes--
---------------------
require("prototypes.pipes.temperature-pipe.basic-temperature-pipe")
require("prototypes.pipes.temperature-pipe-ghost.temperature-pipe-ghost")
require("prototypes.pipes.temperature-signal.temperature-signal")

