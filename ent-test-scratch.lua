local surface = game.player.surface
local entities = surface.find_entities_filtered{area = area, type = 'tree'}
for _, e in pairs(entities) do
    if e.name then
        e.tree_color_index = 1
        e.graphics_variation = 1
        --e.tree_stage_index = 1
        --e.tree_gray_stage_index = 1 -- 1 to 15
    end
end
log(serpent.block(data.raw.tile["frozen-snow-1"]))
game.print(serpent.block(data.raw.tile["frozen-snow-1"]))
