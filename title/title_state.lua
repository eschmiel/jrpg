function mk_title_state()
    -- init logic goes here
    
    return
    {
        update = function(self)
            if(btnp(INPUT.X)) then
                game_state = mk_narrative_state()
                state_manager:switch(game_state)
                sfx(0)
            end
        end,

        draw = function(self)
            print("death machine 5000", 44, 64, 7)
            print("press X to die", 50, 74, 8)
        end
    }
end