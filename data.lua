require("prototypes.item-groups")
require("prototypes.fluid")
require("prototypes.recipe")
require("prototypes.technology")

local data_util = require("__sa-planets-pack__.data_util")

-- order updates only
local function change_order(target, value)
    local _type = (type(target) == "table" and target.type) or "item"
    local name = (type(target) == "table" and target.name) or target
    data_util.conditional_modify({
        type = _type,
        name = name,
        order = value
    })
end

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
    change_order({type = "tool", name = k}, v)
end

change_order("pump", "d")
change_order("diesel-pump", "d")

change_order({type = "recipe", name = "cerys-space-science-pack-from-methane-ice"}, science_pack_orders["space-science-pack"] .. "-3")
change_order({type = "recipe", name = "rubia-bio-utility-science-pack"}, science_pack_orders["utility-science-pack"] .. "-2")

change_order("ice-box", "z[items]-c[ice-box]")

-- subgroup updates only
local function change_subgroup(target, value)
    local _type = (type(target) == "table" and target.type) or "item"
    local name = (type(target) == "table" and target.name) or target
    data_util.conditional_modify({
        type = _type,
        name = name,
        subgroup = value
    })
end

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
    change_subgroup(item_name, "pipe")
end

-- belt
for _,item_name in pairs({
    "aai-loader",
    "aai-fast-loader",
    "aai-express-loader",
    "aai-turbo-loader",
}) do
    change_subgroup(item_name, "belt")
end

-- container-1
change_subgroup("ice-box", "container-1")

-- water_transport
change_subgroup({type = "item-with-entity-data", name = "ironclad"}, "water_transport")

-- science-pack
change_subgroup({type = "tool", name = "electrochemical-science-pack"}, "science-pack")

-- base

-- aai loaders

-- extra storage tanks

-- atan nuclear science

-- muluna

-- cerys
for _,recipe in pairs({
    "plutonium-rounds-magazine",
    "cerys-neutron-bomb",
    "cerys-hydrogen-bomb",
    "cerys-mixed-oxide-reactor",
    "mixed-oxide-fuel-cell",
    "plutonium-fuel",
    "mixed-oxide-reactor-equipment",
}) do
    data_util.recipe_add_additional_categories(recipe, {"advanced-centrifuging"})
end

for _,recipe in pairs({
    "cerys-radiation-proof-inserter",
}) do
    data_util.recipe_add_additional_categories(recipe, {"mechanics"})
end

for _,recipe in pairs({
    "mixed-oxide-reactor-equipment",
}) do
    data_util.recipe_add_additional_categories(recipe, {"electromechanics"})
end

-- rubia
data_util.delete({name = "rubia-efficiency-module4"})

for _,recipe in pairs({
    "rubia-armored-locomotive",
    "rubia-armored-cargo-wagon",
    "rubia-armored-fluid-wagon",
    "rubia-long-bulk-inserter",
    "rubia-long-stack-inserter",
    "craptonite-wall",
}) do
    data_util.conditional_modify({type = "recipe", name = recipe, category = "crafting"})
end

for _,recipe in pairs({
    "rubia-long-bulk-inserter",
    "rubia-long-stack-inserter",
}) do
    data_util.recipe_add_additional_categories(recipe, {"mechanics"})
end

for _,recipe in pairs({
    "rubia-armored-locomotive",
    "rubia-armored-cargo-wagon",
    "rubia-armored-fluid-wagon",
}) do
    data_util.recipe_add_additional_categories(recipe, {"electromechanics"})
end

for _,recipe in pairs({
    "rubia-bio-utility-science-pack",
    "rubia-biofusion-promethium-science-pack",
}) do
    data_util.recipe_add_additional_categories(recipe, {"biochemistry"})
end

-- corrundum
for _,recipe in pairs({
    "calcium-sulfate-bioflux",
    "calcium-sulfate-egg",
    "calcium-sulfate-fish",
}) do
    data_util.recipe_add_additional_categories(recipe, {"biochemistry"})
end

-- moshine

-- pelagos
for _,recipe in pairs({
    "lighthouse",
}) do
    data_util.conditional_modify({type = "recipe", name = recipe, category = "crafting"})
end

for _,v in pairs({
    "diesel-pump"
}) do
    data_util.conditional_modify({type = "recipe", name = v, category = "maraxsis-hydro-plant-or-assembling"})
end

for _,recipe in pairs({
    "long-range-delivery-drone",
    "diesel-inserter",
    "fast-diesel-inserter",
    "crane-bulk-diesel-inserter",
    "crane-stack-diesel-inserter",
    "diesel-pump",
}) do
    data_util.recipe_add_additional_categories(recipe, {"mechanics"})
end

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
}) do
    data_util.recipe_add_additional_categories(recipe, {"electromechanics"})
end

for _,recipe in pairs({
    "coconut-processing",
    "fermentation-bacteria-cultivation",
    "nutrients-from-coconut-meat",
    "pelagos-science-pack",
    "fermented-fish",
}) do
    data_util.recipe_add_additional_categories(recipe, {"biochemistry"})
end

for _,recipe in pairs({
    "pirateship",
    "wooden-platform",
}) do
    data_util.recipe_add_additional_categories(recipe, {"woodworking"})
end

-- maraxsis
for _,recipe in pairs({
    "msr-fuel-cell",
}) do
    data_util.recipe_add_additional_categories(recipe, {"advanced-centrifuging"})
end

for _,recipe in pairs({
    "maraxsis-diesel-submarine",
}) do
    data_util.recipe_add_additional_categories(recipe, {"mechanics"})
end


for _,recipe in pairs({
    "maraxsis-fish-food",
    "maraxsis-microplastics",
    "maraxsis-nutrients-from-tropical-fish",
}) do
    data_util.recipe_add_additional_categories(recipe, {"biochemistry"})
end

-- paracelsin
data_util.recipe_add_ingredient("solar-matrix", "silicon-cell", 6)
data_util.recipe_add_ingredient("accumulator-v2", "magnet", 5)

-- secretas
data_util.delete({name = "gold-railgun-turret", entity_type = "ammo-turret"})

data.raw["recipe"]["gold-plate-alt"] = nil

data.raw["recipe"]["gold-plate"].category = "smelting"
data.raw["recipe"]["gold-plate"].energy_required = 3.2

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

for _,recipe in pairs({
    "hyper-inserter",
}) do
    data_util.recipe_add_additional_categories(recipe, {"mechanics"})
end

-- vesta

-- age of production

-- everything else
for _,v in pairs({
    "fluid-tank-1x1",
    "fluid-tank-2x2",
    "fluid-tank-3x4",
    "fluid-tank-5x5",
}) do
    data_util.conditional_modify({type = "recipe", name = v, category = "maraxsis-hydro-plant-or-assembling"})
end

for _,recipe in pairs({
    "fluid-tank-1x1",
    "fluid-tank-2x2",
    "fluid-tank-3x4",
    "fluid-tank-5x5",
    "aai-express-loader",
}) do
    data_util.recipe_add_additional_categories(recipe, {"mechanics"})
end

for _,recipe in pairs({
    "wood-processing",
}) do
    data_util.recipe_add_additional_categories(recipe, {"woodworking"})
end
