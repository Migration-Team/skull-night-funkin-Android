local uuuum = false

--light effects
local faster = false
local fastest = false
local sofuckingfast = false
local stop = false
local red = false

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

function onUpdate()
	if coolshit == 3 then
		setProperty ('redoverlay.alpha', getProperty('redoverlay.alpha')+ 0.04)
	end
end

function onStepHit()
	if sofuckingfast == true then
		setProperty('red.alpha', 1)
	end
end

function onBeatHit()
	
	if fastest == true then
		setProperty('red.alpha', 1)
		doTweenAlpha('redAppears', 'red', 0, 0.35, 'linear')
	end
	if coolshit == 2 then
		setProperty ('redoverlay.alpha', 1)
	end


	if  curBeat == 192 then
		faster = true
		red = true
		addLuaSprite('redoverlay', true)
		doTweenAlpha('scaryOverlay','redoverlay',0,0.35,'linear')
		doTweenAlpha('SCARY','nun',1,20,'linear')
	end

	if curBeat == 472 then
		stop = true
		faster = false
		fastest = true
	end

	if curBeat == 480 then
		fastest = false
		sofuckingfast = true
	end

	if curBeat == 488 then
		doTweenAlpha('scaryOverlay','redoverlay',1, 1,'linear')
		sofuckingfast = false
	end

	if stop == false and curBeat % 4 == 0 then
		if red == false then 
			setProperty('blue.alpha', 1)
			doTweenAlpha('blueAppears', 'blue', 0, 0.35, 'linear')
		else
			setProperty('red.alpha', 1)
			doTweenAlpha('redAppears', 'red', 0, 0.35, 'linear')
		end
	end
	
	if faster == true and curBeat % 4 == 2 then
		if red == false then 
			setProperty('blue.alpha', 1)
			doTweenAlpha('blueAppears', 'blue', 0, 0.35, 'linear')
		else
			setProperty('red.alpha', 1)
			doTweenAlpha('redAppears', 'red', 0, 0.35, 'linear')
		end
	end

end



function onGameOver()
	-- You died! Called every single frame your health is lower (or equal to) zero
	--return Function_Stop if you want to stop the player from going into the game over screen
    playSound('operate', 1)
    return Function_Continue;
end

function onEndSong()
	if isStoryMode and not uuuum and not seenCutscene then
		setProperty('inCutscene', true)
        startVideo('TY')
		uuuum = true
		return Function_Stop;
	end
	return Function_Continue;
end
