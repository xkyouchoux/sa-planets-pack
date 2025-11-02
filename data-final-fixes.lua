local asteroid_stream = require("__Better-Planets__.scripts.asteroid-streams")

asteroid_stream.copy_many({
    {
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
    }
})