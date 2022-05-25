function onCreate()
	-- background shit
	makeLuaSprite('cafeback', 'madmans/cafeback', -600, -650);
	setScrollFactor('cafeback', 0.9, 0.9);
	
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
end

function onStep()		
	--for every step, wtf is a step?
	objectPlayAnimation('bgJaky', 'sentaodepana', false)
	objectPlayAnimation('bgPokemons', 'bopping', false)
	objectPlayAnimation('bgPublicCafe', 'bopping', false)
end