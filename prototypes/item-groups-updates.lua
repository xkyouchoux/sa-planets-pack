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
        order = "a[furnace]-a[stone-furnace]",
    },
    {
        type = "item",
        name = "muluna-steam-stone-furnace",
        subgroup = "smelting-machine",
        order = "a[furnace]-a[stone-furnace]-steam",
    },
    {
        type = "item",
        name = "steel-furnace",
        subgroup = "smelting-machine",
        order = "a[furnace]-b[steel-furnace]",
    },
    {
        type = "item",
        name = "muluna-steam-steel-furnace",
        subgroup = "smelting-machine",
        order = "a[furnace]-b[steel-furnace]-steam",
    },
    {
        type = "item",
        name = "electric-furnace",
        subgroup = "smelting-machine",
        order = "a[furnace]-c[electric-furnace]",
    },
    {
        type = "item",
        name = "calciner",
        subgroup = "smelting-machine",
        order = "a[furnace]-d[calciner]",
    },
    {
        type = "item",
        name = "aop-arc-furnace",
        subgroup = "smelting-machine",
        order = "a[furnace]-e[arc-furnace]",
    },
    {
        type = "item",
        name = "foundry",
        subgroup = "smelting-machine",
        order = "b[foundry]-a[foundry]",
    },
    {
        type = "item",
        name = "vesta-combustion-furnace",
        subgroup = "smelting-machine",
        order = "c[combustion-furnace]-a[combustion-furnace]",
    },
    {
        type = "recipe",
        name = "vesta-combustion-furnace",
        subgroup = "smelting-machine",
        order = "c[combustion-furnace]-a[combustion-furnace]",
    },

    {
        type = "item",
        name = "crusher",
        subgroup = "smelting-machine",
        order = "d[crusher]-a[crusher]",
    },
    {
        type = "recipe",
        name = "crusher",
        subgroup = "smelting-machine",
        order = "d[crusher]-a[crusher]",
    },
    {
        type = "item",
        name = "muluna-steam-crusher",
        subgroup = "smelting-machine",
        order = "d[crusher]-a[crusher]-steam",
    },
    {
        type = "recipe",
        name = "muluna-steam-crusher",
        subgroup = "crushing-machine",
        subgroup = "smelting-machine",
        order = "d[crusher]-a[crusher]-steam",
    },
    {
        type = "item",
        name = "crusher-2",
        subgroup = "crushing-machine",
        subgroup = "smelting-machine",
        order = "d[crusher]-b[crusher-2]",
    },
    {
        type = "recipe",
        name = "crusher-2",
        subgroup = "smelting-machine",
        order = "d[crusher]-b[crusher-2]",
    },

    {
        type = "item",
        name = "recycler",
        subgroup = "smelting-machine",
        order = "e[recycler]-a[recycler]",
    },
    {
        type = "item",
        name = "steam-recycler",
        subgroup = "smelting-machine",
        order = "e[recycler]-a[recycler]-steam",
    },
    {
        type = "item",
        name = "aop-salvager",
        subgroup = "smelting-machine",
        order = "e[recycler]-b[salvager]",
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
        order = "a[assembling-machine]-a[assembling-machine-1]",
    },
    {
        type = "item",
        name = "assembling-machine-2",
        subgroup = "assembling-machine",
        order = "a[assembling-machine]-b[assembling-machine-2]",
    },
    {
        type = "item",
        name = "assembling-machine-3",
        subgroup = "assembling-machine",
        order = "a[assembling-machine]-c[assembling-machine-3]",
    },
    {
        type = "item",
        name = "diesel-assembling-machine",
        subgroup = "assembling-machine",
        order = "a[assembling-machine]-c[assembling-machine-3]-diesel",
    },
    {
        type = "item",
        name = "aop-advanced-assembling-machine",
        subgroup = "assembling-machine",
        order = "a[assembling-machine]-d[advanced-assembling-machine]",
    },
    {
        type = "item",
        name = "barreling-machine",
        subgroup = "assembling-machine",
        order = "b[barreling-machine]-a[barreling-machine]",
    },
    {
        type = "item",
        name = "centrifuge",
        subgroup = "assembling-machine",
        order = "c[centrifuge]-a[centrifuge]",
    },
    {
        type = "item",
        name = "atan-atom-forge",
        subgroup = "assembling-machine",
        order = "c[centrifuge]-b[atom-forge]",
    },
    {
        type = "item",
        name = "aop-armory",
        subgroup = "assembling-machine",
        order = "d[mechanical]-a[armory]",
    },
    {
        type = "item",
        name = "mechanical-plant",
        subgroup = "assembling-machine",
        order = "d[mechanical]-b[mechanical-plant]",
    },
    {
        type = "item",
        name = "electromagnetic-plant",
        subgroup = "assembling-machine",
        order = "e[electrical]-a[electromagnetic-plant]",
    },
    {
        type = "item",
        name = "aop-electromechanic-facility",
        subgroup = "assembling-machine",
        order = "e[electrical]-b[electromechanic-facility]",
    },
    {
        type = "item",
        name = "supermagnet",
        subgroup = "assembling-machine",
        order = "e[electrical]-c[supermagnet]",
    },
    {
        type = "recipe",
        name = "supermagnet",
        subgroup = "assembling-machine",
        order = "e[electrical]-c[supermagnet]",
    },
    {
        type = "item",
        name = "aop-quantum-assembler",
        subgroup = "assembling-machine",
        order = "f[quantum]-a[quantum-assembler]",
    },

    {
        type = "item",
        name = "oil-refinery",
        subgroup = "chemistry",
        order = "a[petrochemistry]-a[oil-refinery]",
    },
    {
        type = "item",
        name = "aop-petrochemical-facility",
        subgroup = "chemistry",
        order = "a[petrochemistry]-a[petrochemical-facility]",
    },
    {
        type = "item",
        name = "chemical-plant",
        subgroup = "chemistry",
        order = "b[chemistry]-a[chemical-plant]",
    },
    {
        type = "item",
        name = "catalytic-chemical-plant",
        subgroup = "chemistry",
        order = "b[chemistry]-b[catalytic-chemical-plant]",
    },
    {
        type = "item",
        name = "electrochemical-plant",
        subgroup = "chemistry",
        order = "b[chemistry]-c[electrochemical-plant]",
    },
    {
        type = "item",
        name = "maraxsis-hydro-plant",
        subgroup = "chemistry",
        order = "b[chemistry]-d[hydro-plant]",
    },
    {
        type = "item",
        name = "cryogenic-plant",
        subgroup = "chemistry",
        order = "b[chemistry]-e[cryogenic-plant]",
    },
    {
        type = "item",
        name = "aop-mineral-synthesizer",
        subgroup = "chemistry",
        order = "b[chemistry]-f[mineral-synthesizer]",
    },
    {
        type = "item",
        name = "vesta-electrolyzer",
        subgroup = "chemistry",
        order = "c[electrolyzer]-a[electrolyzer]",
    },
    {
        type = "recipe",
        name = "vesta-electrolyzer",
        subgroup = "chemistry",
        order = "c[electrolyzer]-a[electrolyzer]",
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
}

for _,v in pairs(data) do
    data_util.conditional_modify(v)
end