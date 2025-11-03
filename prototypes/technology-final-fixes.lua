local data_util = require("__sa-planets-pack__.data_util")

-- rubia fixes

if settings.startup["spp-rubia-disable-tech-hiding"].value then 
    local rubia_unknown_techs = {}
    for name,tech in pairs(data.raw["technology"]) do
        if string.find(name, "rubia%-unknown%-technology%-") == 1 then
            table.insert(rubia_unknown_techs, name)
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

-- golden science pack

data_util.tech_add_prerequisites("golden-science-pack", {"steam-recycler"})

for _,v in pairs({
    "aop-electromechanics",
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


-- science pack productivity

data_util.tech_remove_effects("science-pack-productivity", {
    {
        type = "change-recipe-productivity",
        recipe = "promethium-science-pack"
    }
})

local function science_productivity(pack)
    return {
        type = "change-recipe-productivity",
        recipe = pack,
        change = .01
    }
end

data_util.tech_add_effects("science-pack-productivity", {
    science_productivity("rubia-bio-utility-science-pack"),
    science_productivity("space-science-pack-muluna"),
    science_productivity("cerys-space-science-pack-from-methane-ice"),
    science_productivity("rubia-biofusion-science-pack"),
    science_productivity("maraxsis-deepsea-research-automation-science-pack"),
    science_productivity("maraxsis-deepsea-research-logistic-science-pack"),
    science_productivity("maraxsis-deepsea-research-military-science-pack"),
    science_productivity("maraxsis-deepsea-research-chemical-science-pack"),
    science_productivity("maraxsis-deepsea-research-production-science-pack"),
    science_productivity("maraxsis-deepsea-research-utility-science-pack"),
    science_productivity("aop-hydraulics-specialized-cryogenic-science-pack"),
    science_productivity("aop-military-specialized-metallurgic-science-pack"),
    science_productivity("aop-hybridation-specialized-agricultural-science-pack"),
    science_productivity("aop-petrochemistry-specialized-electromagnetic-science-pack"),
})
