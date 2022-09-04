function onStartCountdown()
	setProperty('gf.alpha', 0) --No bitches?
	triggerEvent('Change Character', 'bf', 'playable gf')
    return Function_Continue
end

function onCreate()

	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'rip bozo') --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'Nightshow') --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'Retryshow') --put in mods/music/    
    
	-- background shit
	makeLuaSprite('catedral', 'spooky/Ruined', -350, -330)
	setScrollFactor('catedral', 0.9, 0.9)
	scaleObject('catedral', 0.8, 0.8)

	if not lowQuality then
	   makeLuaSprite('blue', 'effects/Blue overlay', 0, 0)
	   setScrollFactor('blue', 0, 0)
	   scaleObject('blue', 1, 1)
	   setProperty('blue.alpha', 0.6)
	   setObjectCamera('blue', 'camOther')
       setProperty('blue.antialiasing',false)
	end

   addLuaSprite('catedral', false)
   addLuaSprite('blue', true)		
end

function onGameOver()
	-- You died! Called every single frame your health is lower (or equal to) zero
	--return Function_Stop if you want to stop the player from going into the game over screen
    playSound('operate', 1)
    return Function_Continue;
end