function printTbl(tbl, key)
    if(key) then
        for i in all(tbl) do
            print(i[key])
        end
    else
        foreach(tbl, function(v)print(RESULT_LABEL[v])end)
    end
end