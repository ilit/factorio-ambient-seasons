local colors = data.raw["tree"]["tree-01"].colors
colors[#colors + 1] = {
    b = 255,
    g = 255,
    r = 255
}
colors[#colors + 1] = {
    b = 0,
    g = 0,
    r = 255
}
data.raw["tree"]["tree-01"].colors = colors
