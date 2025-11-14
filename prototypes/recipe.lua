data:extend({
    {
        type = "recipe",
        name = "molten-gold",
        localised_name = {"fluid-name.gold-ore-melting"},
        --icon = "__sa-planets-pack__/graphics/icons/gold-ore-melting.png",
        category = "metallurgy",
        subgroup = "vulcanus-processes",
        order = "a[melting]-e[molten-gold]",
        auto_recycle = false,
        show_amount_in_title = false,
        always_show_products = true,
        enabled = false,
        ingredients = {
            {type = "item", name = "gold-ore", amount = 50},
            {type = "item", name = "calcite", amount = 1},
        },
        energy_required = 32,
        results = {
            {type = "fluid", name = "molten-gold", amount = 125},
        },
        allow_productivity = true,
        hide_from_signal_gui = false,
        main_product =  "molten-gold"
    },
    {
        type = "recipe",
        name = "casting-gold",
        category = "metallurgy",
        subgroup = "vulcanus-processes",
        order = "b[casting]-c[casting-gold]",
        icon = "__sa-planets-pack__/graphics/icons/molten-gold.png",
        enabled = false,
        ingredients = {
            {type = "fluid", name = "molten-gold", amount = 20, fluidbox_multiplier = 10},
        },
        energy_required = 3.2,
        allow_decomposition = false,
        results = {{type = "item", name = "gold-plate", amount = 2}},
        allow_productivity = true
    },
})