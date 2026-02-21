function mk_game_state()
    return
    {
        player = mk_player(40,80),
        controller = mk_explore_controller(),
        update = function(self)
            self.controller.run(self)
            -- handle_wall_collisions(self)
            handle_block_collisions(self)
        end,

        draw = function(self)
            -- camera(self.player.x-50,self.player.y-70)
            map(0,0,0,0)
            render_player(self.player)
            foreach(zone.npcs, function(npc)
                m_spr(npc.gid,npc.x,npc.y)
            end)
        end
    }
end



zone = {
    map = { 0,0 },
    npcs = {
        {
            gid = 3,
            -- We'll use map coordinates for NPCs to make them easier to place in relation to the map.
            x = 11,
            y= 9
        },
        {
            gid = 3,
            -- We'll use map coordinates for NPCs to make them easier to place in relation to the map.
            x = 7,
            y= 2
        }
    }
}

function m_spr(gid,x,y)
    spr(gid,x*8,y*8)
end