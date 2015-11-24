data:extend(
{
  ---------------------------------------------------------
  -- the electric boiler
  --  - based on demo.item["boiler"]
  ---------------------------------------------------------
  {
    type = "item",
    name = "ldEB-electric-boiler",
    icon = "__LongElectricBoiler__/graphics/icons/electric-boiler.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy",
    order = "b[steam-power]-a[ldEB-electric-boiler]",
    place_result = "ldEB-electric-boiler",
    stack_size = 50
  }

})
