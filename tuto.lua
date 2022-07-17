
function tuto_init()
	messages={}
	tuto_create(
		"tutorial",{
        "c/🅾️ to validate\nx/❎ to return",
        "build your island",
})
end

function tuto_create(name,content)
	message_title=name
	for c in all(content) do
		add(messages,c)
	end
end

function tuto_update()
	if btnp(🅾️) then
		deli(messages,1)
	end
end

function tuto_finished()
    return #messages==0
end

function tuto_draw(x,y)
	if(not messages[1]) return
	local x=x or 30
	local y=y or 40
	local h=y+30
	local w=x+70
	local title_w=(x+2)+#message_title*4
	local title_h=y+9

	--title
	rectfill(x-1,y-11,title_w+1,title_h+1,0)
	rectfill(x,y-10,title_w,title_h,1)

	--content
	rectfill(x-1,y-1,w+1,h+1,0)
	rectfill(x,y,w,h,5)

	--message
	print(message_title,x+2,y-8,7)
	print(messages[1],x+2,y+2,7)

    print("🅾️>",w-11,h-5,7)
end