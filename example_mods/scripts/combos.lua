--based on the scripts "noteCombo" by stilic and LePerv psych port by teniente mantequilla, todo un conchesumare
--version for SNF by microondas
addBox = true
noteHits = 0

function onCreatePost()

    makeAnimatedLuaSprite('combox', 'comboSquare', 10, 120)
    addAnimationByPrefix('combox', 'blop', 'blop', 24, false)
    scaleObject('combox', 0.16,0.16)
    setObjectCamera('combox', 'hud')
    addLuaSprite('combox', true)
    setProperty('combox.alpha', 0)

    makeLuaText('comboxNum', noteHits, 200, 10, 160)
    setTextAlignment('comboxNum', 'center')
    setTextSize('comboxNum', 80)
    setTextColor('comboxNum', '5B442C')
    setTextBorder('comboxNum', 4, 'A68462')
    setObjectCamera('comboxNum', 'hud')

    --note messages
    makeLuaText('dodge', "DODGED!", 200, 10, 280)
    setTextAlignment('dodge', 'center')
    setTextSize('dodge', 60)
    setTextColor('dodge', 'A29E17')
    setTextBorder('dodge', 3, 'FAE52E')
    setObjectCamera('dodge', 'hud')
    setProperty('dodge.alpha', 0)
    addLuaText('dodge')

    makeLuaText('hurt', "HURT!", 200, 10, 280)
    setTextAlignment('hurt', 'center')
    setTextSize('hurt', 60)
    setTextColor('hurt', 'A21951')
    setTextBorder('hurt', 3, 'DE2111')
    setObjectCamera('hurt', 'hud')
    setProperty('hurt.alpha', 0)
    addLuaText('hurt')

    makeLuaText('atk', "HIT!", 200, 10, 280)
    setTextAlignment('atk', 'center')
    setTextSize('atk', 60)
    setTextColor('atk', '19A245')
    setTextBorder('atk', 3, '67A421')
    setObjectCamera('atk', 'hud')
    setProperty('atk.alpha', 0)
    addLuaText('atk')

    makeLuaText('bruh', "MISS!", 200, 10, 280)
    setTextAlignment('bruh', 'center')
    setTextSize('bruh', 60)
    setTextColor('bruh', 'A21951')
    setTextBorder('bruh', 3, 'DE2111')
    setObjectCamera('bruh', 'hud')
    setProperty('bruh.alpha', 0)
    addLuaText('bruh')

end

function goodNoteHit(id, direction, noteType, isSustainNote)

    noteHits = noteHits + 1

    if noteHits == 5 and addBox == true then

        setProperty('combox.alpha', 1)
        setProperty('combox.x', 10)
        objectPlayAnimation('combox', 'blop', false)
        
        addLuaText('comboxNum')
        setProperty('comboxNum.x', 10)
        setTextString('comboxNum', noteHits)

        runTimer('endOfCombo', 2)
        addBox = false
    end
    if noteHits > 5 then
        setTextString('comboxNum', noteHits)
        cancelTimer('endOfCombo')
        runTimer('endOfCombo', 2, 1)
    end

    --notepressed
    if noteType == 'warning_Note' or noteType == 'danger_Notes' then
        setProperty('dodge.alpha', 1)
        doTweenAlpha('Dtext', 'dodge', 0, 0.5, 'linear')
    end
    if noteType =='blood_Note' or noteType =='Hair_Note' or noteType =='bomb_Note' or noteType =='syringe_Note' then
        noteHits = 0
        objectPlayAnimation('combox', 'blop', false)
        setProperty('hurt.alpha', 1)
        doTweenAlpha('Htext', 'hurt', 0, 0.5, 'linear')

        addLuaText('message')
        setTextString('message', rating)
        runTimer('endofMessage', 1)
    end
    if noteType == 'attack' then
        setProperty('atk.alpha', 1)
        doTweenAlpha('Atext', 'atk', 0, 0.5, 'linear')
    end
end

--misses
function noteMiss()
    noteHits = 0
    objectPlayAnimation('combox', 'blop', false)
    if noteType == 'warning_Note' then
        setProperty('hurt.alpha', 1)
        doTweenAlpha('Htext', 'hurt', 0, 0.5, 'linear')
    else
        setProperty('bruh.alpha', 1)
        doTweenAlpha('Btext', 'bruh', 0, 0.5, 'linear')
    end
end
function noteMissPress()
    noteHits = 0
    objectPlayAnimation('combox', 'blop', false)
end

function onTimerCompleted(name)
    
    if name == 'endOfCombo' then
        if noteHits > 5 then
            objectPlayAnimation('combox', 'blop', false)
        end
        runTimer('endOfBlop', 0.1)
    end

    if name == 'endOfBlop' then
        doTweenX('ByeByecombo','combox', -200, 0.3, 'linear')
        doTweenX('ByeByeNum', 'comboxNum', -200, 0.3,'linear')
        addBox = true
        noteHits = 0
    end
end

function onTweenCompleted(name)
    if name == 'ByeByecombox' then
        setProperty('combox.alpha', 0)
        removeLuaText('comboxNum', false)
    end
end