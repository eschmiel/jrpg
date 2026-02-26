-- options {
--	state
--	speaker
-- }
function mk_dialogue_controller(options)
	options.state.loaded_dialogue = mk_dialogue(options.speaker)
	return {
		run = function(state)
			local obj = state.loaded_dialogue
			if(btnp(INPUT.O)) then
				if(obj.current >= #obj.dialogue) then
					state.loaded_dialogue = nil
					state.controller:switch(CONTROLLERS.EXPLORER, {state=state})
				else
					obj.current +=1
				end
			end
		end,
		stop = function(options) 
			options.state.loaded_dialogue = nil
		end
	}
end