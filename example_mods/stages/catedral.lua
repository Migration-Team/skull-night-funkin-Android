function onCreate()
	-- background shit
	makeLuaSprite('catedral', 'spooky/catedral', -350, -300)
	setScrollFactor('catedral', 0.9, 0.9)
	scaleObject('catedral', 1.2, 1.2)

	makeLuaSprite('overlay', 'effects/cooler overlay', 0, 0)
	setObjectCamera('overlay', 'hud')
	setProperty('overlay.antialiasing',false)

	if not lowQuality then
		makeAnimatedLuaSprite('nun','spooky/the_nun', -240, 80)
		scaleObject('nun', 0.8, 0.8)
		setScrollFactor('nun', 0.9, 0.9)
		addAnimationByPrefix('nun', 'bopping', 'the_nun exists', 24, true)
		setProperty('nun.alpha', 0)
		addLuaSprite('nun')	


		--shhhh
		makeLuaSprite('QR','QR/valentine',-500,-500)
		setProperty('QR.antialiasing',false)
		setObjectCamera('QR','hud')
		--addLuaSprite('QR') hell nah, the stage is so big itself
	end

   addLuaSprite('catedral', false)
   addLuaSprite('overlay', false)
end


function onStepHit()
	objectPlayAnimation('nun', 'bopping', false)
end