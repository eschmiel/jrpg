function handle_block_collisions(state)
    local p = state.player
    local npc_positions = get_npc_positions(state.npcs)
    local blockers = concat_tbl(state.walls,npc_positions)
    -- log(blockers)
    foreach(blockers, function(b)
    	-- log(b)
    	local b_box = get_sprite_box(b)
    	handle_left_block_col(p,b_box)
    	handle_top_block_col(p,b_box)
    	handle_right_block_col(p,b_box)
    	handle_bottom_block_col(p,b_box)
	end)
end

-- load_zone(zone_def)
--- find walls
--- find npcs
-- collision detect against npcs and walls in loaded zone

-- find walls when zone first loads. Save coordinates in world space
-- find npcs when zone first loads. Save in world space

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