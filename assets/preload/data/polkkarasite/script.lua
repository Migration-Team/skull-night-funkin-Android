local SamsonTalks = true

function onCreate()

    precacheImage('characters/Samson')

    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'rip bozo'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'Nightshow'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'Retryshow'); --put in mods/music/
end



function opponentNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Hair_Note' and SamsonTalks == true then
        if getProperty('dad.curCharacter') == 'filia' then
          triggerEvent('Change Character', 'dad', 'samson')
          runTimer('back', 1)
        end
    end
end

function onTimerCompleted(tag)
    if tag == 'back' then
        triggerEvent('Change Character', 'dad', 'filia')
    end
end


function onGameOver()
	-- You died! Called every single frame your health is lower (or equal to) zero
	--return Function_Stop if you want to stop the player from going into the game over screen
    playSound('filia retry', 1)
end

function onBeatHit()
    if curBeat == 447 then
        SamsonTalks = false
    end
end
