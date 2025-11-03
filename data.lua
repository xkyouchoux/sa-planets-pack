require("prototypes.technology")

if settings.startup["spp-rubia-disable-efficiency-module-4"].value then
    data.raw["item"]["rubia-efficiency-module4"] = nil
    data.raw["recipe"]["rubia-efficiency-module4"] = nil
    data.raw["technology"]["rubia-efficiency-module4"] = nil
end
