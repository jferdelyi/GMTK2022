message_c={}
message_c.new=function()
	if(message) return message
	local self={}
	function self.init(x,y)
		self.message=nil
		self.title=nil
		self.x=x or 25
		self.y=y or 95
		self.hidden=false
	end
	function self.update()
		if(player.y>16) self.y=15
		if(player.y<=16) self.y=95
	end
	function self.set_display(value)
        self.hidden=not value
    end
	function self.draw(can_return)
		if(self.hidden) return
		if(not self.title) return
		local x=self.x
		local y=self.y
		local h=y+28
		local w=x+84
		local title_w=(x+2)+#self.title*4
		local title_h=y+9
		rectfill(x-1,y-11,title_w+1,title_h+1,0)
		rectfill(x,y-10,title_w,title_h,1)
		rectfill(x-1,y-1,w+1,h+1,0)
		rectfill(x,y,w,h,5)
		print(self.title,x+2,y-8,7)
		print(self.message,x+2,y+2,7)
        print("🅾️>",w-11,h-5,7)
		if(can_return) print("<❎",w-25,h-5,7)
	end
	function self.set(name,content)
		self.title=name
		self.message=content
	end
	function self.set_name(name)
		self.title=name
	end
	function self.set_content(content)
		self.message=content
	end
	function self.set_island_info()
		message.set("island", "population: "..game.population.."\nfactor: "..game.factor.."/turn\nturn: "..game.turn.."/"..game.max_turn)
	end
	return self
end
message=message_c.new()