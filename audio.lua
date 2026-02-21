-- sfx(-1, x) stop sound on all channels
-- sfx(-2, x) release sound on channel from looping
-- sfx(x, -1) automatically choose an unused channel to play sound x on 
-- sfx(x, -2) stop sound x from playing on any channel

example_track = {
    start = function()
        sfx(2)
    end,
    stop = function()
        sfx(2,-2)
    end
}

-- we should probably just setup constants to represent sounds instead and use sfx()
example_sfx = function() sfx(5,3) end
