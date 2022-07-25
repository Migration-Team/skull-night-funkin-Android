-- A REALLY REALLY BIG THANKS TO WASHO FOR MAKING A CAMERA FOLLOWS CHAR SCRIP, tqm washo se que hablas español asi que besitos en la cola
-- Washo GB page: https://gamebanana.com/members/1971029
local xx = 1000
local yy = 700
local xx2 = 1500
local yy2 = 750
local ofs = 40
local followchars = true
local del = 0
local del2 = 0

function onStartCountdown()

    --if songName == 'trouble-makers' then
      --  triggerEvent('Change Character', 'bf', 'avery-playable')
    --end

	setProperty('gf.alpha', 0) --No bitches?
    removeLuaSprite('black')
    return Function_Continue
end

function onCreate()
	-- background shit
    makeLuaSprite('black', 'effects/Black screen', -200, -200)
    setScrollFactor('black', 0,0)
    scaleObject('black', 2,2)

	makeLuaSprite('floor', 'theroom/floor', 100, 0)
	setScrollFactor('floor', 0.9, 0.9)
	scaleObject('floor', 0.8, 0.8)

	if not lowQuality then
		makeAnimatedLuaSprite('gang', 'theroom/bgGang', 300, 170)
		setScrollFactor('gang', 0.9, 0.9)
		addAnimationByPrefix('gang', 'bopping', 'bgGang idle', 24, false)
		scaleObject('gang', 0.78, 0.78)
	end

	makeLuaSprite('lamp', 'theroom/lamp', 100, 0)
	setScrollFactor('lamp', 0.9, 0.9)
	scaleObject('lamp', 0.8, 0.8)

	addLuaSprite('floor', false)
	addLuaSprite('gang', false)
	addLuaSprite('lamp', true)
    addLuaSprite('black', true)
end

function onBeatHit()
	objectPlayAnimation('gang','bopping', false)
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
