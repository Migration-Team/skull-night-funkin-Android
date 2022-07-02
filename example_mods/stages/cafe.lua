local weak = 0

function onCreate()
	-- background shit
	makeLuaSprite('cafeback', 'madmans/cafeback', -600, -650)
	setScrollFactor('cafeback', 0.9, 0.9)

	makeLuaSprite ('black', 'effects/Black screen', -350,-250)
	setScrollFactor('black', 0, 0)
	scaleObject('black', 1.5, 2)

	makeLuaSprite ('white', 'effects/White screen', -350,-250)
	setScrollFactor('white', 0, 0)
	scaleObject('white', 1.5, 2)


	makeLuaSprite ('light', 'effects/spotlight', -100,0)
	setScrollFactor('light', 0, 0)
	scaleObject('light', 1.1, 1)


	--setProperty('black.alpha', 0)

	
	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
	   makeAnimatedLuaSprite('bgJaky', 'madmans/bgJaky', -50, -40)
	   setScrollFactor('bgJaky', 0.9, 0.9)
	   addAnimationByPrefix('bgJaky', 'sentaodepana', 'bgJaky sentao', 24, true)

	   makeAnimatedLuaSprite('bgPokemons', 'madmans/bgPokemons', -470, 170)
	   setScrollFactor('bgPokemons', 0.9, 0.9)
	   addAnimationByPrefix('bgPokemons', 'bopping', 'bgPokemons idle', 24, true)

	   makeAnimatedLuaSprite('bgPublicCafe', 'madmans/bgPublicCafe', -300, 420)
	   setScrollFactor('bgPublicCafe', 0.7, 0.2)
	   scaleObject('bgPublicCafe', 1.4, 1.4)
	   addAnimationByPrefix('bgPublicCafe', 'bopping', 'bgPublicCafe idle', 24, true)

	end

	addLuaSprite('cafeback', false)
	addLuaSprite('bgJaky', false)
	addLuaSprite('bgPokemons', false)
	addLuaSprite('bgPublicCafe', true)
	addLuaSprite('light', true)
	addLuaSprite('black', true)
end

function onUpdate()
	setProperty('white.alpha', getProperty('white.alpha') - 0.02)
	if weak > 0 then
		setProperty('black.alpha', getProperty('black.alpha') + 0.02)
	end
end

function onStep()		
	--for every step, wtf is a step?
	objectPlayAnimation('bgJaky', 'sentaodepana', false)
	objectPlayAnimation('bgPokemons', 'bopping', false)
	objectPlayAnimation('bgPublicCafe', 'bopping', false)
end

function onStepHit()
	if curStep == 47 then
		setProperty('black.alpha', 0)
	end
	if curStep == 304 then
		removeLuaSprite('light')
		addLuaSprite('white', true)
		setProperty('white.alpha', 1)
	end
	if curStep == 992 then
		weak = 1
	end
	if curStep == 1024 then
		removeLuaSprite('black')
		setProperty('white.alpha', 1)
	end
end