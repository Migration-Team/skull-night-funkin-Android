function onStartCountdown()
	setProperty('gf.alpha', 0) --No bitches?

    return Function_Continue
end

function onCreate()
	-- background shit
	makeLuaSprite('floor', 'theroom/floor', 100, 0)
	setScrollFactor('floor', 0.9, 0.9)
	scaleObject('floor', 0.8, 0.8)

	if not lowQuality then
		makeAnimatedLuaSprite('gang', 'theroom/bgGang', 300, 170)
		setScrollFactor('gang', 0.9, 0.9)
		addAnimationByPrefix('gang', 'bopping', 'bgGang idle', 24, false)
		scaleObject('gang', 0.78, 0.78)
	end

	makeLuaSprite('lamp', 'theroom/lamp', 100, 0)
	setScrollFactor('lamp', 0.9, 0.9)
	scaleObject('lamp', 0.8, 0.8)

	addLuaSprite('floor', false)
	addLuaSprite('gang', false)
	addLuaSprite('lamp', true)
end

function onBeatHit()
	objectPlayAnimation('gang','bopping', false)
end