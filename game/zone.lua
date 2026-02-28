-- loading

function load_walls(zone_def)
    local walls = {}
    for x=0, zone_def.map.w-1 do
        for y=0, zone_def.map.h-1 do
            local map_x = x+zone_def.map.x
            local map_y = y+zone_def.map.y
            local tile = mget(map_x,map_y)
            if(fget(tile,WAll_FLAG)) then
                local wall_position = map_to_world({map_x, map_y},zone_def)
                add(walls,wall_position)
            end
        end
    end 
    return walls
end

function load_npcs(zone_def)
    local npcs = copyTbl(zone_def.npcs)
    foreach(npcs, function(npc)
        npc.world_position = map_to_world({npc.x,npc.y},zone_def)
    end)

    return npcs
end

-- util

function map_to_world(coord, zone_def)
    local origin_coord = {coord[1] - zone_def.map.x, coord[2] - zone_def.map.y}
    local world_coord = {origin_coord[1]*SPRITE_SIDE_LENGTH, origin_coord[2]*SPRITE_SIDE_LENGTH} 
    return world_coord
end

function get_npc_positions(npcs)
    local positions = {}
    foreach(npcs,function(n) add(positions,n.world_position) end)
    return positions
end

-- rendering

function render_zone_map(zone_map)
    map(zone_map.x,zone_map.y,0,0,zone_map.w,zone_map.h)
end

function render_npcs(npcs)
    foreach(npcs,function(n) spr(n.gid,n.world_position[1],n.world_position[2]) end)
end