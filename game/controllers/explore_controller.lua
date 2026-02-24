function mk_explore_controller()
	return {
		run = function(state)
			local p = state.player
			if(btn(INPUT.DOWN))  then
				p.y +=1
				p.facing=FACING.DOWN
			end
			if(btn(INPUT.UP))  then
				p.y -=1
				p.facing=FACING.UP
			end
			if(btn(INPUT.RIGHT))  then
				p.x +=1
				p.facing=FACING.RIGHT
			end
			if(btn(INPUT.LEFT))  then
				p.x -=1
				p.facing=FACING.LEFT
			end
			if(btnp(INPUT.X)) then

			end
			if(btnp(INPUT.O)) then
				sfx(0)
				local npc = check_npc_interact(state)
				if(npc) then
					state.loaded_dialogue = {
						current = 1,
						dialogue=npc.dialogue,
						get_current_dialogue = function(self) return self.dialogue[self.current] end
					}
					state.controller = mk_dialogue_controller()

				-- printh(rnd(1),"log",true,true)
				-- printh(state.loaded_dialogue[1].text[1],'log',false,true)
				end
			end
		end
	}
end

-- on O press
-- check to see if interaction collider is colliding with any npcs
-- if so:
-- - switch to dialogue controls
-- - load collided npc's dialogue 
-- - create text box and display loaded dialogue
-- - iterate through dialogue on O press
-- - unload dialogue, remove text box and switch back to explore controls at end of dialogue
-- controller state manager

function check_npc_interact(state)
	local int_p = state.player:interact_point()
	for npc in all(zone.npcs) do
		local b_box = get_tile_box({npc.x,npc.y})
		if(point_in_bb(int_p,b_box)) return npc
	end
	return false
end