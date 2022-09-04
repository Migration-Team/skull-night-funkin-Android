local stopBopping = false

function onCreate()
	-- background shit
	makeLuaSprite('Lab8back', 'Laboratories/Lab8back', -500, -600)
	setScrollFactor('Lab8back', 0.85, 0.85)
	scaleObject('Lab8back', 1.5, 1.5)

	makeLuaSprite('Lab8floor', 'Laboratories/Lab8floor', -500, -600)
	setScrollFactor('Lab8floor', 1, 1)
    scaleObject('Lab8floor', 1.5, 1.5)

	if not lowQuality then
		makeAnimatedLuaSprite('bgExperiments', 'Laboratories/left', -560, -145)
		setScrollFactor('bgExperiments', 1, 1)
		scaleObject('bgExperiments', 1.4, 1.4)
		addAnimationByPrefix('bgExperiments', 'bopping', 'idle left', 24, false)
		addAnimationByPrefix('bgExperiments', 'HEY', 'left hey', 24, false)

		makeAnimatedLuaSprite('bgScience', 'Laboratories/right', 1200, 20)
		setScrollFactor('bgScience', 1, 1)
		scaleObject('bgScience', 1.4, 1.4)
		addAnimationByPrefix('bgScience', 'bopping', 'Right Idle', 24, false)
		addAnimationByPrefix('bgScience', 'HEY', 'Right hey', 24, false)

        --shhhh
		makeLuaSprite('QR','QR/peacock',-500,-500)
		setProperty('QR.antialiasing',false)
		setObjectCamera('QR','hud')
		addLuaSprite('QR')
	end
	addLuaSprite('Lab8back', false)
	addLuaSprite('Lab8floor', false)
	addLuaSprite('bgExperiments', false)
	addLuaSprite('bgScience', false)
end

function onBeatHit()
	if stopBopping == false then
        if curBeat % 2 == 0 then
    	 objectPlayAnimation('bgExperiments', 'bopping', false)
    	 setProperty('bgExperiments.y', -145)
    	 objectPlayAnimation('bgScience', 'bopping', false)
    	 setProperty('bgScience.y', 20)
        end
	end
end

function onEvent(name)
	if name == 'bgHey' then
		stopBopping = true
		objectPlayAnimation('bgExperiments', 'HEY', false)
		setProperty('bgExperiments.y', -400)
		objectPlayAnimation('bgScience', 'HEY', false)
		setProperty('bgScience.y', -28)
		runTimer('resetBopping', 0.5)
	end
end

function onTimerCompleted(name)
	if name == 'resetBopping' then
		stopBopping = false
	end
end