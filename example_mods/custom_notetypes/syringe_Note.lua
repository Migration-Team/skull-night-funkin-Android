-- exclusive notes for vs Valentine levels

local activate = 0
local cagaste = 0.00084

function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'syringe_Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/syringeNotes'); --Change texture
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


function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'syringe_Note' then
		setProperty('health', getProperty('health')-0.00084)
		characterPlayAnim('boyfriend', 'hurt', true)
		activate = activate + 1
	end
end

function onUpdate()
    health = getProperty('health')	
    if activate > 0 then --si presionas una vez, se suma 1 activador
		setProperty('health', health - cagaste*activate) -- la cantidad de sangrado se calcula con "cagaste" * cantidad de veces presionadas
	end
	
	--para evitar que el drenado de salud te mate xd
	if health > 0.1 then
		cagaste = 0.00084
	else
		cagaste = 0
	end

end
