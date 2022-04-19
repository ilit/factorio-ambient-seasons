local accents = {
    "D", "T",
    "DD", "TT", "DT",
    "DDT", "DTT",
}
local hues = { 1, 2, 3 }
local harmonyRules = { "Anlh", "Dvrg"}

local configs = {}
for _, accentCfg in pairs(accents) do
    for _, hueCfg in pairs(hues) do
        if (string.len(accentCfg) <= hueCfg) then
            if (hueCfg > 1) then
                for _, ruleCfg in pairs(harmonyRules) do
                    local singleConfig = {}
                    singleConfig.hues = hueCfg
                    singleConfig.accents = accentCfg
                    singleConfig.rule = ruleCfg
                    --- Some rule cfg
                    configs[#configs+1] = singleConfig
                end
            else
                local singleConfig = {}
                singleConfig.hues = hueCfg
                singleConfig.accents = accentCfg
                --- Empty rule cfg
                configs[#configs+1] = singleConfig
            end
        end
    end
end

for i, cfg in ipairs(configs) do
    if (cfg.rule == nil) then
        cfg.rule = ""
    end
    print(i.."  "..cfg.accents.."-H"..cfg.hues.."-".. cfg.rule)
end
