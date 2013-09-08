

function createObjects(name, amount)
	for i = 0, amount do
		name[i]={
		x = 0,
		y = 0,
		xvel = 0,
		yvel = 0,
		rot = 0,
		rotvel = 0,
		spawned = false,
		timer = 0,
		alpha = 255,
		radius = 0,
		sides = 0,
		colR = 0,
		colG = 0,
		colB = 0,
		revR = false,
		revG = false,
		revB = false
		}
	end
end

function updateLocation(name, amount)
	for i = 1, amount do
		name[i].x = name[i].x + name[i].xvel
		name[i].y = name[i].y + name[i].yvel
		name[i].rot = name[i].rot + name[i].rotvel
	end
end




function love.load()
	love.graphics.setBackgroundColor(255,255,255,255)
	love.window.setMode(500,500,{resizable = true, vsync = false})

	rotationVal = 0
	xPos = 200
	yPos = 200
	bulletTimer=0
	bullets={}
	createObjects(bullets,400)
	counter = 0
	a=0
	--[[colR = 0
	colG = 0
	colB = 0
	revR = false
	revG = false
	revB = false]]
end
function love.update(dt)		
	xmouse, ymouse = love.mouse.getPosition()
	counter = counter + dt
	if counter > 0.2 then
		for	i=0,30 do
			a = a + 1
			bullets[a].x = math.random(0,love.window.getWidth())--xmouse --xPos
			bullets[a].y = love.window.getHeight()+25 --ymouse --yPos
			bullets[a].xvel = math.random(-100,100)--math.sin(rotationVal) * 800 --* dt
			bullets[a].yvel = math.random(20,200)--math.cos(rotationVal) * 800 --* dt
			bullets[a].spawned = true
			bullets[a].timer=0
			bullets[a].alpha=255
			bullets[a].radius = math.random(4,8)
			bullets[a].sides = math.random(4,6)
			bullets[a].colR = math.random(255)
			bullets[a].colG = math.random(255)
			bullets[a].colB = math.random(255)
			if a >=400 then
				a=0
			end
		counter = 0
		end
	end
	for i=0,400 do
		bullets[i].x = bullets[i].x + bullets[i].xvel * dt
		bullets[i].y = bullets[i].y - bullets[i].yvel * dt
		bullets[i].timer = bullets[i].timer + dt
		bullets[i].alpha = bullets[i].alpha - (dt * 100)
		if bullets[i].alpha < 0 then
			bullets[i].spawned=false
			bullets[i].timer=0
		end
		
		
		
		if bullets[i].revR == false then
			bullets[i].colR = bullets[i].colR + 140*dt
		else 
			bullets[i].colR = bullets[i].colR - 140*dt
		end
		if bullets[i].revG == false then
			bullets[i].colG = bullets[i].colG + 165*dt
		else 
			bullets[i].colG = bullets[i].colG - 165*dt
		end
		if bullets[i].revB == false then
			bullets[i].colB = bullets[i].colB + 100*dt
		else 
			bullets[i].colB = bullets[i].colB - 100*dt
		end
		
		if bullets[i].colR > 255 then
			bullets[i].revR = true
			bullets[i].colR = 255
		elseif bullets[i].colR < 0 then
			bullets[i].revR = false
			bullets[i].colR = 0
		end
		if bullets[i].colG > 255 then
			bullets[i].revG = true
			bullets[i].colG=255
		elseif bullets[i].colG < 0 then
			bullets[i].revG = false
			bullets[i].colG=0
		end
		if bullets[i].colB > 255 then
			bullets[i].revB = true
			bullets[i].colB=255
		elseif bullets[i].colB < 0 then
			bullets[i].revB = false
			bullets[i].colB=0
		end
		
		
	end

	
	
	
	
	
end
function love.draw()
	
	--for i = 0, 10 do
	
	for i=0,400 do
		if bullets[i].spawned == true then
			love.graphics.setColor(bullets[i].colR,bullets[i].colG,bullets[i].colB,bullets[i].alpha)
			--love.graphics.draw(ball, bullets[i].x, bullets[i].y, 0, 2, 2)
			love.graphics.circle("fill", bullets[i].x, bullets[i].y, bullets[i].radius*4, bullets[i].sides)
			--love.graphics.setColor(0,0,0,bullets[i].alpha)
			--love.graphics.circle("line", bullets[i].x, bullets[i].y, bullets[i].radius, bullets[i].sides)
		end
	end
	--for asd=0,10 do
		--love.graphics.setColor(255,150,123,255)
		--love.graphics.print(tostring(10-asd), 15*asd, 20)
	--end
	--love.graphics.draw(arrow, xPos,yPos,rotationVal,0.2,0.2, arrow:getWidth()/2, arrow:getHeight()/2)
	
	love.graphics.setColor(0,0,0,255)
	love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
	
	
end


