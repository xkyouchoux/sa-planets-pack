local Util = {}

function Util.table_contains(_table, value)
    if not _table then return false end
    for _,v in pairs(_table) do
        if v == value then return true end
    end
    return false
end

Util.NIL = "__CONDITIONAL_MODIFY_NIL__"

function Util.conditional_modify(params)
    if not params then return end
    if not (params.type and params.name) then return end
    
    if data.raw[params.type] then
        prototype = data.raw[params.type][params.name]
        if prototype then
            for k,v in pairs(params) do
                if v == Util.NIL then
                    prototype[k] = nil
                else
                    prototype[k] = v
                end
            end
        end
    end
end

function Util.recipe_replace_ingredient_sub(recipe, from, to, amount, is_fluid)
    local type = is_fluid and "fluid" or "item"
    for _,v in pairs(recipe.ingredients) do
        if v.type == type and v.name == from then
            v.name = to
            if amount then
                v.amount = amount
            end
        end
    end
end

function Util.recipe_add_ingredient_sub(recipe, name, amount, is_fluid)
    local type = is_fluid and "fluid" or "item"
    table.insert(recipe.ingredients, {type = is_fluid and "fluid" or "item", name = name, amount = amount})
end

function Util.recipe_replace_ingredient(recipe_name, from, to, amount, is_fluid)
    local recipe = data.raw["recipe"][recipe_name]
    Util.recipe_replace_ingredient_sub(recipe, from, to, amount, is_fluid)
end

function Util.recipe_add_ingredient(recipe_name, name, amount, is_fluid)
    local recipe = data.raw["recipe"][recipe_name]
    Util.recipe_add_ingredient_sub(recipe, name, amount, is_fluid)
end

function Util.tech_remove_prerequisites(tech_name, prerequisites)
    local tech = data.raw["technology"][tech_name]
    if tech and tech.prerequisites then
        for _,v in pairs(prerequisites) do
            for i = #tech.prerequisites, 1, -1 do
                if tech.prerequisites[i] == v then
                    table.remove(tech.prerequisites, i)
                end
            end
        end
    end
end

function Util.tech_remove_ingredients(tech_name, ingredients)
    local tech = data.raw["technology"][tech_name]
    if tech and tech.unit then
        for _,v in pairs(ingredients) do
            for i = #tech.unit.ingredients, 1, -1 do
                if tech.unit.ingredients[i][1] == v then
                    table.remove(tech.unit.ingredients, i)
                end
            end
        end
    end
end

function Util.tech_remove_effects(tech_name, effects)
    local tech = data.raw["technology"][tech_name]
    if tech and tech.effects then
        for _,v in pairs(effects) do
            for i = #tech.effects, 1, -1 do
                if tech.effects[i].type == v.type and tech.effects[i].recipe == v.recipe then
                    table.remove(tech.effects, i)
                end
            end
        end
    end
end

function Util.tech_has_effect_sub(tech, effect_stub)
    if tech and tech.effects then
        for _,effect in pairs(tech.effects) do
            if effect.type == effect_stub.type and effect.recipe == effect_stub.recipe then return true end
        end
    end
    return false
end

function Util.tech_has_effect(tech_name, effect_stub)
    local tech = data.raw["technology"][tech_name]
    return tech and Util.tech_has_effect_sub(tech, effect_stub)
end

function Util.tech_has_ingredient_sub(tech, ingredient_name)
    for _,ingredient in pairs(tech.unit.ingredients) do
        if ingredient[1] == ingredient_name then return true end
    end
    return false
end

function Util.tech_has_ingredient(tech_name, ingredient_name)
    local tech = data.raw["technology"][tech_name]
    if tech and tech.unit and tech.unit.ingredients then
        return Util.tech_has_ingredient_sub(tech, ingredient_name)
    end
    return false
end

function Util.tech_add_effects_sub(tech, effects)
    for _,effect in pairs(effects) do
        if not Util.tech_has_effect_sub(tech, effect) then
            table.insert(tech.effects, effect)
        end
    end
end

function Util.tech_add_prerequisites_sub(tech, prerequisites)
    if not tech.prerequisites then tech.prerequisites = {} end
    for _,name in pairs(prerequisites) do
        if not Util.table_contains(tech.prerequisites, name) then
            table.insert(tech.prerequisites, name)
        end
    end
end

function Util.tech_add_ingredients_sub(tech, ingredients)
    for _,name in pairs(ingredients) do
        if not Util.tech_has_ingredient_sub(tech, name) then
            table.insert(tech.unit.ingredients, {name, 1})
        end
    end
end

function Util.tech_add_ingredients_with_prerequisites(tech_name, ingredients, transform)
    local tech = data.raw["technology"][tech_name]
    if tech then
        Util.tech_add_ingredients_sub(tech, ingredients)
        local prerequisites = ingredients
        if transform then
            for k,v in pairs(prerequisites) do
                if transform[v] then prerequisites[k] = transform[v] end
            end
        end
        Util.tech_add_prerequisites_sub(tech, prerequisites)
    end
end

function Util.tech_add_effects(tech_name, effects)
    local tech = data.raw["technology"][tech_name]
    if tech then
        Util.tech_add_effects_sub(tech, effects)
    end
end

function Util.tech_add_prerequisites(tech_name, prerequisites)
    local tech = data.raw["technology"][tech_name]
    if tech then
        Util.tech_add_prerequisites_sub(tech, prerequisites)
    end
end

function Util.tech_add_ingredients(tech_name, ingredients)
    local tech = data.raw["technology"][tech_name]
    if tech then
        Util.tech_add_ingredients_sub(tech, ingredients)
    end
end

function Util.recipe_add_additional_categories(recipe_name, categories)
    local recipe = data.raw["recipe"][recipe_name]
    if recipe and categories then
        if not recipe.additional_categories then recipe.additional_categories = {} end
        for _,v in pairs(categories) do
            table.insert(recipe.additional_categories, v)
        end
    end
end

function Util.delete(params)
    local name = params.name
    local item_name = params.item_name or name
    data.raw[params.item_type or "item"][item_name] = nil
    data.raw["recipe"][item_name .. "-recycling"] = nil
    data.raw["recipe"]["item-" .. item_name .. "-incineration"] = nil
    data.raw["recipe"]["yeet-item-" .. item_name] = nil
    if params.entity_type then
        data.raw[params.entity_type][params.entity_name or name] = nil
    end
    data.raw["recipe"][params.recipe_name or name] = nil
    data.raw["technology"][params.technology_name or name] = nil
end

return Util