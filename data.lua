local colors = {}

--for i=1,255,10 do
--    colors[#colors + 1] = {
--        r = i,
--        g = 0,
--        b = 0
--    }
--    weights[#weights + 1] = 1
--end
colors[1] = {
    r = 0x99,
    g = 0x6E,
    b = 0x1F
}
colors[2] = {
    r = 0x5C,
    g = 0xE6,
    b = 0x9D
}
colors[3] = {
    r = 0xE6,
    g = 0xAF,
    b = 0x46
}
colors[4] = {
    r = 0xA2,
    g = 0x2E,
    b = 0xE6
}
colors[5] = {
    r = 0xFF,
    g = 0x00,
    b = 0x00
}

data.raw["tree"]["tree-01"].colors = colors
data.raw["tile"]["vegetation-olive-grass-2"].tint = colors[1]
data.raw["tile"]["vegetation-olive-grass-1"].tint = colors[4]

local pictures = data.raw["optimized-decorative"]["brown-hairy-grass"].pictures
for i=2,#pictures do
    data.raw["optimized-decorative"]["brown-hairy-grass"].pictures[i] = nil
end
data.raw["optimized-decorative"]["brown-hairy-grass"].pictures[1].tint = {
    r = 0xFF,
    g = 0x00,
    b = 0x00
}
