function onCreate()
	-- background shit
	makeLuaSprite('Innsmouth', 'fishbone/Innsmouth', -550, -180)
	setScrollFactor('Innsmouth', 1, 1)
	scaleObject('Innsmouth', 1.2, 1.2)

	if not lowQuality then
		makeAnimatedLuaSprite('bgCartoons', 'fishbone/bgCartoons', 1050, 250)
		setScrollFactor('bgCartoons', 1, 1)
		scaleObject('bgCartoons', 1.2, 1.2)
		addAnimationByPrefix('bgCartoons', 'bopping', 'bgCartoons idle', 24, true)

		makeAnimatedLuaSprite('bgFishAndPirate', 'fishbone/bgFishAndPirate', 20, 90)
		setScrollFactor('bgFishAndPirate', 1, 1)
		scaleObject('bgFishAndPirate', 1.2, 1.2)
		addAnimationByPrefix('bgFishAndPirate', 'bopping', 'bgFishAndPirate', 24, true)

		makeAnimatedLuaSprite('bgBlackAndFish', 'fishbone/bgBlackAndFish', -480, 50)
		setScrollFactor('bgBlackAndFish', 1, 1)
		scaleObject('bgBlackAndFish', 1.2, 1.2)
		addAnimationByPrefix('bgBlackAndFish', 'bopping', 'bgBlackAndFish', 24, true)
	end
	addLuaSprite('Innsmouth', false)
	addLuaSprite('bgCartoons', false)
	addLuaSprite('bgBlackAndFish', false)
	addLuaSprite('bgFishAndPirate', false)
end

function onStep()
	--for every step, wtf is a step?
	objectPlayAnimation('bgCartoons', 'bopping', false)
	objectPlayAnimation('bgFishAndPirate', 'bopping', false)
	objectPlayAnimation('bgBlackAndFish', 'bopping', false)
end