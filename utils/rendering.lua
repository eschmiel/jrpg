function render_box(x,y,w,h,border_color,background_color)
	rectfill(x,y,x+w,y+h, background_color)
    rect(x,y,x+w,y+h, border_color)
end