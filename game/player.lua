function mk_player(x,y)
	return {
		x=x,
		y=y,
		left_col= function(self) return {self.x+1,self.y+4,self.x+2,self.y+5} end,
		top_col = function(self) return {self.x+3,self.y+2,self.x+4,self.y+3} end,
		right_col= function(self) return {self.x+5,self.y+4,self.x+6,self.y+5} end,
		bottom_col= function(self) return {self.x+3,self.y+6,self.x+4,self.y+7} end
	}
end

function render_player(player)
	spr(1,player.x,player.y)
end