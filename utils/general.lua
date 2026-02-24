function copyTbl(src,tar)
    local tar = {}
    foreach(src,function(i)
        add(tar, i)
    end)
    return tar
end

function concat_tbl(t1,t2)
    local c_tbl = {}
    for i in all(t1) do add(c_tbl,i) end
    for i in all(t2) do add(c_tbl,i) end
    return c_tbl
end

function print_text_tbl(tbl, x, y, col)
    if(not col) col = COLOR.GREY
    for l=1, #tbl do
        print(tbl[l], x, y+(8*(l-1)), col)
    end
end

function use_transparency(t, func)
    if(not t) func() return
    palt(t, true)
    palt(MAIN_TRANSPARENCY, FALSE)
    func()
    palt(t, false)
    palt(MAIN_TRANSPARENCY, true)
end

function aa_bb(b1,b2)
    return b1[1] <= b2[3] 
       and b1[3] >= b2[1] 
       and b1[2] <= b2[4] 
       and b1[4] >= b2[2]
end

-- bb = bounding box
function point_in_bb(point, b_box)
    return point[1] < b_box[3]
    and point[1] > b_box[1]
    and point[2] < b_box[4]
    and point[2] > b_box[2]
end

function get_tile_box(tile)         
    return {tile[1]*8,tile[2]*8,(tile[1]+1)*8,(tile[2]+1)*8}
end