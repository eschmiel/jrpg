function mk_narrative_state()
    return
    {
        current = 1,
        text = {
            {
                "years ago, humanity gave up",
                "everything to the machine."
            },
            {
                "their toil.",
                "their fear.",
                "their pain."
            },
            {
                "their love.",
                "their dreams.",
                "their hope."
            },
            {
                "i hate you."
            }
        },

        update = function(self)
            if(btnp(INPUT.X)) then 
                self.current +=1
                if(self.current > #self.text) then
                    -- end of dialogue logic
                end
            end
        end,

        draw = function(self)
            if(self.current == 1)then  
                -- dialogue 1 gfx
            end
            if(self.current == 2) then
                -- dialogue 2 gfx
            end
            if(self.current == 3) then
                -- dialogue 3 gfx
            end
            if(self.current == 4) then
                -- dialogue 4 gfx
            end
            render_box(SCREEN_LEFT, 90, SCREEN_RIGHT,SCREEN_BOTTOM-90,COLOR.GREY,COLOR.BLACK)
            print_text_tbl(self.text[self.current], 4, 94)
        end
    }
end