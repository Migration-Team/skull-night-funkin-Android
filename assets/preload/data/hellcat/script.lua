function onCreate()

	precacheImage('fishbone/prrsonal')

    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'rip bozo'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'Nightshow'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'Retryshow'); --put in mods/music/

	if not lowQuality then
		--- msfortune cuote sprite cause the object play animation event is kinda poopy
		makeAnimatedLuaSprite('catussy', 'fishbone/prrsonal', -200, 80)
		setScrollFactor('catussy', 1, 1)
		addAnimationByPrefix('catussy', 'cuote', 'prrsonal', 24, false)
	end
end

function onEvent(name)
	if name == 'ON' and not lowQuality then
		setProperty('dad.alpha', 0)
		addLuaSprite('catussy', true)
		objectPlayAnimation('catussy', 'cuote', false)
	end
	if name == 'OFF' and not lowQuality then
		removeLuaSprite('catussy')
		setProperty('dad.alpha', 1)
	end
end

function onGameOver()
	-- You died! Called every single frame your health is lower (or equal to) zero
	-- return Function_Stop if you want to stop the player from going into the game over screen
    playSound('ms fortune win', 1)
    return Function_Continue;
end
