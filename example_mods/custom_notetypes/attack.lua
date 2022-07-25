--the best note ever made (not really)

damage = 0.5
vol = 1

function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'attack' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/attackNOTES'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0'); --Default value is: 0.0475, health lost on miss. 1 = Lose Half HP Bar

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

function goodNoteHit(id, direction, noteType, isSustainNote) --add note type stuff here
	if noteType == 'attack' then

		--IM STUPID AND THIS TOOK ME A YEAR TO FIGURE OUT HOW TO DO IT
		if getProperty('boyfriend.curCharacter') == 'BANANA-playable' or getProperty('boyfriend.curCharacter') == 'peacock-playable' then
			SFX = 'gun'
			vol = 1.5
		elseif getProperty('boyfriend.curCharacter') == 'beowulf-playable' then
			SFX = 'bigpunch'
			vol = 0.6
			triggerEvent ('Screen Shake', '0.3, 0.01', '0.3, 0.01')
		elseif getProperty('boyfriend.curCharacter') == 'filia-playable' or getProperty('boyfriend.curCharacter') == 'samson-playable' then
			SFX = 'bite'
			triggerEvent ('Screen Shake', '0.3, 0.01', '0.3, 0.01')
		elseif getProperty('boyfriend.curCharacter') == 'msFortune-playable' then
			SFX = 'cutter'
		elseif getProperty('boyfriend.curCharacter') == 'valentine-playable' then
			SFX = 'sawcut'
			vol = 0.6
		else
			SFX = 'defaultpunch'
		end

		setProperty('health', getProperty('health') + damage)
		playSound(SFX, 1)
		characterPlayAnim('boyfriend', 'attack', true)
		characterPlayAnim('dad', 'hurt', true)
		characterPlayAnim('gf', 'cheer', true)
		triggerEvent('Add Camera Zoom', '0.05', '0.05')
		vol = 1

	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'attack' then

		--IM STUPID AND THIS TOOK ME A YEAR TO FIGURE OUT HOW TO DO IT
		if getProperty('dad.curCharacter') == 'BANANA' or getProperty('dad.curCharacter') == 'peacock' then
			SFX = 'gun'
			vol = 1.5
		elseif getProperty('dad.curCharacter') == 'beowulf' then
			SFX = 'bigpunch'
			vol = 0.6
			triggerEvent ('Screen Shake', '0.3, 0.01', '0.3, 0.01')
		elseif getProperty('dad.curCharacter') == 'filia' or getProperty('dad.curCharacter') == 'samson' then
			SFX = 'bite'
			triggerEvent ('Screen Shake', '0.3, 0.01', '0.3, 0.01')
		elseif getProperty('dad.curCharacter') == 'msFortune' then
			SFX = 'cutter'
		elseif getProperty('dad.curCharacter') == 'valentine' then
			SFX = 'sawcut'
			vol = 0.6
		else
			SFX = 'defaultpunch'
		end

		playSound(SFX, vol)
		characterPlayAnim('dad', 'attack', true)
		triggerEvent('Add Camera Zoom', '0.05', '0.05')
		vol = 1
	end
end