game.regenerate_entity("alien-artifacts")

for i, player in ipairs(game.players) do
  player.print("Added alien-artifacts to the map.")
end