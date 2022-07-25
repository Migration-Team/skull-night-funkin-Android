function onCreatePost()
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'rip bozo'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'Nightshow'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'Retryshow'); --put in mods/music/
end

function onStepHit()
    random = random +1
    if random == 2 then
        random = 0
    end
end

function onGameOver()
	-- You died! Called every single frame your health is lower (or equal to) zero
	--return Function_Stop if you want to stop the player from going into the game over screen
    if random == 0 then 
        playSound('filia retry', 1)
    elseif random > 0 then
        playSound('samson_insult', 1)
    end
    return Function_Continue;
end
