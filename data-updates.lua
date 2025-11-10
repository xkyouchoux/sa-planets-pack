require("prototypes.item-groups-updates")

local data_util = require("__sa-planets-pack__.data_util")

for _,recipe in pairs({
    "mixed-oxide-reactor-equipment",
    "fusion-reactor-equipment-from-mixed-oxide"
}) do
    data.raw["recipe"][recipe].category = "advanced-centrifuging-or-crafting-or-electromechanics"
end