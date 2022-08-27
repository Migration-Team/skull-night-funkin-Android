-- exclusive dontpress note for vs Peacock levels
drenado = 0.07

function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'bomb_Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/bombNote'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'HURTnoteSplashes'); --Change Note Splash texture
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0'); --Default value is: 0.0475, health lost on miss. 1 = Lose Half HP Bar

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
	if noteType == 'bomb_Note' then
		setProperty('health', getProperty('health') - drenado)
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'bomb_Note' then 
		setProperty('health', getProperty('health') -0.7)
		characterPlayAnim('boyfriend', 'hurt', true)
		characterPlayAnim('girlfriend', 'scared', true)
		playSound('kaboom', 0.35)
		triggerEvent ('Screen Shake', '0.3, 0.035', '0.3, 0.035')
	end
end

-- para evitar que el drenado de salud te mate xd
function onUpdate()
	if getProperty('health') > 0.1 then
		drenado = 0.07
	else
		drenado = 0 
	end
end