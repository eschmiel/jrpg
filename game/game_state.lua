function mk_game_state()
    
    local state = {
        player = mk_player(40,80),
        controller = mk_controller(mk_explore_controller()),
        load_zone = function(self,zone_def)
            self.walls = load_walls(zone_def)
            self.npcs = load_npcs(zone_def)
            self.zone_map = zone_def.map
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