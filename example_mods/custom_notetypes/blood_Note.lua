--I'll make a cleaner and better code later, I'm just to tired now this lmao

-- exclusive don't press notes for vs Ms fortune and maybe Eliza levels
bleed = 0
active = false
psedoTime = 0


function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'blood_Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/bloodNotes'); --Change texture
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
	--health = getProperty('health')
	if noteType == 'blood_Note' then
		setProperty('health', getProperty('health') -0.23)
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'blood_Note' then
		characterPlayAnim('boyfriend', 'hurt', true)
		psedoTime = psedoTime + 600
		active = true
		bleed = bleed + 1
	end
end

function onUpdate()
	--apagado del proceso
	if bleed == 0 then
		active = false
	end
	--reductor de HP
	if active == true then		
		if bleed <= 5 then
			setProperty('health', getProperty('health') - (drain*bleed))
		else
			bleed = 5
		end

		--control de tiempo
		if psedoTime > 3000 then
			psedoTime = 3000
		end

		psedoTime = psedoTime - 1

		if psedoTime == (600*(bleed-1)) then
			bleed = bleed -1
		end
	end

	--para evitar que el drenado de salud te mate xd
	if getProperty('health') > 0.1 then
		drain = 0.00033
	else
		drain = 0
	end
end