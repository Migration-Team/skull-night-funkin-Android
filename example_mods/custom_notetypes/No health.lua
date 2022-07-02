--notes that doesn't give health when press, exclusive for gehenna difficulty

function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'No health' then
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0'); --Default value is: 0.23, health gained on hit. 1 = Gains Half HP Bar

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
			
			end
		end
	end
	--debugPrint('Script started!')
end

--eso es todo, quería programar esto en el script para que las notas normales en esta dificultad no dieran salud en lugar de tener que poner 
--nota por nota, pero no pude, nimodo jijija