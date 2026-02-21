function mk_game_state()
    return
    {
        player = mk_player(40,80),
        controller = mk_explore_controller(),
        update = function(self)
            self.controller.run(self)
            -- local walls = find_walls(self.player)
            -- handle_left_col(self.player,walls)
            -- handle_top_col(self.player, walls)
            -- handle_right_col(self.player,walls)
            -- handle_bottom_col(self.player,walls)
        end,

        draw = function(self)
            -- camera(self.player.x-50,self.player.y-70)
            map(0,0,0,0)
            render_player(self.player)
            local walls = find_walls(self.player)
        --     foreach(walls,function(w)
        --         render_box(get_tile_box(w))
        -- end)
            handle_left_col(self.player,walls)
            handle_top_col(self.player, walls)
            handle_right_col(self.player,walls)
            handle_bottom_col(self.player,walls)
        end
    }
end