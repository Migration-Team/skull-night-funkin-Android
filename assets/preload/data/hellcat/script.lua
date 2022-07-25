function onCreate()
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'rip bozo'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'Nightshow'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'Retryshow'); --put in mods/music/
end

function onEvent(name)
    if name == 'ON' then
        ofs = 0
    end
    if name == 'OFF' then
        ofs = 40
    end
end

function onGameOver()
	-- You died! Called every single frame your health is lower (or equal to) zero
	-- return Function_Stop if you want to stop the player from going into the game over screen
    playSound('ms fortune win', 1)
    return Function_Continue;
end
