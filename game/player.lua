function mk_player(x,y)
	return {
		x=x,
		y=y,
		wall_colliders = function(self)
			return{
				{self.x+2,self.y+5,2,2},
				{self.x+4,self.y+3,2,2},
				{self.x+6,self.y+3,2,2},
				{self.x+3,self.y+3,3,2}
			}
		end
	}
end

function render_player(player)
	spr(1,player.x,player.y)
end

-- left, top and right bounding boxes are all 2px wide and 2px tall

function find_walls(player)
	local mx = flr(player.x/8)-2
	local my = flr(player.y/8)-2
	local walls = {}
	for y=1, 3 do
		for x=1, 3 do
			local tile = mget(mx+x,my+y)
			if(fget(tile,WAll_FLAG)) add(walls, {mx+x,my+y})
		end
	end

	return walls
end

function get_tile_box(tile)			
	return {tile[1]*8,tile[2]*8,(tile[1]+1)*8,(tile[2]+1)*8}
end

function handle_left_col(player, walls)
	p_box = {player.x+1,player.y+4,player.x+2,player.y+5}
	foreach(walls, function(w)
		local w_box = get_tile_box(w)
		if(aa_bb(p_box,w_box)) player.x=w_box[3]
	end)
end
function handle_top_col(player, walls)
	p_box = {player.x+3,player.y+2,player.x+4,player.y+3}
	foreach(walls, function(w)
		local w_box = get_tile_box(w)
		if(aa_bb(p_box,w_box)) player.y=w_box[4]-2
	end)
end
function handle_right_col(player, walls)
	p_box = {player.x+5,player.y+4,player.x+6,player.y+5}
	foreach(walls, function(w)
		local w_box = get_tile_box(w)
		if(aa_bb(p_box,w_box)) player.x=w_box[1]-7
	end)
end

function handle_bottom_col(player, walls)
	p_box = {player.x+3,player.y+6,player.x+4,player.y+7}
	foreach(walls, function(w)
		local w_box = get_tile_box(w)
		if(aa_bb(p_box,w_box)) player.y=w_box[2]-8
	end)
end