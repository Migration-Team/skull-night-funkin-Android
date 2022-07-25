--a kind of instakill note but coded a bit different

function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'danger_Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/danger_Note'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0'); --Default value is: 0.23, health gained on hit. 1 = Gains Half HP Bar
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '2.5'); --Default value is: 0.0475, health lost on miss. 1 = Lose Half HP Bar

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

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == "danger_Note" then
	 characterPlayAnim('boyfriend', 'hurt', true) -- you will die anyways so maybe this animation is unnecessary
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote) --add note type stuff here
	if noteType =='danger_Note' then
		characterPlayAnim('boyfriend', 'dodge', true)
		characterPlayAnim('gf', 'cheer', true)
	end
end