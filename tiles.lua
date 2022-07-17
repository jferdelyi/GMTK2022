local tile_population_factors={
	100,
	30,
	30,
	0,
	10,
	10}
local tile_names={
	"plain",
	"forest",
	"montain",
	"volcano",
	"swamp",
	"desert"}
local tile_events={
	{"good harvest"},
	{"good hunting","animal attack"},
	{"good hunting","avalanche"},
	{"erruption"},
	{"flooding","animal attack"},
	{"sand storm"}}
--[[local tile_beach={
	32,
	33,
	34,
	35,
	36,
	37
}]]

tiles_manager_c={}
tiles_manager_c.types={}
tiles_manager_c.types.plain=2
tiles_manager_c.types.forest=3
tiles_manager_c.types.montain=4
tiles_manager_c.types.volcano=5
tiles_manager_c.types.swamp=6
tiles_manager_c.types.desert=7
tiles_manager_c.new=function(type,x,y)
	if(tiles_manager) return tiles_manager
	local self={}
	function self.init()
		for t in all(self.tiles) do
			map_set(1,t.x,t.y)
		end
		self.reset_permitted_tiles()
		self.tiles={}
		self.to_damage_tiles={}
		self.last_tile=nil
		self.permitted_tiles_init=false
	end
	function self.compute_delta_pop(tile,delta,is_percent)
		if is_percent then 
			return tile.set_delta_pop_percent(delta)
		else
			return tile.set_delta_pop(delta)
		end
	end
	function self.add(type,x,y,override)
		if not override then
			if(self.get_tile(x,y)) return false
			if(not map_check_flag(x,y,2)) return false
			sfx(1)
			self.reset_permitted_tiles()
		else
			local tile=self.get_tile(x,y)
			if(tile) del(tiles, tile)
		end
		local new_tile=tile_c.new(type,x,y)
		add(self.tiles, new_tile)
		last_tile=new_tile
		return true
	end
	function self.get_tile(x,y)
		for t in all(self.tiles) do
			if(x==t.x and y==t.y) return t
		end
		return nil
	end
	function self.reset_permitted_tiles()
		for t in all(self.permitted_tiles) do
			map_set(1,t.x,t.y)
		end
		self.permitted_tiles={}
		self.permitted_tiles_init=false
	end
	local function set_neighbors_to_permitted(tile)
		local x=tile.x
		local y=tile.y
		if not map_check_one_of_flags(x,y-1,0,7) then
			map_set(17,x,(y-1))
			add(self.permitted_tiles,{x=x,y=(y-1)})
		end
		if not map_check_one_of_flags(x-1,y,0,7) then
			map_set(17,(x-1),y)
			add(self.permitted_tiles,{x=(x-1),y=y})
		end
		if not map_check_one_of_flags(x,y+1,0,7) then
			map_set(17,x,(y+1))
			add(self.permitted_tiles,{x=x,y=(y+1)})
		end
		if not map_check_one_of_flags(x+1,y,0,7) then
			map_set(17,(x+1),y)
			add(self.permitted_tiles,{x=(x+1),y=y})
		end
	end
	function self.set_permitted_tiles_position()
		if(tiles_manager.permitted_tiles_init) return
		set_neighbors_to_permitted(last_tile)
		if #self.permitted_tiles==0 then
			for t in all(self.tiles) do
				set_neighbors_to_permitted(t)
			end
		end
		self.permitted_tiles_init=true
	end
	function self.get_tile_population_factor(type)
		return tile_population_factors[type-1]
	end
	function self.get_tile_events_formated(type)
		local events=""
		for e in all(tile_events[type-1]) do
			if #events==0 then
				events=e
			else
				events=events.."\n"..e
			end
		end
		return events
	end
	function self.get_tile_name(type)
		return tile_names[type-1]
	end

	function self.set_delta_pop(type,delta,is_percent)
		for t in all(self.tiles) do
			if t.type==type then
				local x=t.x
				local y=t.y
				if map_check_flag(x,y-1,0) then
					game.create_thread(self.get_tile(x,y-1),delta,is_percent)
				end
				if map_check_flag(x-1,y,0) then
					game.create_thread(self.get_tile(x-1,y),delta,is_percent)	
				end
				if map_check_flag(x,y+1,0) then
					game.create_thread(self.get_tile(x,y+1),delta,is_percent)
				end
				if map_check_flag(x+1,y,0) then
					game.create_thread(self.get_tile(x+1,y),delta,is_percent)
				end
				game.create_thread(t,delta,is_percent)	
			end
		end
	end

	function self.draw()
		for b in all(self.beaches) do
			spr(b.sprite,b.x*8,b.y*8,1,1,b.flip_x,b.flip_y)
		end
		for t in all(self.permitted_tiles) do
			spr(51,t.x*8,t.y*8)
		end
	end
	local function corner_compute(corners_number,corners)
		if corners_number==1 then
			if corners[1] then
				return {sprite=37,flip_x=false,flip_y=false}
			elseif corners[2] then
				return {sprite=37,flip_x=false,flip_y=true}
			elseif corners[3] then
				return {sprite=37,flip_x=true,flip_y=true}
			elseif corners[4] then
				return {sprite=37,flip_x=true,flip_y=false}
			end
		end
		if corners_number==2 then
			if (corners[1] and corners[3]) then
				return {sprite=41,flip_x=false,flip_y=false}
			elseif (corners[2] and corners[4]) then
				return {sprite=41,flip_x=false,flip_y=true}

			elseif (corners[1] and corners[2]) then
				return {sprite=42,flip_x=false,flip_y=false}
			elseif (corners[2] and corners[3]) then
				return {sprite=38,flip_x=false,flip_y=true}
			elseif (corners[3] and corners[4]) then
				return {sprite=42,flip_x=true,flip_y=false}
			elseif (corners[4] and corners[1]) then
				return {sprite=38,flip_x=false,flip_y=false}
			end
		end
		if corners_number==3 then
			if not corners[1] then
				return {sprite=39,flip_x=true,flip_y=true}
			elseif not corners[2] then
				return {sprite=39,flip_x=true,flip_y=false}
			elseif not corners[3] then
				return {sprite=39,flip_x=false,flip_y=false}
			elseif not corners[4] then
				return {sprite=39,flip_x=false,flip_y=true}
			end
		end
		if corners_number==4 then
			return {sprite=40,flip_x=false,flip_y=false}
		end
		return nil
	end
	local function border_compute(borders_number,borders)
		if borders_number==1 then
			if borders[1] then
				return {sprite=32,flip_x=false,flip_y=false}
			elseif borders[2] then
				return {sprite=43,flip_x=false,flip_y=false}
			elseif borders[3] then
				return {sprite=32,flip_x=false,flip_y=true}
			elseif borders[4] then
				return {sprite=43,flip_x=true,flip_y=false}
			end
		end
		if borders_number==2 then
			if (borders[1] and borders[3]) then
				return {sprite=35,flip_x=false,flip_y=false}
			elseif (borders[2] and borders[4]) then
				return {sprite=44,flip_x=false,flip_y=false}

			elseif (borders[1] and borders[2]) then
				return {sprite=33,flip_x=false,flip_y=false}
			elseif (borders[2] and borders[3]) then
				return {sprite=33,flip_x=false,flip_y=true}
			elseif (borders[3] and borders[4]) then
				return {sprite=33,flip_x=true,flip_y=true}
			elseif (borders[4] and borders[1]) then
				return {sprite=33,flip_x=true,flip_y=false}
			end
		end
		if borders_number==3 then
			if not borders[1] then
				return {sprite=45,flip_x=false,flip_y=false}
			elseif not borders[2] then
				return {sprite=34,flip_x=true,flip_y=true}
			elseif not borders[3] then
				return {sprite=45,flip_x=true,flip_y=false}
			elseif not borders[4] then
				return {sprite=34,flip_x=false,flip_y=false}
			end
		end
		if borders_number==4 then
			return {sprite=36,flip_x=false,flip_y=false}
		end
		return nil
	end

	local function get_beach_sprite(x,y)
		local sprite=1
		local flip_x=false
		local flip_y=false

		--N,W,S,E
		local neighbors_number=0
		local neighbors={false,false,false,false}
		--NW,SW,SE,NE
		local corners_number=0
		local corners={false,false,false,false}
		if map_check_flag(x,y-1,0) then
			neighbors_number+=1
			neighbors[1]=true
		end
		if map_check_flag(x-1,y,0) then
			neighbors_number+=1
			neighbors[2]=true
		end
		if map_check_flag(x,y+1,0) then
			neighbors_number+=1
			neighbors[3]=true
		end
		if map_check_flag(x+1,y,0) then
			neighbors_number+=1
			neighbors[4]=true
		end

		if map_check_flag(x-1,y-1,0) then
			corners_number+=1
			corners[1]=true
		end
		if map_check_flag(x-1,y+1,0) then
			corners_number+=1
			corners[2]=true
		end
		if map_check_flag(x+1,y+1,0) then
			corners_number+=1
			corners[3]=true
		end
		if map_check_flag(x+1,y-1,0) then
			corners_number+=1
			corners[4]=true
		end

		local corner = corner_compute(corners_number,corners)
		local border = border_compute(neighbors_number,neighbors)

		if(corner and border) return {border, corner}
		if(corner) return {corner}
		if(border) return {border}
	end
	function self.get_beaches()
		self.beaches={}
		for t in all(self.tiles) do
			for dx=t.x-1,t.x+1 do
				for dy=t.y-1,t.y+1 do
					if not map_check_flag(dx,dy,0) then
						found=false
						for b in all(self.beaches) do
							if b.x==dx and b.y==dy then
								found=true
								break
							end
						end
						if not found then
							local data=get_beach_sprite(dx,dy)
							for d in all(data) do
								add(self.beaches,{sprite=d.sprite,x=dx,y=dy,flip_x=d.flip_x,flip_y=d.flip_y})
							end
						end
					end
				end
			end
		end
	end
	return self
end
tiles_manager=tiles_manager_c.new()

tile_c={}
tile_c.new=function(type,x,y)
	local self={}
	self.x=x
	self.y=y
	self.population=0
	self.type=type
	self.factor=tile_population_factors[type-1]
	self.name=tile_names[type-1]
	self.events=tile_events[type-1]
	map_set(type,x,y)
	function self.update()
		self.population+=self.factor
	end
	function self.set_sprite(sprite)
		map_set(sprite,x,y)
	end
	function self.reset_sprite()
		map_set(type,x,y)
	end
	function self.set_delta_pop(delta)
		local new_population=self.population+delta
		self.population=new_population<0 and 0 or new_population
		return self.population<=0 and self.population or delta
	end
	function self.set_delta_pop_percent(percent)
		local delta=flr(self.population*percent)
		return self.set_delta_pop(delta)
	end
	function self.get_events()
		return tiles_manager.get_tile_events_formated(self.type)
	end
	return self
end