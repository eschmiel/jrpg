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
					state.controller:switch(CONTROLLERS.DIALOGUE,{state=state,speaker=npc})
				end
			end
		end,
		stop = function()

		end
	}
end

function check_npc_interact(state)
	local int_p = state.player:interact_point()
	for npc in all(state.npcs) do
		local b_box = get_sprite_box(npc.world_position)
		if(point_in_bb(int_p,b_box)) return npc
	end
	return false
end