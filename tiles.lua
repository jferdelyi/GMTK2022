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

	--[[local function set_beaches(x,y)
		for dx=x-1,x+1 do
			for dy=y-1,y+1 do
				if(not map_check_flag(x,y,0)) set_beach(x,y)
			end
		end
	end
	local function set_beach(x,y)
		--N,W,S,E
		local neighbors_number=0
		local neighbors={false,false,false,false}
		--NW,SW,SE,NE
		local corners_number=0
		local corner={false,false,false,false}
		if not map_check_flag(x,y-1,0) then
			neighbors_number+=1
			neighbors[1]=true
		end
		if not map_check_flag(x-1,y,0) then
			neighbors_number+=1
			neighbors[2]=true
		end
		if not map_check_flag(x,y+1,0) then
			neighbors_number+=1
			neighbors[3]=true
		end
		if not map_check_flag(x+1,y,0) then
			neighbors_number+=1
			neighbors[4]=true
		end

		if neighbors_number==0 then
			if not map_check_flag(x-1,y-1,0) then
				corners_number+=1
				corner[1]=true
			end
			if not map_check_flag(x-1,y+1,0) then
				corners_number+=1
				corner[2]=true
			end
			if not map_check_flag(x+1,y+1,0) then
				corners_number+=1
				corner[3]=true
			end
			if not map_check_flag(x+1,y-1,0) then
				corners_number+=1
				corner[4]=true
			end
		end
	end]]
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