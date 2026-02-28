function mk_game_state()
    
    local state = {
        player = mk_player(40,80),
        controller = mk_controller(mk_explore_controller()),
        load_zone = function(self,zone_def)
            log("loading zone")
            self.walls = load_walls(zone_def)
            self.npcs = load_npcs(zone_def)
            self.zone_map = zone_def.map
            logTbl(self.zone_map, "zone map")
        end,
        update = function(self)
            self.controller:run(self)
            handle_block_collisions(self)
            debug_controller(self)
        end,
        draw = function(self)
            camera(self.player.x-50,self.player.y-70)
            render_zone_map(self.zone_map)
            render_npcs(self.npcs)
            render_player(self.player)
            camera()
            if(self.loaded_dialogue) then
                render_dialogue(self.loaded_dialogue)
            end
            debug_draw(self)
            
        end
    }
    state:load_zone(zone2)

    return state
end

function render_zone_map(zone_map)
    map(zone_map.x,zone_map.y,0,0,zone_map.w,zone_map.h)
end

function render_npcs(npcs)
    foreach(npcs,function(n) spr(n.gid,n.world_position[1],n.world_position[2]) end)
end


function map_to_world(coord, zone_def)
    local origin_coord = {coord[1] - zone_def.map.x, coord[2] - zone_def.map.y}
    local world_coord = {origin_coord[1]*SPRITE_SIDE_LENGTH, origin_coord[2]*SPRITE_SIDE_LENGTH} 
    return world_coord
end

function load_walls(zone_def)
    log("loading walls")
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
    log(walls)
    return walls
end

function load_npcs(zone_def)
    log("loading npcs")
    local npcs = copyTbl(zone_def.npcs)
    foreach(npcs, function(npc)
        npc.world_position = map_to_world({npc.x,npc.y},zone_def)
    end)

    log(npcs)
    return npcs
end

function get_npc_positions(npcs)
    local positions = {}
    foreach(npcs,function(n) add(positions,n.world_position) end)
    return positions
end
-- load_zone(zone_def)
--- find walls
--- find npcs
-- collision detect against npcs and walls in loaded zone

-- find walls when zone first loads. Save coordinates in world space
-- find npcs when zone first loads. Save in world space

function debug_controller(state)
    if(btnp(INPUT.X)) then
        -- log('zone change')
        -- logTbl(state.zone.map)
        if(state.zone_map.x == 20) then
            state:load_zone(zone1)
            -- log('eep')
            -- state.zone = zone2
            -- state.player.x += zone2.map[1]*8
            -- state.player.y += zone2.map[2]*8
            
        
        else
            state:load_zone(zone2)
            -- log('bee')
            -- state.zone = zone1
            -- state.player.x -= zone2.map[1]*8
            -- state.player.y -= zone2.map[2]*8
        end
    end
end

function debug_draw(state)
    if(state.zone == zone1) print('zone 1',2,2,COLOR.BLACK)
    if(state.zone == zone2) print('zone 2',2,2,COLOR.BLACK)
end