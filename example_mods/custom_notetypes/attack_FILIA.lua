--exclusive attack notes for peacock as the playable character and opponent (to make the correct sound effect)

function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'attack_FILIA' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/attackNOTES'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.6'); --Default value is: 0.23, health gained on hit. 1 = Gains Half HP Bar
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
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'attack_FILIA' then
		characterPlayAnim('boyfriend', 'attack', true)
		playSound('bite', 1)
		triggerEvent('Add Camera Zoom', '0.05', '0.05')
		triggerEvent('Screen Shake', '0.3, 0.01', '0.3, 0.01')
		characterPlayAnim('dad', 'hurt', true);
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'attack_FILIA' then
		characterPlayAnim('dad', 'attack', true)
		triggerEvent('Add Camera Zoom', '0.05', '0.05')
		triggerEvent('Screen Shake', '0.3, 0.01', '0.3, 0.01')
		playSound('bite', 1)
	end
end