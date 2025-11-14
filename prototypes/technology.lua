data:extend({
    {
        type = "technology",
        name = "gold-smelting",
        icon_size = 256,
        icon = "__secretas__/graphics/technology/gold-plate-productivity.png",
        essential = true,
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "gold-plate"
            },
            {
                type = "unlock-recipe",
                recipe = "gold-ore-melting"
            },
            {
                type = "unlock-recipe",
                recipe = "casting-gold"
            },
        },
        research_trigger =
        {
            type = "craft-item",
            item = "gold-ore",
            count = 4
        },
        prerequisites = { "steam-recycler"}
    },
})