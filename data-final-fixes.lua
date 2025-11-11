require("prototypes.technology-final-fixes")

local data_util = require("__sa-planets-pack__.data_util")

data.raw["tool"]["electrochemical-science-pack"].order = "b-f"

local asteroid_stream = require("__Better-Planets__.scripts.asteroid-streams")

asteroid_stream.copy_many({
    { -- to prevent needing rocket turret for fulgora and metal-and-stars
        src = {from = "nauvis", to = "gleba"},
        dst = {
            {from = "fulgora", to = "calidus-senestella-gate-calidus", reverse = true},
            {from = "calidus-senestella-gate-calidus", to = "calidus-senestella-gate-senestella"}
        }
    },
    {
        src = {from = "aquilo", to = "maraxsis"},
        dst = {
            {from = "aquilo", to = "paracelsin"},
            {from = "paracelsin", to = "vesta"},
        }
    },
    {
        src = {from = "aquilo", to = "secretas"},
        dst = {
            {from = "maraxsis", to = "secretas"},
        }
    }
})

data.raw["assembling-machine"]["big-mining-drill-sand-extractor"].icon = nil
data.raw["assembling-machine"]["big-mining-drill-sand-extractor"].icons = table.deepcopy(data.raw["assembling-machine"]["big-mining-drill-ground-digger"].icons)
data.raw["assembling-machine"]["big-mining-drill-sand-extractor"].icons[2].icon = data.raw["item"]["sand"].icon

for _,recipe in pairs(data.raw["recipe"]) do
    recipe.always_show_made_in = true
end

data_util.delete({
    name = "big-solar-panel",
    entity_type = "solar-panel",
    technology_name = "big-solar-energy",
})

data_util.delete({
    name = "big-accumulator",
    entity_type = "accumulator",
    technology_name = "electric-energy-big-accumulators",
})

data_util.delete({
    name = "gold-railgun-turret",
    entity_type = "ammo-turret",
})

data_util.delete({
    name = "aop-greenhouse",
    entity_type = "assembling-machine",
})

data_util.delete({
    name = "aop-smeltery",
    entity_type = "assembling-machine",
})
