-- A REALLY REALLY BIG THANKS TO WASHO FOR MAKING A CAMERA FOLLOWS CHAR SCRIP, tqm washo se que hablas español asi que besitos en la cola
-- Washo GB page: https://gamebanana.com/members/1971029

--camera shits
local xx = 600
local yy = 200
local xx2 = 900
local yy2 = 380
local ofs = 40
local followchars = true
local del = 0
local del2 = 0

--light effects
local faster = false
local fastest = false
local sofuckingfast = false
local stop = false
local red = false

-- red screen effects
local coolshit = 0

function onCreate()
	-- background shit
	makeLuaSprite('catedral', 'spooky/catedral', -350, -300)
	setScrollFactor('catedral', 0.9, 0.9)
	scaleObject('catedral', 1.2, 1.2)

	makeLuaSprite('overlay', 'effects/cooler overlay', -210, -125)
	setScrollFactor('overlay', 0, 0)
	scaleObject('overlay', 1.35, 1.35)

	makeLuaSprite('redoverlay', 'effects/Red screen', -210, -125)
	setScrollFactor('redoverlay', 0, 0)
	scaleObject('redoverlay', 1.35, 1.35)

	--recordatorio - agregar un IF para cancelar si se desactivan flashing lights
	makeLuaSprite('blue', 'effects/Blue overlay', -210, -125)
	setScrollFactor('blue', 0, 0)
	scaleObject('blue', 1.35, 1.35)
	setProperty ('blue.alpha', 0)

	makeLuaSprite('red', 'effects/Red overlay', -210, -125)
	setScrollFactor('red', 0, 0)
	scaleObject('red', 1.35, 1.35)
	setProperty ('red.alpha', 0)
	
	addLuaSprite('catedral', false)
	addLuaSprite('overlay', true)
	addLuaSprite('blue', true)
	addLuaSprite('red', true)

end

function onUpdate()
	--camera shit
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
    --end of camera shit, continuams con la programación habitual

	setProperty ('blue.alpha', getProperty('blue.alpha')-0.045)
	setProperty ('red.alpha', getProperty('red.alpha')-0.045)
	if coolshit == 1 then
		setProperty ('redoverlay.alpha', getProperty('redoverlay.alpha')-0.04)
	end
end

function onBeatHit()

	if  curBeat == 286 then
		faster = true
	end

	if curBeat == 352 then
		red = true
		addLuaSprite('redoverlay', true)
		setObjectCamera('redoverlay','camOther')
		coolshit = 1
	end

	if stop == false and curBeat % 4 == 2 then
		if red == false then 
			setProperty('blue.alpha', 1)
		elseif red == true then
			setProperty('red.alpha', 1)
		end
	end
	
	if faster == true and curBeat % 4 == 0 then
		if red == false then 
			setProperty('blue.alpha', 1)
		elseif red == true then
			setProperty('red.alpha', 1)
		end
	end

end