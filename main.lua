function _init()
    local init_state = mk_title_state()
    state_manager = mk_state_manager(init_state)
end

function _update()
    state_manager:update()
end

function _draw()
    cls()
    state_manager:draw()
end

