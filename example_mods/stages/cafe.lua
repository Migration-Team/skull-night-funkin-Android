function onCreate()
	-- background shit
	makeLuaSprite('cafeback', 'madmans/cafeback', -600, -650)
	setScrollFactor('cafeback', 0.9, 0.9)
	
	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeAnimatedLuaSprite('bgJaky', 'madmans/Persona_5_irl', -50, -40)
		setScrollFactor('bgJaky', 0.9, 0.9)
		addAnimationByPrefix('bgJaky', 'sentaodepana', 'persona 5 irl', 24, false)
 
		makeAnimatedLuaSprite('bgPokemons', 'madmans/pokemon', -550, 120)
		setScrollFactor('bgPokemons', 0.9, 0.9)
		addAnimationByPrefix('bgPokemons', 'bopping', 'pokemon', 24, false)
 
		makeAnimatedLuaSprite('bgPublicCafe', 'madmans/FGP', -300, 380)
		setScrollFactor('bgPublicCafe', 0.7, 0.2)
		scaleObject('bgPublicCafe', 1.4, 1.4)
		addAnimationByPrefix('bgPublicCafe', 'bopping', 'FGPeople', 24, false)

		--shhhh
		makeLuaSprite('QR','QR/filia',-500,-500)
		setProperty('QR.antialiasing',false)
		setObjectCamera('QR','hud')
		addLuaSprite('QR')

	end

	addLuaSprite('cafeback', false)
	addLuaSprite('bgJaky', false)
	addLuaSprite('bgPokemons', false)
	addLuaSprite('bgPublicCafe', true)
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('bgJaky', 'sentaodepana', false)
		objectPlayAnimation('bgPokemons', 'bopping', false)
		objectPlayAnimation('bgPublicCafe', 'bopping', false)
	end
end