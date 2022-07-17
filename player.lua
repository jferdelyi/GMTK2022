player_c={}
player_c.new=function()
	if(player) return player
    local self={}
    function self.init()
        self.x=16
        self.y=16
        self.selected_tile=tiles_manager_c.types.forest
    end
    function self.update()
        local new_x=self.x
        local new_y=self.y
        local pressed=true
        if btnp(⬆️) then new_y-=1
        elseif btnp(⬇️) then new_y+=1
        elseif btnp(⬅️) then new_x-=1
        elseif btnp(➡️) then new_x+=1
        else pressed=false end

        if pressed then
            sfx(0)
            self.check_position(new_x,new_y)
        end

        if map_check_flag(new_x,new_y,0) then
            local tile = tiles_manager.get_tile(new_x,new_y)
            message.set(tile.name, "population: "..tile.population.."\nfactor: "..tile.factor.."/turn\nevents:"..tile.get_events())
        else
            message.set_island_info()
        end
    end
    function self.check_position(new_x,new_y)
        if(new_x<31 and new_y>0) self.x=new_x
        if(new_x<31 and new_y>0) self.y=new_y
    end
    function self.move(x,y)
        self.check_position(x,y)
    end
    function self.place_tile()
        return tiles_manager.add(self.selected_tile,self.x,self.y)
    end
    function self.draw()
        spr(16,self.x*8,self.y*8)
    end
    return self
end
player=player_c.new()