

function createObjects(name, amount)
	for i = 0, amount do
		name[i]={}
		name[i].x = 0
		name[i].y = 0
		name[i].xvel = 0
		name[i].yvel = 0
		name[i].rot = 0
		name[i].rotvel = 0
		name[i].spawned = false
		name[i].timer = 0
		name[i].alpha = 255
		name[i].radius = 0
		name[i].sides = 0
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
	colR = 0
	colG = 0
	colB = 0
	revR = false
	revG = false
	revB = false
end
function love.update(dt)		
	xmouse, ymouse = love.mouse.getPosition()
	counter = counter + dt
	if counter > 0.2 then
		for	i=0,30 do
			a = a + 1
			bullets[a].x = math.random(0,love.window.getWidth())--xmouse --xPos
			bullets[a].y = love.window.getHeight()+25 --ymouse --yPos
			bullets[a].xvel = math.random(-50,50)--math.sin(rotationVal) * 800 --* dt
			bullets[a].yvel = math.random(20,250)--math.cos(rotationVal) * 800 --* dt
			bullets[a].spawned = true
			bullets[a].timer=0
			bullets[a].alpha=255
			bullets[a].radius = math.random(4,8)
			bullets[a].sides = math.random(4,6)
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
		bullets[i].alpha = bullets[i].alpha - (dt * 150)
		if bullets[i].alpha < 0 then
			bullets[i].spawned=false
			bullets[i].timer=0
		end
	end
		
	if xPos > love.window.getWidth() then
		xPos = 0
	end
	if xPos < 0 then
		xPos = love.window.getWidth()
	end
	if yPos > love.window.getHeight() then
		yPos = 0
	end
	if yPos < 0 then
		yPos = love.window.getHeight()
	end
	
	if revR == false then
		colR = colR + 140*dt
	else 
		colR = colR - 140*dt
	end
	if revG == false then
		colG = colG + 165*dt
	else 
		colG = colG - 165*dt
	end
	if revB == false then
		colB = colB + 100*dt
	else 
		colB = colB - 100*dt
	end
	
	if colR > 255 then
		revR = true
		colR = 255
	elseif colR < 0 then
		revR = false
		colR = 0
	end
	if colG > 255 then
		revG = true
		colG=255
	elseif colG < 0 then
		revG = false
		colG=0
	end
	if colB > 255 then
		revB = true
		colB=255
	elseif colB < 0 then
		revB = false
		colB=0
	end
	
	
	
	
	
end
function love.draw()
	
	--for i = 0, 10 do
	
	for i=0,400 do
		if bullets[i].spawned == true then
			love.graphics.setColor(colR,colG,colB,bullets[i].alpha)
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


