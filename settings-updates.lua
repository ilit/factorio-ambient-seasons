------
--- Force Disable\Enable Alien-Biome sand and dirt tiles
------
local tilesToDisable =
{
    "dirt-aubergine",
    "dirt-beige",
    --"dirt-black", still used for volcanic
    "dirt-brown",
    "dirt-cream",
    "dirt-dustyrose",
    "dirt-grey",
    "dirt-purple",
    "dirt-red",
    "dirt-tan",
    "dirt-violet",
    "dirt-white",
    "frozen",

    "sand-aubergine",
    "sand-beige",
    --"sand-black", still used for volcanic
    "sand-brown",
    "sand-cream",
    "sand-dustyrose",
    "sand-grey",
    "sand-purple",
    "sand-red",
    "sand-tan",
    "sand-violet",
    "sand-white",
}
local tilesToEnable =
{
  "frozen",
  "grass-blue",
  "grass-green",
  "grass-mauve",
  "grass-olive",
  "grass-orange",
  "grass-purple",
  "grass-red",
  "grass-turquoise",
  "grass-violet",
  "grass-yellow",
}
local restrictVals = function(tiles, val)
    for _, tile in pairs(tiles) do
        local settingName = "alien-biomes-include-" .. tile
        data.raw["string-setting"][settingName].allowed_values = { val }
        data.raw["string-setting"][settingName].default_value = val

        log(tile)
        log(serpent.block(data.raw["string-setting"][settingName].allowed_values))
        log("")
    end
end

restrictVals(tilesToDisable, "Disabled")
restrictVals(tilesToEnable, "Enabled")

data.raw["string-setting"]["alien-biomes-disable-vegetation"].allowed_values = { "Disabled" }
data.raw["string-setting"]["alien-biomes-disable-vegetation"].default_value = "Disabled"