function handle_block_collisions(state)
    local p = state.player
    local zone = state.zone
    local walls = find_walls(p,zone)
    local npc_tiles = get_npc_tiles(zone)
    local blockers = concat_tbl(walls,npc_tiles)
    -- foreach(blockers, function(b)logTbl(b,"blocker coords")end)
    foreach(blockers, function(b)
    	local b_box = get_tile_box(b)
    	handle_left_block_col(p,b_box)
    	handle_top_block_col(p,b_box)
    	handle_right_block_col(p,b_box)
    	handle_bottom_block_col(p,b_box)
	end)
end

function get_npc_tiles(zone)
	local tiles = {}
	foreach(zone.npcs,function(n) add(tiles,{n.x,n.y}) end)
	return tiles
end

function find_walls(player,zone)
	local mx = flr(player.x/8)-2
	local my = flr(player.y/8)-2
	local walls = {}
	for y=1, 3 do
		for x=1, 3 do
			local tile = mget(mx+x,my+y)
			if(fget(tile,WAll_FLAG)) then
				add(walls, {mx+x,my+y})
			end
		end
	end

	return walls
end


function handle_left_block_col(player, block_box)
	local p_box = player:left_col()
	if(aa_bb(p_box,block_box)) player.x=block_box[3]
end

function handle_top_block_col(player, block_box)
	local p_box = player:top_col()
	if(aa_bb(p_box,block_box)) player.y=block_box[4]-2
end

function handle_right_block_col(player, block_box)
	local p_box = player:right_col()
	if(aa_bb(p_box,block_box)) player.x=block_box[1]-7
end
function handle_bottom_block_col(player, block_box)
	local p_box = player:bottom_col()
	if(aa_bb(p_box,block_box)) player.y=block_box[2]-8
end