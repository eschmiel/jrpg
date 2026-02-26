zone1 = {
    map = { 0,0 },
    npcs = {
        {
            gid = 3,
            -- We'll use map coordinates for NPCs to make them easier to place in relation to the map.
            x = 11,
            y= 9,
            dialogue={
                {
                    name='Boris',
                    text={
                        'Hello, I am Boris.'
                    }
                },
                {
                    name='Boris',
                    text={
                        'Are you not entertained?!'
                    }
                }
            }
        },
        {
            gid = 3,
            -- We'll use map coordinates for NPCs to make them easier to place in relation to the map.
            x = 7,
            y= 2,
            dialogue={
                {
                    name='Long Winded Man',
                    text={
                        'You must journey',
                        "to the center of the world.",
                        "aggg"
                    }
                },
                {
                    name='Long Winded Man',
                    text={
                        'There you will find a man named',
                        'Boris.',
                        'He will entertain you'
                    }
                },
                {
                    name='Long Winded Man',
                    text={
                        'Guffaw or perish',
                    }
                }
            }
        }
    }
}