local colors = data.raw["tree"]["tree-02"].colors
colors[#colors + 1] = {
    b = 255,
    g = 255,
    r = 255
}
colors[#colors + 1] = {
    b = 255,
    g = 255,
    r = 255
}
colors[#colors + 1] = {
    b = 255,
    g = 255,
    r = 255
}
colors[#colors + 1] = {
    b = 255,
    g = 255,
    r = 255
}
colors[#colors + 1] = {
    b = 255,
    g = 255,
    r = 255
}
data.raw["tree"]["tree-01"].colors = colors

log(serpent.block(data.raw.tile["frozen-snow-1"]))