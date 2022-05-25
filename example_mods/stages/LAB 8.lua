function onCreate()
	-- background shit
	makeLuaSprite('Lab8back', 'Laboratories/Lab8back', -500, -600)
	setLuaSpriteScrollFactor('Lab8back', 0.85, 0.85)
	scaleLuaSprite('Lab8back', 1.5, 1.5)

	makeLuaSprite('Lab8floor', 'Laboratories/Lab8floor', -500, -600)
	setLuaSpriteScrollFactor('Lab8floor', 1, 1)
    scaleLuaSprite('Lab8floor', 1.5, 1.5)

	addLuaSprite('Lab8back', false)
	addLuaSprite('Lab8floor', false)
end