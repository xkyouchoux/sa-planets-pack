require("prototypes.item-groups")

local data_util = require("__sa-planets-pack__.data_util")

-- order updates only

local order_changes = {}

local science_pack_orders = {
    ["automation-science-pack"] = "a-a",
    ["logistic-science-pack"] = "a-b",
    ["military-science-pack"] = "a-c",
    ["chemical-science-pack"] = "a-d",
    ["nuclear-science-pack"] = "a-e",
    ["production-science-pack"] = "a-f",
    ["utility-science-pack"] = "a-g",
    ["space-science-pack"] = "a-h",
    ["metallurgic-science-pack"] = "b-a",
    ["agricultural-science-pack"] = "b-b",
    ["electromagnetic-science-pack"] = "b-c",
    ["biorecycling-science-pack"] = "b-d",
    ["rubia-biofusion-science-pack"] = "b-e",
    ["electrochemical-science-pack"] = "b-f",
    ["pelagos-science-pack"] = "b-g",
    ["interstellar-science-pack"] = "b-h",
    ["cryogenic-science-pack"] = "c-a",
    ["hydraulic-science-pack"] = "c-b",
    ["galvanization-science-pack"] = "c-c",
    ["gas-manipulation-science-pack"] = "c-d",
    ["golden-science-pack"] = "c-e",
    ["promethium-science-pack"] = "d-a",
    ["cerysian-science-pack"] = "z-a",
}

for k,v in pairs(science_pack_orders) do
    order_changes[{type = "tool", name = k}] = v
end

order_changes["pump"] = "d"
order_changes["diesel-pump"] = "d"

order_changes[{type = "recipe", name = "cerys-space-science-pack-from-methane-ice"}] = science_pack_orders["space-science-pack"] .. "-3"
order_changes[{type = "recipe", name = "rubia-bio-utility-science-pack"}] = science_pack_orders["utility-science-pack"] .. "-2"

order_changes["ice-box"] = "z[items]-c[ice-box]"

for k,v in pairs(order_changes) do
    local _type = (type(k) == "table" and k.type) or "item"
    local name = (type(k) == "table" and k.name) or k
    data_util.conditional_modify({
        type = _type,
        name = name,
        order = v
    })
end

-- subgroup updates only
local subgroup_changes = {}

-- pipe
for _,item_name in pairs({
    "storage-tank",
    "pipe",
    "pipe-to-ground",
    "pump",

    "fluid-tank-1x1",
    "fluid-tank-2x2",
    "fluid-tank-3x4",
    "fluid-tank-5x5",

    "diesel-pump",

    {type = "recipe", name = "casting-pipe"},
    {type = "recipe", name = "casting-pipe-to-ground"},
}) do
    if item_name then subgroup_changes[item_name] = "pipe" end
end

-- belt
for _,item_name in pairs({
    "aai-loader",
    "aai-fast-loader",
    "aai-express-loader",
    "aai-turbo-loader",
}) do
    if item_name then subgroup_changes[item_name] = "belt" end
end

-- container-1
subgroup_changes["ice-box"] = "container-1"

-- water_transport
subgroup_changes[{type = "item-with-entity-data", name = "ironclad"}] = "water_transport"

-- science-pack
subgroup_changes[{type = "tool", name = "electrochemical-science-pack"}] = "science-pack"

for k,v in pairs(subgroup_changes) do
    local _type = (type(k) == "table" and k.type) or "item"
    local name = (type(k) == "table" and k.name) or k
    data_util.conditional_modify({
        type = _type,
        name = name,
        subgroup = v
    })
end

-- base

-- aai loaders

-- extra storage tanks

-- atan nuclear science
for _,recipe in pairs({
    "plutonium-rounds-magazine",
    "cerys-neutron-bomb",
    "cerys-hydrogen-bomb",
    "cerys-mixed-oxide-reactor",
    "mixed-oxide-fuel-cell",
    "msr-fuel-cell",
    "plutonium-fuel",
    "mixed-oxide-reactor-equipment",
}) do
    data_util.recipe_add_additional_categories(recipe, {"advanced-centrifuging"})
end

-- muluna

-- cerys

-- rubia
data_util.delete({name = "rubia-efficiency-module4"})

for _,recipe in pairs({
    "rubia-armored-locomotive",
    "rubia-armored-cargo-wagon",
    "rubia-armored-fluid-wagon",
    "rubia-long-bulk-inserter",
    "rubia-long-stack-inserter",
    "craptonite-wall",
    "lighthouse",
}) do
    data_util.conditional_modify({type = "recipe", name = recipe, category = "crafting"})
end

-- corrundum

-- moshine

-- pelagos

-- maraxsis
for _,v in pairs({
    "fluid-tank-1x1",
    "fluid-tank-2x2",
    "fluid-tank-3x4",
    "fluid-tank-5x5",
    "diesel-pump"
}) do
    data_util.conditional_modify({type = "recipe", name = v, category = "maraxsis-hydro-plant-or-assembling"})
end

-- paracelsin
data_util.recipe_add_ingredient("solar-matrix", "silicon-cell", 6)
data_util.recipe_add_ingredient("accumulator-v2", "magnet", 5)

for _,recipe in pairs({
    "long-range-delivery-drone",
    "diesel-inserter",
    "fast-diesel-inserter",
    "rubia-long-bulk-inserter",
    "crane-bulk-diesel-inserter",
    "crane-stack-diesel-inserter",
    "hyper-inserter",
    "rubia-long-stack-inserter",
    "cerys-radiation-proof-inserter",
    "fluid-tank-1x1",
    "fluid-tank-2x2",
    "fluid-tank-3x4",
    "fluid-tank-5x5",
    "diesel-pump",
    "aai-express-loader",
    "maraxsis-diesel-submarine",
}) do
    data_util.recipe_add_additional_categories(recipe, {"mechanics"})
end

-- secretas
data_util.delete({name = "gold-railgun-turret", entity_type = "ammo-turret"})

local golden_biter_egg_recipe = table.deepcopy(data.raw["recipe"]["golden-egg"])
golden_biter_egg_recipe.name = "golden-biter-egg"
data.extend({golden_biter_egg_recipe})
data.raw["recipe"]["golden-egg"] = nil

for _,module in pairs({"speed", "efficiency", "productivity", "quality"}) do
    local old_name = module.."-module-4-S"
    local new_name = module.."-module-4"
    local module_4 = table.deepcopy(data.raw["module"][old_name])
    module_4.name = new_name
    local module_4_recipe = table.deepcopy(data.raw["recipe"][old_name])
    module_4_recipe.name = new_name
    module_4_recipe.results[1].name = new_name
    module_4_recipe.main_product = nil
    data:extend({module_4, module_4_recipe, {
        type = "technology",
        name = new_name,
        icon = "__secretas__/graphics/technology/"..new_name.."-tech.png",
        icon_size = 256,
        effects = {
            {
                type = "unlock-recipe",
                recipe = new_name
            }
        },
        prerequisites = {
            "golden-science-pack",
            module.."-module-3"
        },
        unit = {
            count = 2000,
            time = 60,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
                {"space-science-pack", 1},
                {"nuclear-science-pack", 1},
                {"metallurgic-science-pack", 1},
                {"agricultural-science-pack", 1},
                {"electromagnetic-science-pack", 1},
                {"interstellar-science-pack", 1},
                {"cryogenic-science-pack", 1},
                {"golden-science-pack", 1},
            }
        },
        upgrade = true,
    }})
    data.raw["produce-achievement"]["crafting-with-hyper-"..module].item_product = new_name
    data_util.delete({name = old_name, item_type = "module"})
end

-- vesta

-- age of production
for _,v in pairs({
    "corrosive-firearm-magazine",
    "mortar-bomb",
    "mortar-cluster-bomb",
    "pirateship-cannonball"
}) do
    data_util.conditional_modify({type = "recipe", name = v, category = "ammunition-or-crafting"})
end

for _,recipe in pairs({
    "long-range-delivery-drone-depot",
    "long-range-delivery-drone-request-depot",
    "rubia-armored-locomotive",
    "rubia-armored-cargo-wagon",
    "rubia-armored-fluid-wagon",
    "mixed-oxide-reactor-equipment",
}) do
    data_util.recipe_add_additional_categories(recipe, {"electromechanics"})
end

for _,recipe in pairs({
    "maraxsis-fish-food",
    "maraxsis-microplastics",
    "coconut-processing",
    "fermentation-bacteria-cultivation",
    "nutrients-from-coconut-meat",
    "maraxsis-nutrients-from-tropical-fish",
    "rubia-bio-utility-science-pack",
    "pelagos-science-pack",
    "rubia-biofusion-promethium-science-pack",
    "calcium-sulfate-bioflux",
    "calcium-sulfate-egg",
    "calcium-sulfate-fish",
    "fermented-fish",
}) do
    data_util.recipe_add_additional_categories(recipe, {"biochemistry"})
end

for _,recipe in pairs({
    "pirateship",
    "wooden-platform",
    "wood-processing",
}) do
    data_util.recipe_add_additional_categories(recipe, {"woodworking"})
end
