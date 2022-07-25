-- A REALLY REALLY BIG THANKS TO WASHO FOR MAKING A CAMERA FOLLOWS CHAR SCRIP, tqm washo se que hablas español asi que besitos en la cola
-- Washo GB page: https://gamebanana.com/members/1971029

--camera shits
local xx = 550
local yy = 200
local xx2 = 1000
local yy2 = 350
local ofs = 40
local followchars = true
local del = 0
local del2 = 0

function onStartCountdown()
	setProperty('gf.alpha', 0) --No bitches?
	triggerEvent('Change Character', 'bf', 'playable gf')
    return Function_Continue
end

function onCreate()

	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'rip bozo') --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'Nightshow') --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'Retryshow') --put in mods/music/
	--setPropertyFromClass('GameOverSubstate', 'characterName', 'playable gf') -- this animation is kinda eeeeeeeehhh sus? idk man I dont like maybe I'll do a new one later
	
	-- background shit
	makeLuaSprite('catedral', 'spooky/Ruined', -350, -330)
	setScrollFactor('catedral', 0.9, 0.9)
	scaleObject('catedral', 0.8, 0.8)

	if not lowQuality then
	   makeLuaSprite('blue', 'effects/Blue overlay', 0, 0)
	   setScrollFactor('blue', 0, 0)
	   scaleObject('blue', 1, 1)
	   setProperty('blue.alpha', 0.6)
	   setObjectCamera('blue', 'camOther')
	end

   addLuaSprite('catedral', false)
   addLuaSprite('blue', true)		
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
end

function onGameOver()
	-- You died! Called every single frame your health is lower (or equal to) zero
	--return Function_Stop if you want to stop the player from going into the game over screen
    playSound('operate', 1)
    return Function_Continue;
end