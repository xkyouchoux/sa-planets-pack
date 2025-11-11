local data_util = require("__sa-planets-pack__.data_util")

if settings.startup["spp-rubia-disable-efficiency-module-4"].value then
    data.raw["module"]["rubia-efficiency-module4"] = nil
    data.raw["recipe"]["rubia-efficiency-module4"] = nil
    data.raw["technology"]["rubia-efficiency-module4"] = nil
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

for _,module in pairs({"speed", "efficiency", "productivity", "quality"}) do
    local old_name = module.."-module-4-S"
    local new_name = module.."-module-4"
    local module_4 = table.deepcopy(data.raw["module"][old_name])
    module_4.name = new_name
    local module_4_recipe = table.deepcopy(data.raw["recipe"][old_name])
    module_4_recipe.name = new_name
    module_4_recipe.results[1].name = new_name
    module_4_recipe.main_product = nil
    data.raw["module"][old_name] = nil
    data.raw["recipe"][old_name] = nil
    data.raw["technology"][old_name] = nil
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
end
