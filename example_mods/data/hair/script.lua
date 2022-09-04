local revengeOfTheBlackScreen = false

function onCreate()

	precacheImage('characters/Samson')

    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'rip bozo'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'Nightshow'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'Retryshow'); --put in mods/music/

	makeLuaSprite ('black', uhh, -300, -200)
	setScrollFactor('black', 0, 0)
	luaSpriteMakeGraphic('black', 2000, 1500, '000000')
	setProperty('black.antialiasing',false)

	makeLuaSprite ('light', 'effects/spotlight', -100,0)
	setScrollFactor('light', 0, 0)
	scaleObject('light', 1.1, 1)
	setProperty('light.antialiasing',false)

	addLuaSprite('light', true)
	addLuaSprite('black', true)

end

function onStepHit()
	if curStep == 47 then
		setProperty('black.alpha', 0)
	end
	if curStep == 304 then
		removeLuaSprite('light')
		if flashingLights then
		   cameraFlash('hud', 'ffffff', 0.7, false)
		end
	end
	if curStep == 992 then
        revengeOfTheBlackScreen = true
	end
	if curStep == 1024 then
		revengeOfTheBlackScreen = false
		removeLuaSprite('black')
		if flashingLights then
			cameraFlash('hud', 'ffffff', 0.7, false)
		end
	end
end


function onUpdate()
	if revengeOfTheBlackScreen == true then
		setProperty('black.alpha', getProperty('black.alpha') + 0.02)
	end
end

function onGameOver()
	-- You died! Called every single frame your health is lower (or equal to) zero
	--return Function_Stop if you want to stop the player from going into the game over screen
        playSound('filia retry', 1)
    return Function_Continue;
end