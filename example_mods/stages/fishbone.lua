-- A REALLY REALLY BIG THANKS TO WASHO FOR MAKING A CAMERA FOLLOWS CHAR SCRIP, tqm washo se que hablas español asi que besitos en la cola
-- Washo GB page: https://gamebanana.com/members/1971029
local xx = 300
local yy = 400
local xx2 = 950
local yy2 = 500
local ofs = 40
local followchars = true
local del = 0
local del2 = 0

function onCreate()
	-- background shit
	makeLuaSprite('Innsmouth', 'fishbone/Innsmouth', -550, -180)
	setScrollFactor('Innsmouth', 1, 1)
	scaleObject('Innsmouth', 1.2, 1.2)

	if not lowQuality then
		makeAnimatedLuaSprite('bgCartoons', 'fishbone/cartoons', 1020, 280)
		setScrollFactor('bgCartoons', 1, 1)
		scaleObject('bgCartoons', 1.2, 1.2)
		addAnimationByPrefix('bgCartoons', 'bopping', 'uhhh', 24, false)

		makeAnimatedLuaSprite('bgFishAndPirate', 'fishbone/cursed_name_on_fla', 10, 120)
		setScrollFactor('bgFishAndPirate', 1, 1)
		scaleObject('bgFishAndPirate', 1.2, 1.2)
		addAnimationByPrefix('bgFishAndPirate', 'bopping', 'smash or pass?????', 24, false)

		makeAnimatedLuaSprite('bgBlackAndFish', 'fishbone/Lefish', -500, 30)
		setScrollFactor('bgBlackAndFish', 1, 1)
		scaleObject('bgBlackAndFish', 1.2, 1.2)
		addAnimationByPrefix('bgBlackAndFish', 'bopping', 'lefish', 24, false)

		--- msfortune cuote sprite cause the object play animation event is kinda poopy
		makeAnimatedLuaSprite('catussy', 'fishbone/prrsonal', -200, 80)
		setScrollFactor('catussy', 1, 1)
		addAnimationByPrefix('catussy', 'cuote', 'prrsonal', 24, false)
	end
	addLuaSprite('Innsmouth', false)
	addLuaSprite('bgBlackAndFish', false)
	addLuaSprite('bgCartoons', false)
	addLuaSprite('bgFishAndPirate', false)
end

function onBeatHit()
	objectPlayAnimation('bgCartoons', 'bopping', false)
	objectPlayAnimation('bgFishAndPirate', 'bopping', false)
	objectPlayAnimation('bgBlackAndFish', 'bopping', false)
end

function onEvent(name, value1)
	if name == 'ON' then
		setProperty('dad.alpha', 0)
		addLuaSprite('catussy', true)
		objectPlayAnimation('catussy', 'cuote', false)
	end
	if name == 'OFF' then
		removeLuaSprite('catussy')
		setProperty('dad.alpha', 1)
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