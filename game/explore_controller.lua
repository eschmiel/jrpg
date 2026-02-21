function mk_explore_controller()
	return {
		run = function(state)
			if(btn(INPUT.DOWN))  then
				state.player.y +=1
			end
			if(btn(INPUT.UP))  then
				state.player.y -=1
			end
			if(btn(INPUT.RIGHT))  then
				state.player.x +=1
			end
			if(btn(INPUT.LEFT))  then
				state.player.x -=1
			end
			if(btnp(INPUT.X)) then

			end
			if(btnp(INPUT.O)) then

			end
		end
	}
end