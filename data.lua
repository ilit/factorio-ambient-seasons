local noise = require("noise");
local tne = noise.to_noise_expression

data:extend{
    {
        type = "noise-expression",
        name = "n1",
        intended_property = "n1",
        expression = {
            type = "function-application",
            function_name = "factorio-basis-noise",
            arguments = {
                x = noise.var("x"),
                y = noise.var("y"),
                seed0 = tne(noise.var("map_seed")), -- i.e. map.seed
                seed1 = tne(123), -- Some random number
                input_scale = noise.var("segmentation_multiplier")/90,
                output_scale = 90/noise.var("segmentation_multiplier")
            }
        }
    }
}
data.raw["noise-expression"]["n1"].expression = noise.var("n1")
