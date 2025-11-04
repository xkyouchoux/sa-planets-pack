require("prototypes.technology-final-fixes")

data.raw["tool"]["electrochemical-science-pack"].order = "b-f"

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