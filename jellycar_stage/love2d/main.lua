function love.load()
	
	local _RENDERBG = false
	local _RENDERSTAGE = true
	
	love.filesystem.setIdentity("jellycar_render")
	
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
	
	
	if _RENDERSTAGE then
		bresenham = dofile('bresenham.lua/bresenham.lua')
		finalpoints = 
		
		
	end
		
		
	
end

function love.update()
	
end

function love.draw()
	love.graphics.print('done!')
end