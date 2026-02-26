function printTbl(tbl, key)
    if(key) then
        for i in all(tbl) do
            printh(i[key],'log',true,true)
        end
    else
        foreach(tbl, function(v)print(RESULT_LABEL[v])end)
    end
end

function draw_screen_edge()
    rect(SCREEN_LEFT,SCREEN_TOP,SCREEN_RIGHT,SCREEN_BOTTOM,COLOR.GREY)
end

function render_bounding_box(box, color)
    rect(box[1],box[2],box[1]+box[3],box[2]+box[4], color)
end

function draw_wall_check(player)
    local mx = flr(player.x/8)-2
    local my = flr(player.y/8)-2
    local walls = {}
    for y=1, 3 do
        for x=1, 3 do
            local tile = mget(mx+x,my+y)
            local wall = fget(tile) == WALL_FLAG
            local c = COLOR.PINK
            if(wall) c = COLOR.RED
            add(walls, {mx+x,my+y,c})
        end
    end

    foreach(walls, function(w)          
        rect(w[1]*8,w[2]*8,(w[1]+1)*8,(w[2]+1)*8,w[3])
    end)
end

function render_box(box,c)
    c2 = COLOR.RED
    if(c) c2 = c
    rect(box[1],box[2],box[3],box[4],c2)
end

function init_log()
    printh("starting log - "..rnd(1),"log",true,true)
    printh("------","log",false,true)
end

function log(val)
    printh(val, "log",false, true)
end

function debug(val)
    printh("debug log - "..rnd(1),"debug",true,true)
    printh("--------", "debug",false, true)
    printh(val, "debug",false, true)
end