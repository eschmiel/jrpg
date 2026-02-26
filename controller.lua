function mk_controller(init)
	return {
		controller = init,
		run = function(self, state)
			self.controller.run(state)
		end,
		switch = function(self, controller, options)
			if (not tbl_contains(CONTROLLERS, controller)) then
				printh(rnd(1),"log",true,true)
				printh("Tried to switch to a controller that doesn't exist", "log",false, true)
				printh(controller, "log",false, true)
				return
			end
			self.controller.stop(options)
			if (controller == CONTROLLERS.EXPLORER) then
				self.controller = mk_explore_controller()
			elseif (controller == CONTROLLERS.DIALOGUE )then
				self.controller = mk_dialogue_controller(options)
			end
		end
	}
end