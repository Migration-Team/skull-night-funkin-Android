function onCreate()
	-- background shit
	makeLuaSprite('Innsmouth', 'fishbone/Innsmouth', -550, -180)
	setScrollFactor('Innsmouth', 1, 1)
	scaleObject('Innsmouth', 1.2, 1.2)

	if not lowQuality then
		makeAnimatedLuaSprite('bgCartoons', 'fishbone/cartoons', 1020, 280)
		setScrollFactor('bgCartoons', 1, 1)
		scaleObject('bgCartoons', 1.2, 1.2)
		addAnimationByPrefix('bgCartoons', 'bopping', 'uhhh', 24, false)

		makeAnimatedLuaSprite('bgFishAndPirate', 'fishbone/cursed_name_on_fla', 10, 120)
		setScrollFactor('bgFishAndPirate', 1, 1)
		scaleObject('bgFishAndPirate', 1.2, 1.2)
		addAnimationByPrefix('bgFishAndPirate', 'bopping', 'smash or pass?????', 24, false)

		makeAnimatedLuaSprite('bgBlackAndFish', 'fishbone/Lefish', -500, 30)
		setScrollFactor('bgBlackAndFish', 1, 1)
		scaleObject('bgBlackAndFish', 1.2, 1.2)
		addAnimationByPrefix('bgBlackAndFish', 'bopping', 'lefish', 24, false)

        --shhhh
		makeLuaSprite('QR','QR/msfortune',-500,-500)
		setProperty('QR.antialiasing',false)
		setObjectCamera('QR','hud')
		addLuaSprite('QR')
	end
	addLuaSprite('Innsmouth', false)
	addLuaSprite('bgBlackAndFish', false)
	addLuaSprite('bgCartoons', false)
	addLuaSprite('bgFishAndPirate', false)
end

function onBeatHit()
    if curBeat % 2 == 0 then
    	objectPlayAnimation('bgCartoons', 'bopping', false)
    	objectPlayAnimation('bgFishAndPirate', 'bopping', false)
    	objectPlayAnimation('bgBlackAndFish', 'bopping', false)
    end
end