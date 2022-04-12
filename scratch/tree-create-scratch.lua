local dec = {
    {
        "tree-09",
        "tree-09-brown",
        "tree-09-red",
        "tree-desert-l",
        "tree-desert-n",
        "tree-desert-j",
    },
    {
        "tree-08",
        "tree-08-red",
        "tree-08-brown",
        "tree-desert-a",
        "tree-desert-e",
        "tree-dryland-f",
        "tree-grassland-j",
    },
    {
        "tree-04",
        "tree-dryland-b",
        "tree-dryland-d",
        "tree-dryland-h",
        "tree-grassland-h2",
        "tree-wetland-e",
    },
    {
        "tree-desert-h",
        "tree-desert-k",
        "tree-desert-m",
    },
    {
        "tree-02",
        "tree-02-red",
        "tree-grassland-k",
        "tree-grassland-o",
    },
    {
        "tree-03",
        "tree-wetland-k",
    },
    {
        "tree-07",
        "tree-wetland-m",
        "tree-wetland-h",
    },
    {
        "tree-05",
        "tree-grassland-h",
        "tree-grassland-p",
        "tree-wetland-g",
        "tree-wetland-c",
    },
    {
        "tree-desert-c",
        "tree-desert-i",
        "tree-grassland-i",
        "tree-grassland-n",
        "tree-dryland-k",
    },
    {
        "tree-grassland-e",
        "tree-grassland-h3",
        "tree-dryland-m",
        "tree-dryland-c",
        "tree-grassland-b",
    },
    {
        "tree-desert-f",
        "tree-desert-b",
        "tree-desert-d",
    },
    {
        "tree-dryland-e",
        "tree-dryland-g",
        "tree-grassland-c",
        "tree-wetland-l",
        "tree-wetland-a",
    },
    {
        "tree-wetland-n",
        "tree-wetland-f",
        "tree-wetland-i",
    },
    {
        "tree-wetland-d",
        "tree-grassland-q",
        "tree-wetland-b",
        "tree-grassland-l",
    },
    {
        "tree-grassland-g",
        "tree-grassland-a",
        "tree-grassland-d",
        "tree-wetland-j",
        "tree-grassland-m",
        "tree-grassland-f"
    },
}

--- Clear
local entities = game.player.surface.find_entities_filtered{area = area, type = 'tree'}
for _, e in pairs(entities) do
    e.destroy()
end

--- Place trees aligned
local xStart = area.left_top[1]
local yStart = area.left_top[2]
for groupI=1,#dec do
    for treeJ=1,#dec[groupI] do
        local treeName = dec[groupI][treeJ]
        local y = yStart + groupI * 17
        local x = xStart + treeJ * 13
        for i=0,4 do
            for j=0,4 do
                game.player.surface.create_entity{name = treeName, position = {x = x+i*2, y = y+j*2}}
            end
        end
    end
end
