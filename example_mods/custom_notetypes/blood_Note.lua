-- exclusive don't press notes for vs Ms fortune and maybe Eliza levels
-- comentarios en español, se que no es la manera más elegante de hacer esto, pero funciona asi que TA BIEN :gokumanitaarriba:
activador = 0
bleed1 = 0
bleed2 = 0
bleed3 = 0
bleed4 = 0
bleed5 = 0
drain = 0.00084

function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'blood_Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'notes/bloodNotes'); --Change texture
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

function opponentNoteHit(id, direction, noteType, isSustainNote)
	health = getProperty('health')
	if noteType == 'blood_Note' then
		setProperty('health', health-0.00084)
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote) --add note type stuff here
	if noteType == 'blood_Note' then
		characterPlayAnim('boyfriend', 'hurt', true)
		activador = activador + 1
	end
end

function onUpdate()
    health = getProperty('health')
    --activador de los sangrados (variable para que puedan acumularse varios a la vez)	
    if activador == 1 then
  	bleed1 = bleed1 + 0.001
	elseif activador == 2 then
		bleed2 = bleed2 + 0.001
	elseif activador == 3 then
		bleed3 = bleed3 + 0.001
	elseif activador == 4 then
		bleed4 = bleed4 + 0.001
	elseif activador == 5 then
		bleed5 = bleed5 + 0.001
	end
    if activador > 5 then
	    activador = activador - 1 --esto impide que se acumulen más de 5 activadores... no causa más sangrados pero vuelve permanentes algunos lol
    end

    --primer sangrado
	if bleed1 > 0 then
		bleed1 = bleed1 + 1
		setProperty('health', health-drain)  --mientras bleed suba, el hp baja
	end
	if bleed1 >= 600 then
		activador = activador - 1 --manda señal al activador de que el sangrado terminó tras aprox 10 segundos, no se exactamente cuantos porque no hice el cálculo
		bleed1 = 0
	end
    --segundo sangrado
	if bleed2 > 0 then
		bleed2 = bleed2 + 1
		setProperty('health', health-drain*2)
	end
	if bleed2 >= 600 then
		activador = activador - 1
		bleed2 = 0
	end
	--tercer sangrado
	if bleed3 > 0 then
		bleed3 = bleed3 + 1
		setProperty('health', health-drain*3)
	end
	if bleed3 >= 600 then
		activador = activador - 1
		bleed3 = 0
	end
	--cuarto sangrado
	if bleed4 > 0 then
		bleed4 = bleed4 + 1
		setProperty('health', health-drain*4)
	end
	if bleed4 >= 600 then
		activador = activador - 1
		bleed4 = 0
	end
	--quinto sangrado
	if bleed5 > 0 then
		bleed5 = bleed5 + 1
		setProperty('health', health-drain*5)
	end
	if bleed5 >= 600 then
		activador = activador - 1
		bleed5 = 0
	end
	
	--para evitar que el drenado de salud te mate xd
	if health <= 0.05 then
		drain = 0
	elseif health > 0.05 then
		drain = 0.00084
	end

end