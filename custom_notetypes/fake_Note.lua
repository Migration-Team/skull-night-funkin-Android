-- eres mi bebe mi bebito fiu fiu ayuda no se me quita la maldita cancion de la cabeza aaaaaaaaaaa

function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'fake_Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/fake_Note'); --texturas temporales, cambiar cuando ya estén hechas :manita_arriba:
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'HURTnoteSplashes'); --Change Note Splash texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
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
    if noteType == "fake_Note" then
	   setProperty('health', getProperty('health')-69)
	   characterPlayAnim('boyfriend', 'hurt', true);
	end
end