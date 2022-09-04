function onCreatePost()
  --gehenna difficulty mechanic (no health gain in normal notes)
  if difficulty > 2 then
    for i = 0, getProperty('unspawnNotes.length')-1 do
      setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0') --Default value is: 0.23, health gained on hit. 1 = Gains Half HP Bar
    end
  end

  --songname at the begining of the song

  makeLuaSprite('textBox', 'movie', -200, 550)
  setObjectCamera('textBox', 'camHud')
  scaleObject('textBox', 0.52, 0.52)
  setProperty('textBox.alpha',0)

  makeLuaText('nameSong', getProperty(songName), 300, -200, 560)
  setTextSize('nameSong', 50)
  setTextAlignment('nameSong', 'center')
  setTextBorder('nameSong', 3, '000000')
  setProperty('nameSong.alpha', 0)

  Author = "by idk"
  if songName == "hairmess" or songName == "flatline" or songName == "hair" then 
    Author = "by Susej"
  end
  if songName == "hellcat" or songName == "tutorial" then
    Author = "by 4thCourse & Flaconadir"
  end
  --if songName == "wulfmania" then
  --  Author = "by YO MAMA"
  --end
  if songName == "painted-red" or songName == "strapped" then
    Author = "by Flaconadir"
  end
  if songName == "thunderwulf" then
    Author = "cover by Hikaru"
  end
  --if songName == "trouble-makers" then
  --  Author = "cover by Flaco"
  --end
  if songName == "RIP" or songName == "polkkarasite" then
    Author = "cover by Spr1n6y"
    makeLuaText('WARNING', "SONG COPYRIGHT WARNING", 1250, 0, 110)
    setTextColor('WARNING', 'FF0000')
    setTextSize('WARNING', 50)
    setTextAlignment('WARNING', 'center')
    setTextBorder('WARNING', 3, 'FFFFFF')
    addLuaText('WARNING')
  end

  makeLuaText('TextAutor', Author ,300,-200,620)
  --setTextFont('TextAutor', 'SelznickRemixNF.ttf')
  setTextSize('TextAutor', 25)
  setTextAlignment('TextAutor', 'center')
  setTextBorder('TextAutor', 2, '000000')
  setProperty('TextAutor.alpha', 0)

end

function onStepHit()
  if curStep == 1 then
    removeLuaText('WARNING')
    addLuaText('nameSong')
    addLuaText('TextAutor')
    addLuaSprite('textBox', false)

    doTweenAlpha('appears', 'nameSong', 1, 0.5, 'linear')
    doTweenAlpha('eppaers', 'TextAutor', 1, 0.5, 'linear')
    doTweenAlpha('boxappears', 'textBox', 1, 0.5, 'linear')

    doTweenX('Xappear', 'nameSong', 0, 0.5,'linear')
    doTweenX('Xeppaer','TextAutor', 0, 0.5,'linear')
    doTweenX('XBOXLIVE','textBox', 10, 0.5,'linear')
  end
end

function onTweenCompleted(tag)
  if tag == 'appears' then
    runTimer('diga bye bye', 3)
  end
  if tag == 'dissapear' then
    removeLuaText('namesong', 'destroy')
    removeLuaText('TextAutor', 'destroy')
    removeLuaSprite('TextBox')
  end
end

function onTimerCompleted(tag)
  if tag == 'diga bye bye' then
    doTweenAlpha('dissapear', 'nameSong', 0, 0.5, 'linear')
    doTweenAlpha('dessipaer', 'TextAutor', 0, 0.5, 'linear')
    doTweenAlpha('BOXdissapear', 'textBox', 0, 0.5, 'linear')

    doTweenX('XappearNT', 'nameSong', -200, 0.5,'circInOut')
    doTweenX('XeppaerNT','TextAutor', -200, 0.5,'circInOut')
    doTweenX('XBOXLIVENT','textBox', -200, 0.5,'circInOut')
  end
end

-- Truly random numbers Lua made by Ice Scripter
-- https://rextester.com/ZNJI29772
-- Put "random()" to use the truly random number

local u = 0
local function random(x, y)
    u = u + 1
    if x ~= nil and y ~= nil then
        return math.floor(x +(math.random(math.randomseed(os.time()+u))*999999 %y))
    else
        return math.floor((math.random(math.randomseed(os.time()+u))*100))
    end
end

--announcer at the start

function onCountdownTick(counter)    
    if counter == 3 then
      announcer = random(1,7)
      if announcer == 1 then
        playSound('announcers/reg- showtime', 0.6)
      end
      if announcer == 2 then
        playSound('announcers/reg- action', 0.6)
      end
      if announcer == 3 then
        playSound('announcers/fem- showtime', 0.6)
      end
      if announcer == 4 then
        playSound('announcers/fem- rock', 0.6)
      end
      if announcer == 5 then
        playSound('announcers/dazed- showtime', 0.6)
      end
      if announcer == 6 then
        playSound('announcers/reg- showtime', 0.6)
      end
      if announcer == 7 then
        playSound('announcers/soviet- fight', 0.6)
      end
    end
end