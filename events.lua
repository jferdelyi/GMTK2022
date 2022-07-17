event_c={}
event_c.new=function(name,pop_delta_percent,pop_delta,proba,tiles)
	local self={}
	self.name=name
	self.pop_delta_percent=pop_delta_percent
	self.pop_delta=pop_delta
	self.proba=proba
	self.tiles=tiles

	function self.perform()
		local is_percent=self.pop_delta_percent!=0.0
		local delta=is_percent and self.pop_delta_percent or self.pop_delta
		for e in all(self.tiles) do
			tiles_manager.set_delta_pop(e,delta,is_percent)
		end
	end

	function self.get_description()
		local ret=""
		for i in all(tiles) do
			local name=tiles_manager.get_tile_name(i)
			ret=ret.."\n"..name
		end
		return "affected: "..ret
	end
	return self
end

events_c={}
events_c.new=function() 
	if(events) return events
	local self={}
	self.list={
		event_c.new("good harvest", 0.05, 0, 0.05,{tiles_manager_c.types.plain}),
		event_c.new("good hunting", 0, 20, 0.05,{tiles_manager_c.types.plain,tiles_manager_c.types.montain}),
		event_c.new("animal attack", 0, -100, 0.2,{tiles_manager_c.types.forest,tiles_manager_c.types.swamp}),
		event_c.new("avalanche", -0.10, 0, 0.15,{tiles_manager_c.types.montain}),
		event_c.new("flooding", -0.20, 0, 0.15,{tiles_manager_c.types.swamp}),
		event_c.new("erruption", -0.70, 0, 0.05,{tiles_manager_c.types.volcano}),
		event_c.new("sand storm", 0, -200, 0.15,{tiles_manager_c.types.desert}),
		event_c.new("a good day", 0, 0, 0.20,{})
	}
	function self.pick_event()
		local proba=rnd(1)
		local computed_proba=0
		for e in all(self.list) do
			computed_proba+=e.proba
			if(computed_proba>=proba) return e
		end
		assert(false,computed_proba)
		return nil
	end


	return self
end
events=events_c.new()