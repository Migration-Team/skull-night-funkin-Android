-----------you can modify the next values to costumize your gameplay--------------------------------------------------------------------
--turn off/on
active = true         --the script is active or not, set it as false to turn off the mechanic, just in case you just what it in specific songs
--numeric values
bullets = 3            --initial amount of bullets, can't be higher than the max amount of bullets
max = 10                --maximum amount of bullets, write 'false' for infinite bullets
damage = 0.4           --amount of HP gained on attacks. Remember that 2 is the max hp of the player and 1 is the half of it, 0 is dead
--keys
ATKkey = 'space'        --key that you need to press to attack, write it between those shits ''
--LOADkey = (this doesn't works :[ ) key that you need to press to reload bullets, write false if you want to reload using the custom note or else write the key between those shits ''
--animations
BFanimATK = 'attack'      --animation made by bf when you attack, write it between those shits ''
BFanimLoad = 'pre-attack' --animation made by bf when you press the bullet notes so you reload bullets lol, write it between those shits ''
OPOanimHit = 'hurt'       --animation made by the opponet when you attack, write it between those shits ''
--others
autoLOAD = false           --character load bullets automatically intead of pressing notes/keys, write true to turn it on
cooldown = 0.1              -- time (in seconds) to reload a bullet if autoLOAD is enable
-----------the shit itself--------------------------------------------------------------------------------------------------------------

function onCreate()

	makeLuaText('atk', "HIT!", 200, 10, 280)
    setTextAlignment('atk', 'center')
    setTextSize('atk', 60)
    setTextColor('atk', '19A245')
    setTextBorder('atk', 3, '67A421')
    setObjectCamera('atk', 'hud')
    setProperty('atk.alpha', 0)
    addLuaText('atk')


	for i = 0, getProperty('unspawnNotes.length')-1 do
        setPropertyFromGroup('unspawnNotes', i, 'hitHealth', 0); --Default value is: 0.23, health gained on hit. 1 = Gains Half HP Bar
    end
	--le bullets
	makeLuaSprite('municion', 'notes/bullets', screenWidth/85, (screenHeight/40)*29)
	setScrollFactor('municion', 0, 0)
	scaleObject ('municion', 0.65, 0.65)
	addLuaSprite('municion', true)
	setObjectCamera('municion','camOther')

	makeLuaText('numicion', "X" .. getProperty(bullets), 240, 60, 550)
	setTextSize('numicion', 60)
	setTextAlignment('numicion', 'left')
	setObjectCamera('numicion','camOther')
	addLuaText('numicion')

	--no bullets text
	makeLuaText('NOPE', "no bullets", 450, 20, 500)
	setTextSize('NOPE', 45)
	setTextAlignment('NOPE', 'left')
	setObjectCamera('NOPE', 'camOther')
	setTextColor('NOPE', 'FF0000')
	addLuaText('NOPE')
	setProperty('NOPE.alpha', 0)
	--max bullets text
	makeLuaText('MAXIMUM', "Max bullets", 450, 20, 500)
	setTextSize('MAXIMUM', 45)
	setTextAlignment('MAXIMUM', 'left')
	setObjectCamera('MAXIMUM', 'camOther')
	setTextColor('MAXIMUM', '55FF00')
	addLuaText('MAXIMUM')
	setProperty('MAXIMUM.alpha', 0)


	if active == false then
		autoLOAD = false
		removeLuaSprite('municion')
		removeLuaText('NOPE')
		removeLuaText('MAXIMUM')
	end

	if autoLOAD == true then
		runTimer('autorecharge', cooldown, 0)
	end

end

function onUpdate()
	if active == true then
	    --le text
		setTextString('numicion',"X" .. getProperty(bullets))
	    setProperty('NOPE.alpha', getProperty('NOPE.alpha') - 0.01)
	    setProperty('MAXIMUM.alpha', getProperty('MAXIMUM.alpha') - 0.01)

        if keyJustPressed(ATKkey) == true then
		    if bullets > 0 then
			    setProperty('health', getProperty('health') + damage)
			    bullets = bullets - 1
			    characterPlayAnim('boyfriend', BFanimATK , true)
				playSound('gunshot', 0.65)
			    characterPlayAnim('dad', OPOanimHit, true)

				setProperty('atk.alpha', 1)
				doTweenAlpha('Atext', 'atk', 0, 0.5, 'linear')

		    end
		    if bullets <= 0 then
		        setProperty('NOPE.alpha', 1)
			end
	    end

	    if bullets > max then
		    setProperty('MAXIMUM.alpha', 1)
		    bullets = max
	    end			

    end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'bullet_note' and active == true then
	  bullets = bullets + 1
	  characterPlayAnim('boyfriend', BFanimLoad, true)
	end
end

function onTimerCompleted(tag)
	if tag == 'autorecharge' then
		bullets = bullets + 1
		characterPlayAnim('boyfriend', BFanimLoad, true)
	end
end