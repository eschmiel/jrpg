function mk_state_manager(init_state) 
    return {
        state = init_state,
        switch = function(self, new_state)
            self.state = new_state
        end,
        update = function(self)
            self.state:update()
        end,
        draw = function(self)
            self.state:draw()
        end
    }
end