function mk_game_state()
    return
    {
        player = mk_player(40,80),
        controller = mk_controller(mk_explore_controller()),
        update = function(self)
            self.controller:run(self)
            handle_block_collisions(self)
        end,

        draw = function(self)
            -- camera(self.player.x-50,self.player.y-70)
            map(0,0,0,0)
            render_player(self.player)
            foreach(zone.npcs, function(npc)
                m_spr(npc.gid,npc.x,npc.y)
            end)
            if(self.loaded_dialogue) then
                render_dialogue(self.loaded_dialogue)
            end
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
            y= 9,
            dialogue={
                {
                    name='Boris',
                    text={
                        'Hello, I am Boris.'
                    }
                },
                {
                    name='Boris',
                    text={
                        'Are you not entertained?!'
                    }
                }
            }
        },
        {
            gid = 3,
            -- We'll use map coordinates for NPCs to make them easier to place in relation to the map.
            x = 7,
            y= 2,
            dialogue={
                {
                    name='Long Winded Man',
                    text={
                        'You must journey',
                        "to the center of the world.",
                        "aggg"
                    }
                },
                {
                    name='Long Winded Man',
                    text={
                        'There you will find a man named',
                        'Boris.',
                        'He will entertain you'
                    }
                },
                {
                    name='Long Winded Man',
                    text={
                        'Guffaw or perish',
                    }
                }
            }
        }
    }
}

function m_spr(gid,x,y)
    spr(gid,x*8,y*8)
end