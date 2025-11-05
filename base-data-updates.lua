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
data.raw["recipe"]["long-range-delivery-drone-depot"].category = "electromechanics-or-crafting"
data.raw["recipe"]["long-range-delivery-drone-request-depot"].category = "electromechanics-or-crafting"

for _,v in pairs({
    "long-range-delivery-drone",
    "rubia-armored-locomotive",
    "rubia-armored-cargo-wagon",
    "rubia-armored-fluid-wagon",
    ""
}) do
    data_util.recipe_add_additional_categories(v, {"electromechanics"})
end

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
}) do
    data.raw["item"][v].category = "maraxsis-hydro-plant-or-assembling"
end

data.raw["recipe"]["electrochemical-science-pack"].subgroup = "science-pack"
data.raw["recipe"]["electrochemical-science-pack"].order = data.raw["tool"]["electrochemical-science-pack"].order

data.raw["recipe"]["rubia-bio-utility-science-pack"].order = data.raw["tool"]["utility-science-pack"].order .. "-2"
data.raw["recipe"]["gas-manipulation-science-pack"].order = data.raw["tool"]["gas-manipulation-science-pack"].order
data.raw["recipe"]["cerys-space-science-pack-from-methane-ice"].order = data.raw["tool"]["space-science-pack"].order .. "-3"

for _,recipe in pairs({
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
    "duct-small",
    "duct-underground",
    "duct-t-junction",
    "duct-curve",
    "duct-cross",
    "non-return-duct",
    "duct-intake",
    "duct-exhaust",
    "maraxsis-trench-duct"
}) do
    data_util.recipe_add_additional_categories(recipe, {"mechanics"})
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
    "wooden-platform",
    "coconut-husk-spoiling",
    "wood-spoiling",
}) do
    data_util.recipe_add_additional_categories(recipe, {"woodworking"})
end
