local data_util = require("__sa-planets-pack__.data_util")

local data = {
    {
        type = "item",
        name = "rubia-wind-turbine",
        subgroup = "solar",
    },
    {
        type = "item",
        name = "solar-panel",
        subgroup = "solar",
    },
    {
        type = "recipe",
        name = "muluna-silicon-solar-panel",
        subgroup = "solar",
    },
    {
        type = "item",
        name = "solar-matrix",
        subgroup = "solar",
    },
    {
        type = "item",
        name = "big-solar-panel",
        subgroup = "solar",
    },
    {
        type = "item",
        name = "accumulator",
        subgroup = "solar",
    },
    {
        type = "item",
        name = "accumulator-v2",
        subgroup = "solar",
    },
    {
        type = "item",
        name = "big-accumulator",
        subgroup = "solar",
    },
    {
        type = "item",
        name = "cerys-charging-rod",
        subgroup = "solar",
    },

    {
        type = "item",
        name = "aop-biomass-reactor",
        subgroup = "reactor",
    },
    {
        type = "item",
        name = "nuclear-reactor",
        subgroup = "reactor",
    },
    {
        type = "item",
        name = "heat-pipe",
        subgroup = "reactor",
    },
    {
        type = "item",
        name = "gold-heat-pipe",
        subgroup = "reactor",
    },
    {
        type = "item",
        name = "steam-turbine",
        subgroup = "reactor",
    },
    {
        type = "item",
        name = "fusion-reactor",
        subgroup = "reactor",
    },
    {
        type = "item",
        name = "fusion-generator",
        subgroup = "reactor",
    },
    {
        type = "item",
        name = "maraxsis-salt-reactor",
        subgroup = "reactor",
    },
    {
        type = "item",
        name = "maraxsis-oversized-steam-turbine",
        subgroup = "reactor",
    },
    {
        type = "item",
        name = "cerys-mixed-oxide-reactor",
        subgroup = "reactor",
        order = "z",
    },

    {
        type = "item",
        name = "stone-furnace",
        subgroup = "smelting-machine",
        order = "a",
    },
    {
        type = "item",
        name = "muluna-steam-stone-furnace",
        subgroup = "smelting-machine",
        order = "b",
    },
    {
        type = "item",
        name = "steel-furnace",
        subgroup = "smelting-machine",
        order = "c",
    },
    {
        type = "item",
        name = "muluna-steam-steel-furnace",
        subgroup = "smelting-machine",
        order = "d",
    },
    {
        type = "item",
        name = "electric-furnace",
        subgroup = "smelting-machine",
        order = "e",
    },
    {
        type = "item",
        name = "foundry",
        subgroup = "smelting-machine",
        order = "f",
    },
    {
        type = "item",
        name = "aop-arc-furnace",
        subgroup = "smelting-machine",
        order = "g",
    },
    {
        type = "item",
        name = "calciner",
        subgroup = "smelting-machine",
        order = "h",
    },
    {
        type = "item",
        name = "vesta-combustion-furnace",
        subgroup = "smelting-machine",
        order = "i",
    },
    {
        type = "recipe",
        name = "vesta-combustion-furnace",
        subgroup = "smelting-machine",
        order = "i",
    },

    {
        type = "item",
        name = "crusher",
        subgroup = "crushing-machine",
    },
    {
        type = "recipe",
        name = "crusher",
        subgroup = "crushing-machine",
    },
    {
        type = "item",
        name = "muluna-steam-crusher",
        subgroup = "crushing-machine",
    },
    {
        type = "recipe",
        name = "muluna-steam-crusher",
        subgroup = "crushing-machine",
    },
    {
        type = "item",
        name = "crusher-2",
        subgroup = "crushing-machine",
    },
    {
        type = "recipe",
        name = "crusher-2",
        subgroup = "crushing-machine",
    },

    {
        type = "item",
        name = "recycler",
        subgroup = "recycling-machine",
    },
    {
        type = "item",
        name = "steam-recycler",
        subgroup = "recycling-machine",
    },
    {
        type = "item",
        name = "aop-salvager",
        subgroup = "recycling-machine",
    },

    {
        type = "item",
        name = "biochamber",
        subgroup = "biological-machine",
    },
    {
        type = "item",
        name = "aop-lumber-mill",
        subgroup = "biological-machine",
    },
    {
        type = "item",
        name = "aop-biochemical-facility",
        subgroup = "biological-machine",
    },
    {
        type = "item",
        name = "biorecycling-plant",
        subgroup = "biological-machine",
    },
    {
        type = "item",
        name = "crapapult",
        subgroup = "biological-machine",
    },
    {
        type = "item",
        name = "garbo-grabber",
        subgroup = "biological-machine",
    },

    {
        type = "item",
        name = "assembling-machine-1",
        subgroup = "assembling-machine",
        order = "a",
    },
    {
        type = "item",
        name = "assembling-machine-2",
        subgroup = "assembling-machine",
        order = "b",
    },
    {
        type = "item",
        name = "assembling-machine-3",
        subgroup = "assembling-machine",
        order = "c",
    },
    {
        type = "item",
        name = "diesel-assembling-machine",
        subgroup = "assembling-machine",
        order = "d",
    },
    {
        type = "item",
        name = "aop-advanced-assembling-machine",
        subgroup = "assembling-machine",
        order = "e",
    },
    {
        type = "item",
        name = "barreling-machine",
        subgroup = "assembling-machine",
        order = "f",
    },

    {
        type = "item",
        name = "oil-refinery",
        subgroup = "chemistry",
        order = "a",
    },
    {
        type = "item",
        name = "aop-petrochemical-facility",
        subgroup = "chemistry",
        order = "b",
    },
    {
        type = "item",
        name = "chemical-plant",
        subgroup = "chemistry",
        order = "c",
    },
    {
        type = "item",
        name = "catalytic-chemical-plant",
        subgroup = "chemistry",
        order = "d",
    },
    {
        type = "item",
        name = "electrochemical-plant",
        subgroup = "chemistry",
        order = "e",
    },
    {
        type = "item",
        name = "cryogenic-plant",
        subgroup = "chemistry",
        order = "f",
    },
    {
        type = "item",
        name = "vesta-electrolyzer",
        subgroup = "chemistry",
        order = "g",
    },
    {
        type = "recipe",
        name = "vesta-electrolyzer",
        subgroup = "chemistry",
        order = "g",
    },

    {
        type = "item",
        name = "centrifuge",
        subgroup = "radiation-machine",
    },
    {
        type = "item",
        name = "atan-atom-forge",
        subgroup = "radiation-machine",
    },

    {
        type = "item",
        name = "aop-armory",
        subgroup = "advanced-machine",
        order = "a",
    },
    {
        type = "item",
        name = "electromagnetic-plant",
        subgroup = "advanced-machine",
        order = "b",
    },
    {
        type = "item",
        name = "aop-mineral-synthesizer",
        subgroup = "advanced-machine",
        order = "c",
    },
    {
        type = "item",
        name = "maraxsis-hydro-plant",
        subgroup = "advanced-machine",
        order = "d",
    },
    {
        type = "item",
        name = "mechanical-plant",
        subgroup = "advanced-machine",
        order = "e",
    },
    {
        type = "item",
        name = "aop-electromechanic-facility",
        subgroup = "advanced-machine",
        order = "f",
    },
    {
        type = "item",
        name = "supermagnet",
        subgroup = "advanced-machine",
        order = "g",
    },
    {
        type = "recipe",
        name = "supermagnet",
        subgroup = "advanced-machine",
        order = "g",
    },
    {
        type = "item",
        name = "aop-quantum-assembler",
        subgroup = "advanced-machine",
        order = "h",
    },

    {
        type = "item",
        name = "lab",
        subgroup = "lab",
        order = "a",
    },
    {
        type = "item",
        name = "pressure-lab",
        subgroup = "lab",
        order = "b",
    },
    {
        type = "item",
        name = "biolab",
        subgroup = "lab",
        order = "c",
    },
    {
        type = "item",
        name = "cryolab",
        subgroup = "lab",
        order = "d",
    },
    {
        type = "item",
        name = "aop-quantum-computer",
        subgroup = "lab",
        order = "e",
    },
    {
        type = "item",
        name = "cerys-lab",
        subgroup = "lab",
        order = "z",
    },

    {
        type = "item",
        name = "beacon",
        subgroup = "beacon",
        order = "a"
    },
    {
        type = "item",
        name = "aop-transmitter",
        subgroup = "beacon",
        order = "b"
    },
    {
        type = "item",
        name = "maraxsis-conduit",
        subgroup = "beacon",
        order = "c"
    },
    {
        type = "item",
        name = "aop-quantum-stabilizer",
        subgroup = "beacon",
        order = "d"
    },
    
    {
        type = "item",
        name = "aop-scrubber",
        subgroup = "environmental-protection",
    },
    {
        type = "item",
        name = "flare-stack",
        subgroup = "environmental-protection",
    },
    
    {
        type = "module",
        name = "speed-module",
        subgroup = "speed-module",
    },
    {
        type = "module",
        name = "speed-module-2",
        subgroup = "speed-module",
    },
    {
        type = "module",
        name = "speed-module-3",
        subgroup = "speed-module",
    },
    {
        type = "module",
        name = "speed-module-4-S",
        subgroup = "speed-module",
    },
    {
        type = "module",
        name = "cerys-overclock-module",
        subgroup = "speed-module",
    },
    
    {
        type = "module",
        name = "efficiency-module",
        subgroup = "efficiency-module",
    },
    {
        type = "module",
        name = "efficiency-module-2",
        subgroup = "efficiency-module",
    },
    {
        type = "module",
        name = "efficiency-module-3",
        subgroup = "efficiency-module",
    },
    {
        type = "module",
        name = "efficiency-module-4-S",
        subgroup = "efficiency-module",
    },

    {
        type = "module",
        name = "productivity-module",
        subgroup = "productivity-module",
    },
    {
        type = "module",
        name = "productivity-module-2",
        subgroup = "productivity-module",
    },
    {
        type = "module",
        name = "productivity-module-3",
        subgroup = "productivity-module",
    },
    {
        type = "module",
        name = "productivity-module-4-S",
        subgroup = "productivity-module",
    },
    {
        type = "module",
        name = "cerys-radioactive-module-charged",
        subgroup = "productivity-module",
    },
    
    {
        type = "module",
        name = "degradation-module",
        subgroup = "degradation-module",
    },
    {
        type = "module",
        name = "degradation-module-2",
        subgroup = "degradation-module",
    },
    {
        type = "module",
        name = "degradation-module-3",
        subgroup = "degradation-module",
    },
    
    {
        type = "module",
        name = "quality-module",
        subgroup = "quality-module",
    },
    {
        type = "module",
        name = "quality-module-2",
        subgroup = "quality-module",
    },
    {
        type = "module",
        name = "quality-module-3",
        subgroup = "quality-module",
    },
    {
        type = "module",
        name = "quality-module-4-S",
        subgroup = "quality-module",
    },
}

for _,v in pairs(data) do
    data_util.conditional_modify(v)
end