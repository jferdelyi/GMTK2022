game_manager_c={}
game_manager_c.new=function()
	if(game) return game
	local self={}
	music(0)
	function self.init()
		tuto_init()
		self.game_over=false
		self.quick=false
		self.population=0
		self.factor=0
		self.turn=0
		self.max_turn=100
		self.phase=1 --1:select,2:place,3:event
		player.init()
		self.focus=player
		tiles_manager.init()
		tiles_manager.add(tiles_manager_c.types.plain,16,16,true)
		self.new_turn()
		message.init()
		self.theads={}
	end
	function self.update()
		if not tuto_finished() then
			tuto_update()
			camera_update(self.focus.x,self.focus.y,true)
			return
		end
		if self.game_over then
			message.set("the end", "score: "..self.population.."\npress ❎ to retry")
        	if(btnp(❎)) self.init()
		else
			if self.phase==1 then
				if not selection_menu.is_init then
					selection_menu.init()
					message.set_display(false)
				end

				if btnp(⬅️) then 
					selection_menu.select_left()
				elseif btnp(➡️) then 
					selection_menu.select_right()
				elseif(btnp(🅾️)) then
					selection_menu.accept()
					tiles_manager.set_permitted_tiles_position()
					self.focus=player
					self.phase=2
				end


			elseif self.phase==2 then
				message.set_display(true)
				player.update()
        		if btnp(🅾️) then 
					if player.place_tile() then
						tiles_manager.reset_permitted_tiles()
						selection_menu.reset()
						game.phase=3
					end
				elseif(btnp(❎)) then
					self.phase=1
					tiles_manager.reset_permitted_tiles()
					selection_menu.set_display(true)
					message.set_display(false)
				end


			elseif self.phase==3 then
				local e=events.pick_event()
				e.perform()
				message.set(e.name,"nothing happen")
				self.phase=4
			
			elseif self.phase==4 then
				if btnp(🅾️) then
					self.quick=true
				end

				if self.quick then
					for c in all(self.theads) do
						if costatus(c.routine)!='dead' then
							coresume(c.routine)
						else
							del(self.theads,c)
						end
					end
				else
					if #self.theads!=0 then
						local c=self.theads[1]
						if costatus(c.routine)!='dead' then
							coresume(c.routine)
						else
							del(self.theads,c)
						end
					end
				end
				
				if #self.theads==0 and btnp(🅾️) then
					self.phase=5
					self.focus=player
					self.quick=false
				end

			elseif self.phase==5 then
				--inspection
				self.compute_info()
				player.update()
				if(btnp(🅾️)) self.new_turn()
			end
			message.update()
		end
		camera_update(self.focus.x,self.focus.y,true)
	end
	function self.draw()
		cls()
		map()
		if tuto_finished() then
			player.draw()
			camera()
			message.draw(self.phase==2)
			selection_menu.draw()
		else
			camera()
			tuto_draw()
		end
	end
	function self.new_turn()
		if self.turn==self.max_turn then
			self.game_over=true
			return
		end
		self.factor=0
		self.population=0
		for t in all(tiles_manager.tiles) do
			t.update()
			self.factor+=t.factor
			self.population+=t.population
		end
		self.turn+=1
		self.phase=1
		tiles_manager.reset_permitted_tiles()
	end
	function self.compute_info()
		self.factor=0
		self.population=0
		for t in all(tiles_manager.tiles) do
			self.factor+=t.factor
			self.population+=t.population
		end
	end
	function self.create_thread(tile,delta,is_percent)
		local max=30
		local computed_delta=tiles_manager.compute_delta_pop(tile,delta,is_percent)
		
		for a in all(game.theads) do
			if a.tile==tile then
				computed_delta+=a.delta_pop
				del(game.theads,a)
				break
			end
		end
		if(computed_delta==0) return

		local text=computed_delta>0 and "+" or ""
		local sound=computed_delta>0 and 3 or 2
		local animation_sprite=computed_delta>0 and 49 or 48
		local message_content=text..computed_delta
		local c={
			tile=tile,
			delta_pop=computed_delta,
			routine=cocreate(
			function()
				sfx(sound)
				player.move(tile.x,tile.y)
				message.set_content(message_content)
				for i=1,max/2 do
					yield()
					tile.set_sprite(animation_sprite)
					yield()
					tile.reset_sprite()
				end
			end)}
		add(game.theads,c)
	end

	return self
end
game=game_manager_c.new()