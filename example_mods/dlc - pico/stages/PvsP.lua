-- A REALLY REALLY BIG THANKS TO WASHO FOR MAKING A CAMERA FOLLOWS CHAR SCRIP, tqm washo se que hablas español asi que besitos en la cola
-- Washo GB page: https://gamebanana.com/members/1971029
local xx = 500
local yy = 350
local xx2 = 1200
local yy2 = 400
local ofs = 40
local followchars = true
local del = 0
local del2 = 0
MONO = false

function onCountdownTick(counter)
    if counter == 2 then
        removeLuaSprite('black')
        cameraFlash('hud', 'ffffff', 0.5, false)
        triggerEvent('Change Character', 'bf', 'pico')
        setProperty('gf.alpha', 0) --No bitches?
    end
end


function onCreate()

    makeLuaSprite('black', 'effects/Black screen', 0, 0)
    setObjectCamera('black', 'hud')

	-- background shit
	makeLuaSprite('Lab8back', 'Laboratories/Lab8back', -500, -600)
	setScrollFactor('Lab8back', 0.85, 0.85)
	scaleObject('Lab8back', 1.5, 1.5)

	makeLuaSprite('Lab8floor', 'Laboratories/Lab8floor', -500, -600)
	setScrollFactor('Lab8floor', 1, 1)
    scaleObject('Lab8floor', 1.5, 1.5)

    makeLuaSprite('tuto','gameplay',0,0)
    setObjectCamera('tuto', 'other')
    setProperty('tuto.alpha',0)
    addLuaSprite('tuto')

    --cool moment

    makeLuaSprite('coolCam1', cC1, 0, 0)
    setObjectCamera('coolCam1', 'hud')
    luaSpriteMakeGraphic('coolCam1', 1280, 70, '000000')

    makeLuaSprite('coolCam2', cC2, 0, 650)
    setObjectCamera('coolCam2', 'hud')
    luaSpriteMakeGraphic('coolCam2', 1280, 70, '000000')

    makeLuaSprite('MONO8back', 'Laboratories/monoback', -500, -600)
	setScrollFactor('MONO8back', 0.85, 0.85)
	scaleObject('MONO8back', 1.5, 1.5)
    setProperty('MONO8back.alpha', 0)

	makeLuaSprite('MONO8floor', 'Laboratories/monoFloor', -500, -600)
	setScrollFactor('MONO8floor', 1, 1)
    scaleObject('MONO8floor', 1.5, 1.5)
    setProperty('MONO8floor.alpha', 0)

	if not lowQuality then
		makeAnimatedLuaSprite('bgExperiments', 'Laboratories/left', -560, -145)
		setScrollFactor('bgExperiments', 1, 1)
		scaleObject('bgExperiments', 1.4, 1.4)
		addAnimationByPrefix('bgExperiments', 'bopping', 'idle left', 24, false)
		--ddAnimationByPrefix('bgExperiments', 'HEY', 'left hey', 24, false)

		makeAnimatedLuaSprite('bgScience', 'Laboratories/right', 1200, 20)
		setScrollFactor('bgScience', 1, 1)
		scaleObject('bgScience', 1.4, 1.4)
		addAnimationByPrefix('bgScience', 'bopping', 'Right Idle', 24, false)
		--addAnimationByPrefix('bgScience', 'HEY', 'Right hey', 24, false)

        makeAnimatedLuaSprite('bgMONO', 'Laboratories/monoleft', -560, -145)
		setScrollFactor('bgMONO', 1, 1)
		scaleObject('bgMONO', 1.4, 1.4)
		addAnimationByPrefix('bgMONO', 'bopping', 'idle left', 24, false)
        setProperty('bgMONO.alpha', 0)

	end

	addLuaSprite('Lab8back', false)
	addLuaSprite('Lab8floor', false)
	addLuaSprite('bgExperiments', false)
	addLuaSprite('bgScience', false)
    addLuaSprite('black', true)

    addLuaSprite('MONO8back', false)
    addLuaSprite('MONO8floor', false)
    addLuaSprite('bgMONO', false)    
end

function onBeatHit()
    
    if curBeat == 8 then
        doTweenAlpha('tutoAppears','tuto',1,0.5,'linear')
    end

	objectPlayAnimation('bgExperiments', 'bopping', false)
	setProperty('bgExperiments.y', -145)
	objectPlayAnimation('bgScience', 'bopping', false)
	setProperty('bgScience.y', 20)
    if MONO == true then
        objectPlayAnimation('bgMONO', 'bopping', false)
    end
end

function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end

end

function onEvent(name)
    if name == 'ON' then
        MONO = true
        triggerEvent('Change Character', 'dad', 'mono-peacock')
        triggerEvent('Change Character', 'bf', 'mono-pico')

        addLuaSprite('coolCam1', false)
        addLuaSprite('coolCam2', false)
        cameraFlash('hud', 'ffffff', 1, false)

        setProperty('Lab8floor.alpha', 0)
        setProperty('Lab8back.alpha', 0)
        setProperty('bgExperiments.alpha', 0)

        setProperty('MONO8back.alpha', 1)
        setProperty('MONO8floor.alpha', 1)
        setProperty('bgMONO.alpha', 1) 

    end
    if name == 'OFF' then
        MONO = false
        triggerEvent('Change Character', 'dad', 'peacock')
        triggerEvent('Change Character', 'bf', 'pico')

        doTweenY('cC1bye', 'coolCam1', -100, 1, 'linear')
        doTweenY('cC2bye', 'coolCam2', 750, 1, 'linear')

        setProperty('Lab8floor.alpha', 1)
        setProperty('Lab8back.alpha', 1)
        setProperty('bgExperiments.alpha', 1)

        removeLuaSprite('MONO8back', false)
        removeLuaSprite('MONO8floor', false)
        removeLuaSprite('bgMONO', false)    

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