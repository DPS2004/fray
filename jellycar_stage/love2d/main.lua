function love.load()
	
	local _RENDERBG = false
	local _RENDERSTAGE = true
	
	love.filesystem.setIdentity("jellycar_render")
	
	
	love.graphics.setLineWidth(6)
	love.graphics.setLineJoin('miter')
	love.graphics.setDefaultFilter( 'nearest','nearest')
	love.graphics.setLineStyle('rough')
	
	if _RENDERBG then
		bgs = {}
		for i=0,14 do
			bgs[i] = love.graphics.newImage('jc_bg/bg-'..i..'.png')
		end
		
		
		bgcanvas = love.graphics.newCanvas(800,600)
		
		for i=0,14 do
			love.graphics.setCanvas(bgcanvas)
			love.graphics.clear(209/255,227/255,235/255,1)
			for x=0,3 do
				for y=0,2 do
					love.graphics.draw(bgs[i],x*245-10,y*245-10)
				end
			end
			love.graphics.setCanvas()
			bgcanvas:newImageData():encode('png','bg'..string.format('%02d', i)..'.png')
		end
	end
	
	
	
	finalpoints = {}
	if _RENDERSTAGE then
		love.window.setMode(520,194)
		
		
		
		bresenham = dofile('bresenham.lua/bresenham.lua')
		
		

		function getpoints(x0,y0,x1,y1,scale)
			local p = bresenham.line(x0,y0,x1,y1,function() return true end)
			table.insert(finalpoints,{x0,y0})
			local dist = math.ceil(#p / scale)
			for i=0,scale do
				table.insert(finalpoints,p[i*dist])
			end
		end
		
		getpoints(10,10,510,10,25)
		getpoints(510,10,510,136,4)
		getpoints(510,135,461,184,4)
		getpoints(461,184,59,184,17)
		getpoints(59,184,10,136,4)
		getpoints(10,135,10,10,7)
		
		
		
		
		stagecanvas = love.graphics.newCanvas(520,194)
		love.graphics.setColor(0,0,0,1)
		for i=0,39 do
			
			love.graphics.setCanvas(stagecanvas)
			love.graphics.clear()
			
			local wiggledpoints = {}
			for _i,v in ipairs(finalpoints) do
				table.insert(wiggledpoints,v[1]+math.random(0,2)-1)
				table.insert(wiggledpoints,v[2]+math.random(0,2)-1)
			end
			wiggledpoints[#wiggledpoints] = nil
			wiggledpoints[#wiggledpoints] = nil
			
			love.graphics.polygon('line',wiggledpoints)
			
			love.graphics.setCanvas()
			stagecanvas:newImageData():encode('png','stage'..string.format('%02d', i)..'.png')
		end
			
		
		
		
	end
		
		
	
end

function love.update()
	
end

function love.draw()
	--love.graphics.print('done!')
	love.graphics.setColor(1,1,1,1)
	local wiggledpoints = {}
	
	love.graphics.setPointSize(2)
	for i,v in ipairs(finalpoints) do
		love.graphics.points(v[1],v[2])
		table.insert(wiggledpoints,v[1]+math.random(0,2)-1)
		table.insert(wiggledpoints,v[2]+math.random(0,2)-1)
	end
	wiggledpoints[#wiggledpoints] = nil
	wiggledpoints[#wiggledpoints] = nil
	
	
	love.graphics.polygon('line',wiggledpoints)
	
end