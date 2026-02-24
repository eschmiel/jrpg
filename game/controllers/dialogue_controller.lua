function mk_dialogue_controller()
		return {
		run = function(state)
			local obj = state.loaded_dialogue
			if(btnp(INPUT.O)) then
				if(obj.current >= #obj.dialogue) then
					state.loaded_dialogue = nil
					state.controller = mk_explore_controller()
				else
					obj.current +=1
				end
			end
		end
	}
end