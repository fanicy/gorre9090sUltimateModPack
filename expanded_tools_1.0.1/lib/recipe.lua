function recipe(name, ingredients)
    return {
        type = "recipe",
        name = name,
        enabled = false,
        ingredients = ingredients,
        result = name
    }
end

return recipe
