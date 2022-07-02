-- exclusive note for the Filia/Fukua levels

local drenado = 0.065

function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Hair_Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/parasiteNotes'); --Change texture -- texturas temporales, cambiar cuando ya estén hechas :manita_arriba:
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'HURTnoteSplashes'); --Change Note Splash texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '-0.5'); --Default value is: 0.23, health gained on hit. 1 = Gains Half HP Bar

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

function opponentNoteHit(id, direction, noteType, isSustainNote)
	health = getProperty('health')
	if noteType == 'Hair_Note' then
		setProperty('health', health - drenado)
		triggerEvent('Screen Shake', '0.2, 0.01', '0.2, 0.01')
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote) --add note type stuff here
	if noteType == 'Hair_Note' then
		characterPlayAnim('boyfriend', 'hurt', true)
	end
end

-- para evitar que el drenado de salud te mate xd
function onUpdate()
	if health < 0.065 then
		drenado = 0
	elseif health >= 0.065 then
		drenado = 0.065
	end
end