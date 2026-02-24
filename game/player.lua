function mk_player(x,y)
	return {
		x=x,
		y=y,
		facing=FACING.LEFT,
		left_col= function(self) return {self.x+1,self.y+4,self.x+2,self.y+5} end,
		top_col = function(self) return {self.x+3,self.y+2,self.x+4,self.y+3} end,
		right_col= function(self) return {self.x+5,self.y+4,self.x+6,self.y+5} end,
		bottom_col= function(self) return {self.x+3,self.y+6,self.x+4,self.y+7} end,
		interact_point= function(self) 
			local facing = self.facing
			if(facing == FACING.LEFT) return {self.x-4, self.y+4}
			if(facing == FACING.UP) return {self.x+4, self.y-4}
			if(facing == FACING.RIGHT) return {self.x+12, self.y+4}
			if(facing == FACING.DOWN) return {self.x+4, self.y+12}
		end
	}
end

function render_player(player)
	local gfx
	if(player.facing == FACING.LEFT) gfx = PLAYER_GFX.LEFT
	if(player.facing == FACING.DOWN) gfx = PLAYER_GFX.DOWN
	if(player.facing == FACING.RIGHT) gfx = PLAYER_GFX.RIGHT
	if(player.facing == FACING.UP) gfx = PLAYER_GFX.UP
	spr(gfx,player.x,player.y)
	local ip = player:interact_point()
	pset(ip[1],ip[2],COLOR.RED)
end

PLAYER_GFX = {
	LEFT = 19,
	DOWN = 20,
	RIGHT = 21,
	UP = 22
}