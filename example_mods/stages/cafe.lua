-- A REALLY REALLY BIG THANKS TO WASHO FOR MAKING A CAMERA FOLLOWS CHAR SCRIP, tqm washo se que hablas español asi que besitos en la cola
-- Washo GB page: https://gamebanana.com/members/1971029
local xx = 500
local yy = 150
local xx2 = 950
local yy2 = 250
local ofs = 50
local followchars = true
local del = 0
local del2 = 0
local revengeOfTheBlackScreen = false

function onCreate()
	-- background shit
	makeLuaSprite('cafeback', 'madmans/cafeback', -600, -650)
	setScrollFactor('cafeback', 0.9, 0.9)

	makeLuaSprite ('black', 'effects/Black screen', -350,-250)
	setScrollFactor('black', 0, 0)
	scaleObject('black', 1.5, 2)
	setProperty('black.antialiasing',false)

	makeLuaSprite ('white', 'effects/White screen', -350,-250)
	setScrollFactor('white', 0, 0)
	scaleObject('white', 1.5, 2)
	setProperty('white.antialiasing',false)

	makeLuaSprite ('light', 'effects/spotlight', -100,0)
	setScrollFactor('light', 0, 0)
	scaleObject('light', 1.1, 1)
	setProperty('light.antialiasing',false)
	
	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeAnimatedLuaSprite('bgJaky', 'madmans/Persona_5_irl', -50, -40)
		setScrollFactor('bgJaky', 0.9, 0.9)
		addAnimationByPrefix('bgJaky', 'sentaodepana', 'persona 5 irl', 24, false)
 
		makeAnimatedLuaSprite('bgPokemons', 'madmans/pokemon', -550, 120)
		setScrollFactor('bgPokemons', 0.9, 0.9)
		addAnimationByPrefix('bgPokemons', 'bopping', 'pokemon', 24, false)
 
		makeAnimatedLuaSprite('bgPublicCafe', 'madmans/FGP', -300, 380)
		setScrollFactor('bgPublicCafe', 0.7, 0.2)
		scaleObject('bgPublicCafe', 1.4, 1.4)
		addAnimationByPrefix('bgPublicCafe', 'bopping', 'FGPeople', 24, false)

		--shhhh
		makeLuaSprite('QR','QR/filia',-500,-500)
		setProperty('QR.antialiasing',false)
		setObjectCamera('QR','hud')
		addLuaSprite('QR')

	end

	addLuaSprite('cafeback', false)
	addLuaSprite('bgJaky', false)
	addLuaSprite('bgPokemons', false)
	addLuaSprite('bgPublicCafe', true)
	addLuaSprite('light', true)
	addLuaSprite('black', true)
end

function onBeatHit()
	objectPlayAnimation('bgJaky', 'sentaodepana', false)
	objectPlayAnimation('bgPokemons', 'bopping', false)
	objectPlayAnimation('bgPublicCafe', 'bopping', false)
end

function onStepHit()
	if curStep == 47 then
		setProperty('black.alpha', 0)
	end
	if curStep == 304 then
		removeLuaSprite('light')
		addLuaSprite('white', true)
		setProperty('white.alpha', 1)
	end
	if curStep == 992 then
		revengeOfTheBlackScreen = true
	end
	if curStep == 1024 then
		ofs = 60
		yy = 100
		removeLuaSprite('black')
		setProperty('white.alpha', 1)
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

	setProperty('white.alpha', getProperty('white.alpha') - 0.02)
	if revengeOfTheBlackScreen == true then
		setProperty('black.alpha', getProperty('black.alpha') + 0.02)
	end
end