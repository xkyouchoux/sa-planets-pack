local data_util = require("__sa-planets-pack__.data_util")

-- rubia fixes

if settings.startup["spp-rubia-disable-tech-hiding"].value then 
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
end

data_util.tech_remove_prerequisites("rubia-cargo-landing-pad-capacity", {"promethium-science-pack"})
data_util.tech_remove_ingredients("rubia-cargo-landing-pad-capacity", {"promethium-science-pack"})

-- exploration science pack

data_util.tech_add_ingredients_with_prerequisites("space-discovery-asteroid-belt", {
    "nuclear-science-pack",
    "production-science-pack",
    "utility-science-pack",
    "interstellar-science-pack", 
    "metallurgic-science-pack",
    "agricultural-science-pack",
    "electromagnetic-science-pack"
})

-- asteroid belt

for _,v in pairs({
    "planet-discovery-maraxsis",
    "planet-discovery-paracelsin"
}) do
    data_util.tech_add_prerequisites(v, {"space-discovery-asteroid-belt"})
end

-- secretas

data_util.tech_add_ingredients("planet-discovery-secretas", {"galvanization-science-pack"})
data_util.tech_add_prerequisites("planet-discovery-secretas", {"railgun"})

data_util.tech_add_prerequisites("golden-science-pack", {"steam-recycler"})

data.raw["technology"]["steam-recycler"].icon = data.raw["technology"]["steam-recycler"].icons[1].icon
data.raw["technology"]["steam-recycler"].icons = nil

data.raw["technology"]["golden-science-pack"].icon = data.raw["technology"]["golden-science-pack"].icons[1].icon
data.raw["technology"]["golden-science-pack"].icons = nil

data.raw["technology"]["hyper-inserter"].icon = data.raw["technology"]["hyper-inserter"].icons[1].icon
data.raw["technology"]["hyper-inserter"].icons = nil

for _,v in pairs({
    "aop-electromechanics",
    "aop-advanced-recycling",
    "gold-heat-pipe",
    "gold-plate-productivity",
    "gold-railgun-turret",
    "hyper-inserter",
    "pentapod-egg-unrestricted",
    "science-pack-productivity",
    "spaceship-scrap-recycling-productivity",
    "transport-belt-capacity-3-Secretas",
    "worker-robots-storage-4"
}) do
    data_util.tech_add_prerequisites(v, {"golden-science-pack"})
end

-- module 4 fixes

data.raw["technology"]["speed-module-4-S"] = nil
data.raw["technology"]["efficiency-module-4-S"] = nil
data.raw["technology"]["productivity-module-4-S"] = nil
data.raw["technology"]["quality-module-4-S"] = nil

for _,tech in pairs(data.raw["technology"]) do
    if tech.prerequisites then
        for i,v in pairs(tech.prerequisites) do
            if v == "speed-module-4-S" then tech.prerequisites[i] = "speed-module-4" end
            if v == "efficiency-module-4-S" then tech.prerequisites[i] = "efficiency-module-4" end
            if v == "productivity-module-4-S" then tech.prerequisites[i] = "productivity-module-4" end
            if v == "quality-module-4-S" then tech.prerequisites[i] = "quality-module-4" end
        end
    end
end

-- aop

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

-- productivity techs

data.raw["technology"]["science-pack-productivity"] = nil

data_util.tech_add_prerequisites("research-speed-infinite", {
    "electrochemical-science-pack",
})

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

data_util.tech_add_prerequisites("muluna-space-telescope", {
    "electrochemical-science-pack",
    "pelagos-science-pack",
    "s1_gas_manipulation_science_pack",
    "golden-science-pack"
})

data.raw["technology"]["gold-railgun-turret"] = nil

local function remove_aop_tech(tech_name)
    for _,effect in pairs(data.raw["technology"][tech_name].effects) do
        if effect.type == "unlock-recipe" and effect.recipe then
            data.raw["recipe"][effect.recipe] = nil
        end
    end
    data.raw["technology"][tech_name] = nil
end

remove_aop_tech("aop-atomic-enricher")
remove_aop_tech("aop-greenhouse")
remove_aop_tech("aop-agriculture-productivity")
remove_aop_tech("aop-smeltery")
