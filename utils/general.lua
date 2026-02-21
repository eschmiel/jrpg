function copyTbl(src,tar)
    local tar = {}
    foreach(src,function(i)
        add(tar, i)
    end)
    return tar
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