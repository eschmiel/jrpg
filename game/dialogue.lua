function render_dialogue(loaded_dialogue)
	local dialogue = loaded_dialogue:get_current_dialogue()
	-- speaker name
	render_border_box(0,SCREEN_BOTTOM - DIALOGUE_BOX_HEIGHT - NAME_BOX_HEIGHT,NAME_BOX_WIDTH,NAME_BOX_HEIGHT,COLOR.GREY,COLOR.BLACK)
	print(dialogue.name, 4, SCREEN_BOTTOM - DIALOGUE_BOX_HEIGHT - NAME_BOX_HEIGHT + 4)
    -- print_text_tbl(dialogue.name, 4, SCREEN_BOTTOM - DIALOGUE_BOX_HEIGHT - NAME_BOX_HEIGHT  + 4)
	-- dialogue text
	render_border_box(0,SCREEN_BOTTOM - DIALOGUE_BOX_HEIGHT,SCREEN_WIDTH,DIALOGUE_BOX_HEIGHT,COLOR.GREY,COLOR.BLACK)
    print_text_tbl(dialogue.text, 4, SCREEN_BOTTOM - DIALOGUE_BOX_HEIGHT + 4)
end


-- we should come up with a better name for this. This dialogue runner object is different than the dialogue object extracted from the speaker
function mk_dialogue(speaker)
	return {
		current = 1,
		dialogue=speaker.dialogue,
		get_current_dialogue = function(self) return self.dialogue[self.current] end
	}
end

-- DIALOGUE_BOX_HEIGHT = 36
DIALOGUE_BOX_HEIGHT = 28
NAME_BOX_HEIGHT = 12
-- NAME_BOX_WIDTH = 32
NAME_BOX_WIDTH = 66