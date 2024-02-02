function onEvent(eventName, value1, value2)
	if eventName == 'Set Cam Zoom' then
		if value2 == '' then
			setProperty('defaultCamZoom', value1)
		else
			doTweenZoom('camz', 'camGame', tonumber(value1), tonumber(value2), 'sineInOut')
		end
	end
end

function onTweenCompleted(tag)
	if tag == 'camz' then
		setProperty('defaultCamZoom', getProperty('camGame.zoom'))
	end
end