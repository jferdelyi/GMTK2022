debugs={}
function debug(title,content)
    add(debugs,{title=title,content=content})
end
function debug_print()
    for d in all(debugs) do
		if(d.content) printh(d.title..':'..d.content)
		if(not d.content) printh(d.title)
    end
	debug_clear()
end
function debug_draw()
    local y=0
    for d in all(debugs) do
		if(d.content) print_outline(d.title..':'..d.content,0,y,7)
		if(not d.content) print_outline(d.title,0,y,7)
        y+=6
    end
	debug_clear()
end
function debug_mem()
    debug("mem",(stat(0)*100/2048)..'%')
end
function debug_cpu()
    debug("cpu",(stat(1)*100)..'%')
end
function debug_fps()
    debug("fps",stat(7))
end
function debug_clear()
    debugs={}
end
function wait(f) 
	for i=1,f do 
		flip() 
	end 
end
function round(value)
	return flr(value+0.5)
end
function camera_update(x,y,is_tile)
	local cam_x
	local cam_y
	if is_tile then
		cam_x=mid(0,x*8-64,16*8)
		cam_y=mid(0,y*8-64,16*8)
	else
		cam_x=mid(0,x-64,16*8)
		cam_y=mid(0,y-64,16*8)
	end
	camera(cam_x,cam_y)
end
function map_set(sprite,x,y,w,h)
    local w=w or 1
    local h=h or 1
	for tmpx=1,w do
		for tmpy=1,h do
			mset(x+(tmpx-1),y+(tmpy-1),sprite)
		end
	end
end
function map_check_flag(x,y,flag)
	local sprite = mget(x,y)
	return fget(sprite,flag)
end
function map_check_one_of_flags(x,y,...)
	local flags={...}
	local sprite=mget(x,y)
	for f in all(flags) do
		if(fget(sprite,f)) return true
	end
end
function map_check_multiple_flags(x,y,...)
	local flags={...}
	local sprite=mget(x,y)
	for f in all(flags) do
		if(not fget(sprite,f)) return false
	end
	return true
end
function print_outline(text,x,y,text_color,outline_color)
	local outline_color=outline_color or 0
	local text_color=text_color or 7
	print(text,x-1,y,outline_color)
	print(text,x+1,y,outline_color)
	print(text,x,y-1,outline_color)	
	print(text,x,y+1,outline_color)
	print(text,x,y,text_color)
end
function toggle_music(n)
	if music_playing then
		music(-1) 
		music_playing=false
	else
		music(n) 
		music_playing=true
	end
end