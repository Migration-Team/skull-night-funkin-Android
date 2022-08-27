-- A REALLY REALLY BIG THANKS TO WASHO FOR MAKING A CAMERA FOLLOWS CHAR SCRIP, tqm washo se que hablas español asi que besitos en la cola
-- Washo GB page: https://gamebanana.com/members/1971029
local xx = 400
local yy = 300
local xx2 = 1100
local yy2 = 360
local ofs = 40
local followchars = true
local del = 0
local del2 = 0

local stopBopping = false

function onCreate()
	-- background shit
	makeLuaSprite('Lab8back', 'Laboratories/Lab8back', -500, -600)
	setScrollFactor('Lab8back', 0.85, 0.85)
	scaleObject('Lab8back', 1.5, 1.5)

	makeLuaSprite('Lab8floor', 'Laboratories/Lab8floor', -500, -600)
	setScrollFactor('Lab8floor', 1, 1)
    scaleObject('Lab8floor', 1.5, 1.5)

	if not lowQuality then
		makeAnimatedLuaSprite('bgExperiments', 'Laboratories/left', -560, -145)
		setScrollFactor('bgExperiments', 1, 1)
		scaleObject('bgExperiments', 1.4, 1.4)
		addAnimationByPrefix('bgExperiments', 'bopping', 'idle left', 24, false)
		addAnimationByPrefix('bgExperiments', 'HEY', 'left hey', 24, false)

		makeAnimatedLuaSprite('bgScience', 'Laboratories/right', 1200, 20)
		setScrollFactor('bgScience', 1, 1)
		scaleObject('bgScience', 1.4, 1.4)
		addAnimationByPrefix('bgScience', 'bopping', 'Right Idle', 24, false)
		addAnimationByPrefix('bgScience', 'HEY', 'Right hey', 24, false)

        --shhhh
		makeLuaSprite('QR','QR/peacock',-500,-500)
		setProperty('QR.antialiasing',false)
		setObjectCamera('QR','hud')
		addLuaSprite('QR')
	end
	addLuaSprite('Lab8back', false)
	addLuaSprite('Lab8floor', false)
	addLuaSprite('bgExperiments', false)
	addLuaSprite('bgScience', false)
end

function onBeatHit()
	if stopBopping == false then
	 objectPlayAnimation('bgExperiments', 'bopping', false)
	 setProperty('bgExperiments.y', -145)
	 objectPlayAnimation('bgScience', 'bopping', false)
	 setProperty('bgScience.y', 20)
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
	if name == 'bgHey' then
		stopBopping = true
		objectPlayAnimation('bgExperiments', 'HEY', false)
		setProperty('bgExperiments.y', -400)
		objectPlayAnimation('bgScience', 'HEY', false)
		setProperty('bgScience.y', -28)
		runTimer('resetBopping', 0.5)
	end
end

function onTimerCompleted(name)
	if name == 'resetBopping' then
		stopBopping = false
	end
end