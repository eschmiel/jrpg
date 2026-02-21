function handle_block_collisions(state)
    local p = state.player
    local walls = find_walls(p)
    local npcs = zone.npcs
    local npc_tiles = get_npc_tiles(npcs)
    local blockers = concat_tbl(walls,npc_tiles)
    -- printh(rnd(1),"log",true,true)
    -- printh(#blockers, "log",false, true)

    -- if(blockers[3]) printh(blockers[1][1], "log",false, true)
    foreach(blockers, function(b)
    	local b_box = get_tile_box(b)
    	handle_left_block_col(p,b_box)
    	handle_top_block_col(p,b_box)
    	handle_right_block_col(p,b_box)
    	handle_bottom_block_col(p,b_box)
	end)
    -- handle_left_col(p,walls)
    -- handle_top_col(p, walls)
    -- handle_right_col(p,walls)
    -- handle_bottom_col(p,walls)
end

function get_npc_tiles(npcs)
	local tiles = {}
	foreach(npcs,function(n) add(tiles,{n.x,n.y}) end)
	return tiles
end

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


function handle_left_block_col(player, block_box)
	local p_box = player:left_col()
	if(aa_bb(p_box,block_box)) player.x=block_box[3]
end
function handle_left_col(player, walls)
	p_box = {player.x+1,player.y+4,player.x+2,player.y+5}
	foreach(walls, function(w)
		local w_box = get_tile_box(w)
		if(aa_bb(p_box,w_box)) player.x=w_box[3]
	end)
end

function handle_top_block_col(player, block_box)
	local p_box = player:top_col()
	if(aa_bb(p_box,block_box)) player.y=block_box[4]-2
end
function handle_top_col(player, walls)
	p_box = {player.x+3,player.y+2,player.x+4,player.y+3}
	foreach(walls, function(w)
		local w_box = get_tile_box(w)
		if(aa_bb(p_box,w_box)) player.y=w_box[4]-2
	end)
end

function handle_right_block_col(player, block_box)
	local p_box = player:right_col()
	if(aa_bb(p_box,block_box)) player.x=block_box[1]-7
end
function handle_right_col(player, walls)
	p_box = {player.x+5,player.y+4,player.x+6,player.y+5}
	foreach(walls, function(w)
		local w_box = get_tile_box(w)
		if(aa_bb(p_box,w_box)) player.x=w_box[1]-7
	end)
end

function handle_bottom_block_col(player, block_box)
	local p_box = player:bottom_col()
	if(aa_bb(p_box,block_box)) player.y=block_box[2]-8
end
function handle_bottom_col(player, walls)
	p_box = {player.x+3,player.y+6,player.x+4,player.y+7}
	foreach(walls, function(w)
		local w_box = get_tile_box(w)
		if(aa_bb(p_box,w_box)) player.y=w_box[2]-8
	end)
end