function onCreate()
	-- background shit
	makeLuaSprite('catedral', 'spooky/catedral', -350, -300)
	setScrollFactor('catedral', 0.9, 0.9)
	scaleObject('catedral', 1.2, 1.2)

	makeLuaSprite('overlay', 'effects/overlay', -210, -150)
	setScrollFactor('overlay', 0, 0)
	scaleObject('overlay', 1.5, 1.5)
	
	addLuaSprite('catedral', false)
	addLuaSprite('overlay', true)

end