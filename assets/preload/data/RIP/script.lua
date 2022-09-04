--light effects
local faster = false
local red = false
local stop = false

-- red screen effects
local coolshit = 0

function onCreate()
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'rip bozo'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'Nightshow'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'Retryshow'); --put in mods/music/


	if not lowQuality then
		makeLuaSprite('redoverlay', uhh , -10, -10)
		luaSpriteMakeGraphic('redoverlay', 1300, 800, 'ff0000')
		setObjectCamera('redoverlay', 'hud')
		setProperty('redoverlay.antialiasing',false)
	end

	if flashingLights then
		makeLuaSprite('blue', 'effects/Blue overlay', 0, 0)
		setObjectCamera('blue', 'hud')
		setProperty ('blue.alpha', 0)
		setProperty('blue.antialiasing',false)

		makeLuaSprite('red', 'effects/Red overlay', 0, 0)
		setObjectCamera('red', 'hud')
	    setProperty ('red.alpha', 0)
	    setProperty('red.antialiasing',false)
	end

	addLuaSprite('blue', false)
	addLuaSprite('red', false)

end



function onBeatHit()

	if  curBeat == 286 then
		faster = true
	end

	if curBeat == 352 then
		red = true
		addLuaSprite('redoverlay', true)
		setObjectCamera('redoverlay','camOther')
		doTweenAlpha('scaryOverlay','redoverlay',0,0.35,'linear')
	end

	if stop == false and curBeat % 4 == 2 then
		if red == false then 
			setProperty('blue.alpha', 1)
			doTweenAlpha('blueAppears', 'blue', 0, 0.35, 'linear')
		else
			setProperty('red.alpha', 1)
			doTweenAlpha('redAppears', 'red', 0, 0.35, 'linear')
		end
	end
	
	if faster == true and curBeat % 4 == 0 then
		if red == false then 
			setProperty('blue.alpha', 1)
			doTweenAlpha('blueAppears', 'blue', 0, 0.35, 'linear')

		else
			setProperty('red.alpha', 1)
			doTweenAlpha('redAppears', 'red', 0, 0.35, 'linear')
		end
	end
end

function onTweenCompleted(tag)
	if tag == 'scaryOverlay' then
		removeLuaSprite('redoverlay')
	end
end

function onGameOver()
	-- You died! Called every single frame your health is lower (or equal to) zero
	--return Function_Stop if you want to stop the player from going into the game over screen
    playSound('operate', 1)
    return Function_Continue;
end