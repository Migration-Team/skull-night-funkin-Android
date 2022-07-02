function onCreate()
	-- background shit
	makeLuaSprite('ringback', 'wwe/ringback', -500, -500)
	setLuaSpriteScrollFactor('ringback', 1, 1)

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeAnimatedLuaSprite('bgRing', 'wwe/bgRing', -500, -500)
		setScrollFactor('bgRing', 1, 1)
		addAnimationByPrefix('bgRing', 'bopping', 'bgRing bopping', 24, true)
	end

	makeLuaSprite('ring', 'wwe/the ring itself', -500, -500)
	setLuaSpriteScrollFactor('ring', 1, 1)

	makeLuaSprite('ringcurtains', 'wwe/ringcurtains', -500, -500)
	setLuaSpriteScrollFactor('ringcurtains', 0.9, 0.9)

	addLuaSprite('ringback', false)
	addLuaSprite('bgRing', false)
	addLuaSprite('ring', false)
	addLuaSprite('ringcurtains', false)
end

function onStepHit()
	--for every step, wtf is a step?
	objectPlayAnimation('bgRing', 'bopping', false)
end