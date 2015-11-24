function get_tier(tier)
    local iron_axe = {
        damage = data.raw['mining-tool']['iron-axe'].action.action_delivery.target_effects.damage.amount,
        durability = data.raw['mining-tool']['iron-axe'].durability,
        order = 'a',
        speed = data.raw['mining-tool']['iron-axe'].speed
    }

    local steel_axe = {
        damage = data.raw['mining-tool']['steel-axe'].action.action_delivery.target_effects.damage.amount,
        durability = data.raw['mining-tool']['steel-axe'].durability,
        order = 'b',
        speed = data.raw['mining-tool']['steel-axe'].speed
    }

    local ratios = {
        damage = steel_axe.damage / iron_axe.damage,
        durability = steel_axe.durability - iron_axe.durability,
        speed = steel_axe.speed / iron_axe.speed
    }

    if tier <= 0 then
        return iron_axe
    elseif tier == 1 then
        return steel_axe
    else
        return {
            damage = math.floor(iron_axe.damage * math.pow(ratios.damage, tier)),
            durability = math.floor(iron_axe.durability + ratios.durability * tier),
            order = string.char(iron_axe.order:byte(1) + tier),
            speed = math.floor(iron_axe.speed * math.pow(ratios.speed, tier))
        }
    end
end

function tool(name, tier, damage_type)
    tier = get_tier(tier)
    return {
        type = 'mining-tool',
        name = name,
        icon = '__expanded_tools__/tools/' .. name .. '/icon.png',
        flags = { 'goes-to-main-inventory' },
        action = {
            type = 'direct',
            action_delivery = {
                type = 'instant',
                target_effects = {
                    type = 'damage',
                    damage = {
                        amount = tier.damage,
                        type = damage_type or 'physical'
                    }
                }
            }
        },
        durability = tier.durability,
        subgroup = 'tool',
        order = 'a[mining]-' .. tier.order .. '[' .. name .. ']',
        speed = tier.speed,
        stack_size = 20
    }
end

return tool
