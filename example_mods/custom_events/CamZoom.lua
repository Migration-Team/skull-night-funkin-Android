function onEvent(name,value1,value2)
    if name == 'CamZoom' then
        setProperty('defaultCamZoom', value1)
    end
end