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

--misc
local scary = false

function onCreate()
	-- background shit
	makeLuaSprite('catedral', 'spooky/catedral', -350, -300)
	setScrollFactor('catedral', 0.9, 0.9)
	scaleObject('catedral', 1.2, 1.2)

	makeLuaSprite('overlay', 'effects/cooler overlay', 0, 0)
	setObjectCamera('overlay', 'hud')
	setProperty('overlay.antialiasing',false)

	if not lowQuality then
		makeAnimatedLuaSprite('nun','spooky/the_nun', -240, 80)
		scaleObject('nun', 0.8, 0.8)
		setScrollFactor('nun', 0.9, 0.9)
		addAnimationByPrefix('nun', 'bopping', 'the_nun exists', 24, true)
		setProperty('nun.alpha', 0)

		makeLuaSprite('red', 'effects/Red overlay', 0, 0)
		setObjectCamera('red', 'hud')
	    setProperty ('red.alpha', 0)
	    setProperty('red.antialiasing',false)
	end

	if not lowQuality or not flashingLights then
		makeLuaSprite('redoverlay', 'effects/Red screen', 0, 0)
		setObjectCamera('redoverlay', 'hud')
		setProperty('redoverlay.antialiasing',false)

	    makeLuaSprite('blue', 'effects/Blue overlay', 0, 0)
		setObjectCamera('blue', 'hud')
	    setProperty ('blue.alpha', 0)
	    setProperty('blue.antialiasing',false)

		--shhhh
		makeLuaSprite('QR','QR/valentine',-500,-500)
		setProperty('QR.antialiasing',false)
		setObjectCamera('QR','hud')
		--addLuaSprite('QR') hell nah, the stage is so big itself
	end

   addLuaSprite('catedral', false)
   addLuaSprite('nun')
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
	if coolshit == 2 then
		setProperty ('redoverlay.alpha', getProperty('redoverlay.alpha')-0.045)
	end
	if coolshit == 3 then
		setProperty ('redoverlay.alpha', getProperty('redoverlay.alpha')+ 0.04)
	end
end

function onStepHit()
	objectPlayAnimation('nun', 'bopping', false)
	
	if scary == true then
	 setProperty('nun.alpha', getProperty('nun.alpha') + 0.001)
	end
	if getProperty('nun.alpha') >= 1 then
		scary = false
	end

	if sofuckingfast == true then
		setProperty('red.alpha', 1)
	end
end

function onBeatHit()
	
	if fastest == true then
		setProperty('red.alpha', 1)
	end
	if coolshit == 2 then
		setProperty ('redoverlay.alpha', 1)
	end


	if  curBeat == 192 then
		faster = true
		red = true
		addLuaSprite('redoverlay', true)
		setObjectCamera('redoverlay','camOther')
		coolshit = 1
		scary = true
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

	--this looks so bad lmao
	--if curBeat == 484 then
	--	coolshit = 2
	--end

	if curBeat == 488 then
		coolshit = 3
		sofuckingfast = false
	end

	if stop == false and curBeat % 4 == 0 then
		if red == false then 
			setProperty('blue.alpha', 1)
		elseif red == true then
			setProperty('red.alpha', 1)
		end
	end
	
	if faster == true and curBeat % 4 == 2 then
		if red == false then 
			setProperty('blue.alpha', 1)
		elseif red == true then
			setProperty('red.alpha', 1)
		end
	end

end