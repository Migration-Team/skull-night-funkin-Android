local MONO = false


function onCreate()

	precacheImage('characters/PicoExtra')
	precacheImage('Laboratories/monoback')
	precacheImage('Laboratories/monoFloor')
	precacheImage('Laboratories/monoleft')
	precacheImage('characters/monocock')
	precacheImage('characters/MONOpico')


    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'rip bozo'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'Nightshow'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'Retryshow'); --put in mods/music/

	-- general stuff
	makeLuaSprite ('black', uhh, -10, -10)
	setObjectCamera('black', 'hud')
	luaSpriteMakeGraphic('black', 2000, 1500, '000000')
	setProperty('black.antialiasing',false)
	addLuaSprite('black', false)

	makeLuaSprite('tuto','gameplay',0,0)
    setObjectCamera('tuto', 'other')
    setProperty('tuto.alpha',0)
    addLuaSprite('tuto')

	--COOL moment
	makeLuaSprite('coolCam1', cC1, 0, 0)
    setObjectCamera('coolCam1', 'hud')
    luaSpriteMakeGraphic('coolCam1', 1280, 70, '000000')

    makeLuaSprite('coolCam2', cC2, 0, 650)
    setObjectCamera('coolCam2', 'hud')
    luaSpriteMakeGraphic('coolCam2', 1280, 70, '000000')

	if not lowQuality then
		makeLuaSprite('MONO8back', 'Laboratories/monoback', -500, -600)
		setScrollFactor('MONO8back', 0.85, 0.85)
		scaleObject('MONO8back', 1.5, 1.5)
	
		makeLuaSprite('MONO8floor', 'Laboratories/monoFloor', -500, -600)
		setScrollFactor('MONO8floor', 1, 1)
		scaleObject('MONO8floor', 1.5, 1.5)

        makeAnimatedLuaSprite('bgMONO', 'Laboratories/monoleft', -560, -145)
		setScrollFactor('bgMONO', 1, 1)
		scaleObject('bgMONO', 1.4, 1.4)
		addAnimationByPrefix('bgMONO', 'bopping', 'idle left', 24, false)
	end  
end

function onCountdownTick(counter)
	if counter == 0 then
		removeLuaSprite('black')
    	triggerEvent('Change Character', 'bf', 'pico')
    	setProperty('gf.alpha', 0) --No bitches?
		if flashingLights then
			cameraFlash('hud', 'ffffff', 0.5, false)
		end
	end
end


function onBeatHit()
    if curBeat == 8 then
        doTweenAlpha('tutoAppears','tuto',1,0.5,'linear')
    end
    if MONO == true then
        objectPlayAnimation('bgMONO', 'bopping', false)
    end
end

function onEvent(name)
    if name == 'ON' then

        MONO = true
        addLuaSprite('coolCam1', false)
        addLuaSprite('coolCam2', false)
		
		if flashingLights then
        	cameraFlash('hud', 'ffffff', 1, false)
		end
		
		if not lowQuality then
			triggerEvent('Change Character', 'dad', 'mono-peacock')
  	     	triggerEvent('Change Character', 'bf', 'mono-pico')

   	        setProperty('Lab8floor.alpha', 0)
    	    setProperty('Lab8back.alpha', 0)
     	    setProperty('bgExperiments.alpha', 0)

			addLuaSprite('MONO8back', false)
			addLuaSprite('MONO8floor', false)
			addLuaSprite('bgMONO', false)   
		end

    end
    if name == 'OFF' then
        MONO = false
		doTweenY('cC1bye', 'coolCam1', -100, 1, 'linear')
        doTweenY('cC2bye', 'coolCam2', 750, 1, 'linear')

		if not lowQuality then
        	triggerEvent('Change Character', 'dad', 'peacock')
        	triggerEvent('Change Character', 'bf', 'pico')
			
			setProperty('Lab8floor.alpha', 1)
        	setProperty('Lab8back.alpha', 1)
        	setProperty('bgExperiments.alpha', 1)

        	removeLuaSprite('MONO8back', false)
        	removeLuaSprite('MONO8floor', false)
        	removeLuaSprite('bgMONO', false)
		end    

    end
end

function onTweenCompleted(tag)
    if tag == 'tutoAppears' then
        runTimer('readIt!', 3)
    end
    if tag == 'cC1bye' then
        removeLuaSprite('coolCam1')
        removeLuaSprite('coolCam2')
    end
    if tag == 'tutoBye' then
        removeLuaSprite('tuto')
    end
end

function onTimerCompleted(tag)
    if tag == 'readIt!' then
        doTweenAlpha('tutoBye','tuto',0,0.5,'linear')
    end
end

function onGameOver()
	-- You died! Called every single frame your health is lower (or equal to) zero
	-- return Function_Stop if you want to stop the player from going into the game over screen
    playSound('peacock insult', 1)
    return Function_Continue;
end