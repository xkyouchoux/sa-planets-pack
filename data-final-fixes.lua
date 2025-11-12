require("prototypes.item-groups-updates")

local data_util = require("__sa-planets-pack__.data_util")

-- base

for _,recipe in pairs(data.raw["recipe"]) do
    recipe.always_show_made_in = true
end

data_util.tech_add_ingredients("research-productivity", {
    "electrochemical-science-pack",
    "pelagos-science-pack",
    "golden-science-pack",
    "gas-manipulation-science-pack"
})

data_util.tech_add_prerequisites("research-productivity", {
    "electrochemical-science-pack",
    "pelagos-science-pack",
    "s1_gas_manipulation_science_pack",
    "golden-science-pack"
})

-- asteroid belt
data_util.tech_add_ingredients_with_prerequisites("space-discovery-asteroid-belt", {
    "nuclear-science-pack",
    "production-science-pack",
    "utility-science-pack",
    "interstellar-science-pack", 
    "metallurgic-science-pack",
    "agricultural-science-pack",
    "electromagnetic-science-pack",
    "biorecycling-science-pack"
}, {["biorecycling-science-pack"] = "rubia-project-trashdragon"})

for _,v in pairs({
    "planet-discovery-maraxsis",
    "planet-discovery-paracelsin"
}) do
    data_util.tech_add_prerequisites(v, {"space-discovery-asteroid-belt"})
end

-- better-planets
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

-- muluna
data_util.tech_add_prerequisites("muluna-space-telescope", {
    "electrochemical-science-pack",
    "pelagos-science-pack",
    "s1_gas_manipulation_science_pack",
    "golden-science-pack"
})

-- cerys

-- rubia
local rubia_unknown_techs = {}
for name,tech in pairs(data.raw["technology"]) do
    if string.find(name, "rubia%-unknown%-technology%-") then
        table.insert(rubia_unknown_techs, name)
    end
    if tech.prerequisites then
        for i = #tech.prerequisites, 1, -1 do
            local prerequisite = tech.prerequisites[i]
            if prerequisite and prerequisite:find("rubia%-unknown%-technology%-") then
                tech.prerequisites[i] = nil
            end
        end
    end
end
    
for _,v in pairs(rubia_unknown_techs) do
    data.raw["technology"][v] = nil
end

data_util.tech_remove_prerequisites("rubia-cargo-landing-pad-capacity", {"promethium-science-pack"})
data_util.tech_remove_ingredients("rubia-cargo-landing-pad-capacity", {"promethium-science-pack"})

-- corrundum
data_util.conditional_modify({
    type = "recipe",
    name = "electrochemical-science-pack",
    subgroup = data_util.NIL,
    order = data_util.NIL,
})
data_util.conditional_modify({
    type = "tool",
    name = "electrochemical-science-pack",
    order = "b-f",
})

data_util.tech_add_prerequisites("research-speed-infinite", {
    "electrochemical-science-pack",
})

data.raw["technology"]["rocket-fuel-catalysis-productivity-infinite"] = nil

-- moshine
data_util.delete({name = "big-solar-panel", entity_type = "solar-panel", technology_name = "big-solar-energy"})
data_util.delete({name = "big-accumulator", entity_type = "accumulator", technology_name = "electric-energy-big-accumulators"})

-- pelagos

-- maraxsis
data.raw["assembling-machine"]["big-mining-drill-sand-extractor"].icon = nil
data.raw["assembling-machine"]["big-mining-drill-sand-extractor"].icons = table.deepcopy(data.raw["assembling-machine"]["big-mining-drill-ground-digger"].icons)
data.raw["assembling-machine"]["big-mining-drill-sand-extractor"].icons[2].icon = data.raw["item"]["sand"].icon

-- paracelsin

data_util.tech_add_prerequisites("solar-matrix", {"moshine-tech-ai-tier-2"}) -- solar
data_util.tech_add_prerequisites("accumulator-v2", {"moshine-tech-ai-tier-6"}) -- accumulator

-- secretas
data_util.tech_add_ingredients("planet-discovery-secretas", {"galvanization-science-pack"})
data_util.tech_add_prerequisites("planet-discovery-secretas", {"railgun"})

data_util.tech_add_prerequisites("golden-science-pack", {"steam-recycler"})

for _,effect in pairs(data.raw["technology"]["steam-recycler"].effects) do
    if effect.type == "unlock-recipe" and effect.recipe == "golden-egg" then effect.recipe = "golden-biter-egg" end
end

data_util.conditional_modify({
    type = "technology",
    name = "steam-recycler",
    icon = data.raw["technology"]["steam-recycler"].icons[1].icon,
    icons = data_util.NIL,
})

data_util.conditional_modify({
    type = "technology",
    name = "golden-science-pack",
    icon = data.raw["technology"]["golden-science-pack"].icons[1].icon,
    icons = data_util.NIL,
})

data_util.conditional_modify({
    type = "technology",
    name = "hyper-inserter",
    icon = data.raw["technology"]["hyper-inserter"].icons[1].icon,
    icons = data_util.NIL,
})


for _,v in pairs({
    "aop-electromechanics",
    "aop-advanced-recycling",
    "gold-heat-pipe",
    "gold-plate-productivity",
    "hyper-inserter",
    "pentapod-egg-unrestricted",
    "science-pack-productivity",
    "spaceship-scrap-recycling-productivity",
    "transport-belt-capacity-3-Secretas",
    "worker-robots-storage-4"
}) do
    data_util.tech_add_prerequisites(v, {"golden-science-pack"})
end

data.raw["technology"]["science-pack-productivity"] = nil

-- vesta
data_util.conditional_modify({
    type = "recipe",
    name = "gas-manipulation-science-pack",
    order = data_util.NIL,
    subgroup = data_util.NIL,
    main_product = "gas-manipulation-science-pack",
})

-- age of production
local function remove_aop_tech(tech_name, entity_type)
    for _,effect in pairs(data.raw["technology"][tech_name].effects) do
        if effect.type == "unlock-recipe" and effect.recipe then
            data.raw["recipe"][effect.recipe] = nil
        end
    end
    data_util.delete({name = tech_name, entity_type = entity_type or "assembling-machine"})
end

remove_aop_tech("aop-atomic-enricher")
remove_aop_tech("aop-greenhouse")
remove_aop_tech("aop-agriculture-productivity")
remove_aop_tech("aop-smeltery")

for _,v in pairs({
    "aop-core-mining",
    "aop-quantum-machinery",
    "aop-core-mining-productivity",
    "aop-deep-mineral-refining-productivity"
}) do
    data_util.tech_add_ingredients(v, {
        "galvanization-science-pack",
        "hydraulic-science-pack"
    })
end

for _,recipe in pairs({
    "fusion-reactor-equipment-from-mixed-oxide",
}) do
    data_util.recipe_add_additional_categories(recipe, {"electromechanics"})
end
