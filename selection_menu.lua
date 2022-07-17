selection_menu_c={}
selection_menu_c.new=function()
	if(selection_menu) return selection_menu
	local self={}
    self.is_init=false
    self.bad_proba=0.50
    self.bad_offset=5
    self.good_offset=2
    local function random_tiles()
        local is_bad_a=rnd(1)<=self.bad_proba
        local is_bad_b=rnd(1)<=self.bad_proba
        local offset_a=is_bad_a and self.bad_offset or self.good_offset
        local offset_b=is_bad_b and self.bad_offset or self.good_offset
        while self.tile_a==self.tile_b do
            self.tile_a=round(rnd(2))+offset_a
            self.tile_b=round(rnd(2))+offset_b
        end
    end
    function self.init()
        self.x=x or 25
        if(player.y>16) self.y=15
		if(player.y<=16) self.y=95
        self.tile_a=nil
        self.tile_b=nil
        random_tiles()
        self.selected_tile=self.tile_a
        self.is_init=true
        self.hidden=false
    end
    function self.select_left()
        self.selected_tile=self.tile_a
        sfx(0)
    end
    function self.select_right()
        self.selected_tile=self.tile_b
        sfx(0)
    end
    function self.accept()
        player.selected_tile=self.selected_tile
        self.hidden=true
        sfx(1)
    end
    function self.reset()
        self.selected_tile=nil
        self.is_init=false
        self.hidden=true
    end
    function self.set_display(value)
        self.hidden=not value
    end
    function self.draw()
        --if not init then do not draw
        if(self.hidden) return
        if(not self.is_init) return

		--general data
        local x=self.x
		local y=self.y
		local h=y+30
		local w=x+84

        --selected tile data
        local tile_a_x=x+30
        local tile_a_y=y+2
        local tile_b_x=x+50
        local tile_b_y=y+2
        local selected_tile_x=nil
        local selected_tile_y=nil
        if self.selected_tile==self.tile_a then
            selected_tile_x=tile_a_x
            selected_tile_y=tile_a_y
        else
            selected_tile_x=tile_b_x
            selected_tile_y=tile_b_y
        end
        local population_factor=tiles_manager.get_tile_population_factor(self.selected_tile)
        local events=tiles_manager.get_tile_events_formated(self.selected_tile)
        local name=tiles_manager.get_tile_name(self.selected_tile)

        --title data
        local title="pick one: "..name
		local title_w=(x+2)+#title*4
		local title_h=y+9

        --draw title
		rectfill(x-1,y-11,title_w+1,title_h+1,0)
		rectfill(x,y-10,title_w,title_h,1)
		print(title,x+2,y-8,7)
		
        --draw body
        rectfill(x-1,y-1,w+1,h+1,0)
		rectfill(x,y,w,h,5)

        --draw higligth
        rectfill(tile_a_x-1,tile_a_y-1,tile_a_x+8,tile_a_y+8,0)
        rectfill(tile_b_x-1,tile_b_y-1,tile_b_x+8,tile_b_y+8,0)
       
        --draw selection
        rectfill(selected_tile_x-1,selected_tile_y-1,selected_tile_x+8,selected_tile_y+8,7)

        --draw tiles
        spr(self.tile_a,tile_a_x,tile_a_y)
        spr(self.tile_b,tile_b_x,tile_b_y)
        print("factor: "..population_factor.."\nevents:"..events, x+2, selected_tile_y+10)
        print("🅾️>",w-11,h-5,7)
    end
    return self
end
selection_menu=selection_menu_c.new()