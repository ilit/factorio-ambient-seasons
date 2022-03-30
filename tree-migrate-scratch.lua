function migrateTree(tree, from, to)
    local position = tree.position
    game.print(tree.name)
    if string.find(tree.name, from) then
        tree.destroy()
        game.player.surface.create_entity{name = to, position = position}
    end
end
    
local entities = game.player.surface.find_entities_filtered{area = area, type = 'tree'}
for k, tree in pairs(entities) do
    migrateTree(tree, "^tree[-]desert[-].", 'dead-tree-desert')
    migrateTree(tree, "^tree[-]palm[-].", 'dead-tree-desert')
end