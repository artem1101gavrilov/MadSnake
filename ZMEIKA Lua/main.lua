
function love.load()
	love.window.setMode(800, 800)
	background1 = love.graphics.newImage("background1.png")
	background2 = love.graphics.newImage("background2.png")
	background3 = love.graphics.newImage("background3.png")
	background4 = love.graphics.newImage("background4.png")
	background5 = love.graphics.newImage("background5.png")

	width = love.graphics.getWidth() - 30			--функция возвращает длину окна на данный момент
	height = love.graphics.getHeight() - 30			--тоже самое но с высотой
	
	snake = { } 						--инициализируем таблицу с координатами змейки
	for i = 1, 30 do 						--первые 10 клеток надо с чего-то начинать
		point = { x = 20;					--и снова X..
				  y = 20 + i; }					--и Y..
		table.insert(snake, point)				--вписываем в таблицу
	end
	reserchrandomX = true
	reserchrandomY = true
	NewX = 0
	NewY = 0
	while reserchrandomX do
		NewX = math.random(30, width)
		for k, v in pairs(snake) do 			        --отрисовываем каждую клетку
			if NewX == v.x then
				reserchrandomX = true
				break
			else
				reserchrandomX = false
			end
		end
	end 
	while reserchrandomY do
		NewY = math.random(30, height)
		for k, v in pairs(snake) do 			        --отрисовываем каждую клетку
			if NewY == v.y then
				reserchrandomY = true
				break
			else
				reserchrandomY = false
			end
		end
	end 
	apple = { x = NewX;			--теперь нам нужно яблоко генерируем X-координату
			  y = NewY; } 		        --и Y..
	
	direction = "right"
	gaming = true
	result = 0

	mainFont = love.graphics.newFont(50);
	love.graphics.setFont(mainFont);

	countdt = 0
	rezhim = 1 
end
 
function love.update(dt)
	countdt = countdt + dt
	speed = 0
	if rezhim == 5 then
		speed = 0
	elseif rezhim == 4 then
		speed = 0.02
	elseif rezhim == 3 then
		speed = 0.04
	elseif rezhim == 2 then
		speed = 0.06
	else
		speed = 0.08
	end
	if(countdt > speed) then 
		if (apple.x > (snake[1].x) and apple.x < (snake[1].x + 20)) and
			(apple.y > (snake[1].y) and apple.y < (snake[1].y + 20)) then
			reserchrandomX = true
			reserchrandomY = true
			NewX = 0
			NewY = 0
			while reserchrandomX do
				NewX = math.random(30, width)
				for k, v in pairs(snake) do 			        --отрисовываем каждую клетку
					if NewX == v.x then
						reserchrandomX = true
						break
					else
						reserchrandomX = false
					end
				end
			end 
			while reserchrandomY do
				NewY = math.random(30, height)
				for k, v in pairs(snake) do 			        --отрисовываем каждую клетку
					if NewY == v.y then
						reserchrandomY = true
						break
					else
						reserchrandomY = false
					end
				end
			end 
			apple = { x = NewX;		                --вот и поели, генерируем X-координату
					  y = NewY; } 	                        --и Y..
			result = result + 1
		else 								--не сразу ясно, но понятно
			for i = 1, 10 do 
				table.remove(snake, table.getn(snake)) 				--убираем последний элемент и добавляем его в начало
			end
		end

		if direction == "up" then					--ну тут вроде все ясно, обрабатываем направление
			for i = 1, 10 do 
				table.insert(snake, 1, { x = snake[1].x;
									 y = (snake[1].y - 1);})
			end
		elseif direction == "down" then
			for i = 1, 10 do 
				table.insert(snake, 1, { x = snake[1].x;
									 y = (snake[1].y + 1); })
			end
		elseif direction == "left" then
			for i = 1, 10 do 
				table.insert(snake, 1, { x = (snake[1].x - 1);
									 y = snake[1].y; })
			end
		else
			for i = 1, 10 do 
				table.insert(snake, 1, { x = (snake[1].x + 1);
									 y = snake[1].y; })
			end
		end
		if snake[1].x < 0 or snake[1].x > 800 or snake[1].y < 0 or snake[1].y > 800 then 
			gaming = false
		end
		lalala = 0
		for k, v in pairs(snake) do 			        --отрисовываем каждую клетку
			if lalala == 1 then
				if snake[1].x == v.x and snake[1].y == v.y then
					gaming = false
				end
			end
			lalala = 1
		end
		countdt = 0;
	end
end
 
function love.keypressed(key, unicode)
	if key == "up" or key == "w" then
		direction = "up"
	elseif key == "down"  or key == "s" then
		direction = "down"
	elseif key == "left"  or key == "a" then
		direction = "left"
	elseif key == "right"  or key == "d" then
		direction = "right"
	elseif key == "escape" then
		love.event.quit()
	end
	if key == "r" then
		love.load()
	end
	if key == "1" then
		rezhim = 1
	end
	if key == "2" then
		rezhim = 2
	end
	if key == "3" then
		rezhim = 3
	end
	if key == "4" then
		rezhim = 4
	end
	if key == "5" then
		rezhim = 5
	end
end

function love.keyreleased(key, unicode)
end 

function love.mousepressed(x, y, button, istouch)
   if button == 1 then
   end
end

function love.mousereleased(x, y, button, istouch)
   if button == 1 then
   end
end

function love.draw()
	love.graphics.setColor(150, 150, 150)
	if rezhim == 5 then
		love.graphics.draw(background5, 0, 0)
	elseif rezhim == 4 then
		love.graphics.draw(background4, 0, 0)
	elseif rezhim == 3 then
		love.graphics.draw(background3, 0, 0)
	elseif rezhim == 2 then
		love.graphics.draw(background2, 0, 0)
	else
		love.graphics.draw(background1, 0, 0)
	end
	if gaming == true then 
		love.graphics.setColor(220, 0, 0)
		for k, v in pairs(snake) do 			        --отрисовываем каждую клетку
			love.graphics.rectangle("fill", v.x, v.y, 20, 20)
		end

		love.graphics.setColor(0, 255, 0)					
		love.graphics.circle("fill", apple.x, apple.y, 5, 5)
	else
		love.graphics.setColor(220, 220, 220)
		love.graphics.print("GAME OVER ", 200, 200)
		love.graphics.print("Score " .. result, 200, 250)
		love.graphics.print("R - retry ", 200, 300)
	end
end