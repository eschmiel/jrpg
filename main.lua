function _init()
    palt(0,false)
    palt(MAIN_TRANSPARENCY, true)
    local init_state = mk_game_state()
    state_manager = mk_state_manager(init_state)
end

function _update()
    state_manager:update()
end

function _draw()
    cls()
    state_manager:draw()
    draw_screen_edge()
end

