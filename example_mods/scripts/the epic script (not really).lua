function onCreatePost()
  --gehenna difficulty mechanic (no health gain in normal notes)
  if difficulty > 2 then
    for i = 0, getProperty('unspawnNotes.length')-1 do
      setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0') --Default value is: 0.23, health gained on hit. 1 = Gains Half HP Bar
    end
  end

  --songname at the begining of the song
  if not downscroll then
    Yposition = 500
    antiY= 680 --shit
  else
    Yposition = 120
    antiY = 20 --shit
  end

  makeLuaText('nameSong', getProperty(songName), 1250, 0, Yposition)
  setTextFont('nameSong', 'SelznickRemixNF.ttf')
  setTextSize('nameSong', 50)
  setTextAlignment('nameSong', 'center')
  setTextBorder('nameSong', 3, '000000')
  setProperty('nameSong.alpha', 0)

  --shit
  makeLuaText('anti', "skull night funkin [dev build - alpha 9_1], not open to public",1250,0,antiY)
  setTextSize('anti', 25)
  setObjectCamera('anti', 'camOther')
  addLuaText('anti')

end

function onStepHit()
  if curStep == 1 then
    addLuaText('nameSong')
    doTweenAlpha('appears', 'nameSong', 1, 0.5, 'linear')
  end
end

function onTweenCompleted(tag)
  if tag == 'appears' then
    runTimer('diga bye bye', 3)
  end
  if tag == 'dissapear' then
    removeLuaText('namesong', 'destroy')
  end
end

  function onTimerCompleted(tag)
    if tag == 'diga bye bye' then
      doTweenAlpha('dissapear', 'nameSong', 0, 0.5, 'linear')
    end
  end