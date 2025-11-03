if settings.startup["spp-tweak-rubia-efficiency-module"].value then
    data.raw["module"]["rubia-efficiency-module4"].icon = "__sa-planets-pack__/graphics/icons/undervolt-module.png"
    data.raw["module"]["rubia-efficiency-module4"].effect = { consumption = -1, speed = -.05 }
    data.raw["recipe"]["rubia-efficiency-module4"].ingredients = {
        {type = "item", name = "advanced-circuit", amount = 4},
        {type = "item", name = "processing-unit", amount = 4},
        {type = "item", name = "efficiency-module-2", amount = 4},
        {type = "item", name = "craptonite-frame", amount = 5}
    }
    data.raw["technology"]["rubia-efficiency-module4"].icon = "__sa-planets-pack__/graphics/technology/undervolt-module.png"
end