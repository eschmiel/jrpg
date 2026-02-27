function mk_game_state()
    return
    {
        zone = zone2,
        player = mk_player(zone2.map[1]*8+40,zone2.map[2]*8+80),
        controller = mk_controller(mk_explore_controller()),
        update = function(self)
            self.controller:run(self)
            handle_block_collisions(self)
            debug_controller(self)
        end,

        draw = function(self)
            
            camera(self.zone.map[1]*8 , self.zone.map[2]*8)
            -- camera(self.player.x-50,self.player.y-70)
            render_zone(self.zone)
            render_player(self.player)
            camera()
            if(self.loaded_dialogue) then
                render_dialogue(self.loaded_dialogue)
            end
            debug_draw(self)
            
        end
    }
end

function render_zone(zone)
    map(zone.map[1],zone.map[2],zone.map[1]*8,zone.map[2]*8)
    foreach(zone.npcs, function(npc)
        m_spr(npc.gid,npc.x,npc.y)
    end)

end

function m_spr(gid,x,y)
    spr(gid,x*8,y*8)
end

function debug_controller(state)
    if(btnp(INPUT.X)) then
        log('zone change')
        logTbl(state.zone.map)
        if(state.zone == zone1) then
            log('eep')
            state.zone = zone2
            state.player.x += zone2.map[1]*8
            state.player.y += zone2.map[2]*8
            
        
        elseif(state.zone == zone2) then
            log('bee')
            state.zone = zone1
            state.player.x -= zone2.map[1]*8
            state.player.y -= zone2.map[2]*8
        end
    end
end

function debug_draw(state)
    if(state.zone == zone1) print('zone 1',2,2,COLOR.BLACK)
    if(state.zone == zone2) print('zone 2',2,2,COLOR.BLACK)
end