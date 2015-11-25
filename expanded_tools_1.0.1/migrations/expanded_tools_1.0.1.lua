game.reload_script()

for i, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipes = force.recipes

    if technologies['engine'].researched then
        recipes['jackhammer'].enabled = true
    end

    if technologies['laser'].researched then
        recipes['laser-drill'].enabled = true
    end

    if technologies['alien-technology'].researched then
        recipes['atomic-disassembler'].enabled = true
    end
end
