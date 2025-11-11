local data_util = require("__sa-planets-pack__.data_util")

if settings.startup["spp-rubia-disable-efficiency-module-4"].value then
    data.raw["module"]["rubia-efficiency-module4"] = nil
    data.raw["recipe"]["rubia-efficiency-module4"] = nil
    data.raw["technology"]["rubia-efficiency-module4"] = nil
end

if settings.startup["spp-aai-loader-stacking"].value then
    for _,loader in pairs(data.raw["loader-1x1"]) do
        if loader.name:find("aai-") then
            loader.adjustable_belt_stack_size = true
            loader.wait_for_full_stack = true
            loader.max_belt_stack_size = data.raw["utility-constants"]["default"].max_belt_stack_size
        end
    end
end

data.raw["item"]["ice-box"].subgroup = "container-1"
data.raw["item"]["ice-box"].order = "z[items]-c[ice-box]"

data.raw["item"]["aai-loader"].subgroup = "belt"
data.raw["item"]["aai-fast-loader"].subgroup = "belt"
data.raw["item"]["aai-express-loader"].subgroup = "belt"
data.raw["item"]["aai-turbo-loader"].subgroup = "belt"

data.raw["item-with-entity-data"]["ironclad"].subgroup = "water_transport"

data.raw["recipe"]["rail-minimal"].category = "electromechanics-or-crafting"
data.raw["recipe"]["rail-ramp-minimal"].category = "electromechanics-or-crafting"
data.raw["recipe"]["muluna-rocket-buggy"].category = "electromechanics-or-crafting"

for _,v in pairs({
    "storage-tank", "fluid-tank-1x1", "fluid-tank-2x2",
    "fluid-tank-3x4", "fluid-tank-5x5", "pipe", "pipe-to-ground",
    "diesel-pump", "pump"
}) do
    data.raw["item"][v].subgroup = "pipe"
end

data.raw["item"]["pump"].order = "d"
data.raw["item"]["diesel-pump"].order = "d"

for _,v in pairs({
    "casting-pipe", "casting-pipe-to-ground"
}) do
    data.raw["recipe"][v].subgroup = "pipe"
end

local science_packs = {
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

for k,v in pairs(science_packs) do
    local tool = data.raw["tool"][k]
    if tool then
        tool.order = v
    end
end

for _,v in pairs({
    "fluid-tank-1x1",
    "fluid-tank-2x2",
    "fluid-tank-3x4",
    "fluid-tank-5x5",
    "diesel-pump"
}) do
    data.raw["recipe"][v].category = "maraxsis-hydro-plant-or-assembling"
end

for _,v in pairs({
    "corrosive-firearm-magazine",
    "mortar-bomb",
    "mortar-cluster-bomb",
    "pirateship-cannonball"
}) do
    data.raw["recipe"][v].category = "ammunition-or-crafting"
end

for _,recipe in pairs({
    "plutonium-rounds-magazine",
    "cerys-neutron-bomb",
    "cerys-hydrogen-bomb",
    "cerys-mixed-oxide-reactor",
    "mixed-oxide-fuel-cell",
    "msr-fuel-cell",
    "plutonium-fuel",
}) do
    data_util.recipe_add_additional_categories(recipe, {"advanced-centrifuging"})
end

data.raw["recipe"]["electrochemical-science-pack"].subgroup = "science-pack"
data.raw["recipe"]["electrochemical-science-pack"].order = data.raw["tool"]["electrochemical-science-pack"].order

data.raw["recipe"]["rubia-bio-utility-science-pack"].order = data.raw["tool"]["utility-science-pack"].order .. "-2"
data.raw["recipe"]["cerys-space-science-pack-from-methane-ice"].order = data.raw["tool"]["space-science-pack"].order .. "-3"

data.raw["recipe"]["gas-manipulation-science-pack"].order = nil
data.raw["recipe"]["gas-manipulation-science-pack"].subgroup = nil
data.raw["recipe"]["gas-manipulation-science-pack"].main_product = "gas-manipulation-science-pack"

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

for _,recipe in pairs({
    "long-range-delivery-drone-depot",
    "long-range-delivery-drone-request-depot",
    "rubia-armored-locomotive",
    "rubia-armored-cargo-wagon",
    "rubia-armored-fluid-wagon",
}) do
    data_util.recipe_add_additional_categories(recipe, {"electromechanics"})
end

for _,recipe in pairs({
    "rubia-armored-locomotive",
    "rubia-armored-cargo-wagon",
    "rubia-armored-fluid-wagon",
    "rubia-long-bulk-inserter",
    "rubia-long-stack-inserter",
    "craptonite-wall",
    "lighthouse",
}) do
    data.raw["recipe"][recipe].category = "crafting"
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

local golden_biter_egg_recipe = table.deepcopy(data.raw["recipe"]["golden-egg"])
golden_biter_egg_recipe.name = "golden-biter-egg"
data.extend({golden_biter_egg_recipe})
data.raw["recipe"]["golden-egg"] = nil

data_util.recipe_add_ingredient("solar-matrix", "silicon-cell", 6)
data_util.recipe_add_ingredient("accumulator-v2", "magnet", 5)

local speed_module_4 = table.deepcopy(data.raw["module"]["speed-module-4-S"])
speed_module_4.name = "speed-module-4"
local speed_module_4_recipe = table.deepcopy(data.raw["recipe"]["speed-module-4-S"])
speed_module_4_recipe.name = "speed-module-4"
speed_module_4_recipe.results[1].name = "speed-module-4"
speed_module_4_recipe.main_product = nil
data.raw["module"]["speed-module-4-S"] = nil
data.raw["recipe"]["speed-module-4-S"] = nil
data:extend({speed_module_4, speed_module_4_recipe})

local efficiency_module_4 = table.deepcopy(data.raw["module"]["efficiency-module-4-S"])
efficiency_module_4.name = "efficiency-module-4"
local efficiency_module_4_recipe = table.deepcopy(data.raw["recipe"]["efficiency-module-4-S"])
efficiency_module_4_recipe.name = "efficiency-module-4"
efficiency_module_4_recipe.results[1].name = "efficiency-module-4"
efficiency_module_4_recipe.main_product = nil
data.raw["module"]["efficiency-module-4-S"] = nil
data.raw["recipe"]["efficiency-module-4-S"] = nil
data:extend({efficiency_module_4, efficiency_module_4_recipe})

local productivity_module_4 = table.deepcopy(data.raw["module"]["productivity-module-4-S"])
productivity_module_4.name = "productivity-module-4"
local productivity_module_4_recipe = table.deepcopy(data.raw["recipe"]["productivity-module-4-S"])
productivity_module_4_recipe.name = "productivity-module-4"
productivity_module_4_recipe.results[1].name = "productivity-module-4"
productivity_module_4_recipe.main_product = nil
data.raw["module"]["productivity-module-4-S"] = nil
data.raw["recipe"]["productivity-module-4-S"] = nil
data:extend({productivity_module_4, productivity_module_4_recipe})

local quality_module_4 = table.deepcopy(data.raw["module"]["quality-module-4-S"])
quality_module_4.name = "quality-module-4"
local quality_module_4_recipe = table.deepcopy(data.raw["recipe"]["quality-module-4-S"])
quality_module_4_recipe.name = "quality-module-4"
quality_module_4_recipe.results[1].name = "quality-module-4"
quality_module_4_recipe.main_product = nil
data.raw["module"]["quality-module-4-S"] = nil
data.raw["recipe"]["quality-module-4-S"] = nil
data:extend({quality_module_4, quality_module_4_recipe})

data.raw["produce-achievement"]["crafting-with-hyper-quality"].item_product = "quality-module-4"
data.raw["produce-achievement"]["crafting-with-hyper-productivity"].item_product = "productivity-module-4"
data.raw["produce-achievement"]["crafting-with-hyper-speed"].item_product = "speed-module-4"
data.raw["produce-achievement"]["crafting-with-hyper-efficiency"].item_product = "efficiency-module-4"
