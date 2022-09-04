function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'bullet_note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/bullet_note'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', 0); --Default value is: 0.23, health gained on hit. 1 = Gains Half HP Bar
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0); --Default value is: 0.0475, health lost on miss. 1 = Lose Half HP Bar
			setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties

		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false