
function onEvent(eventName, value1, value2)
	if eventName == 'Toggle Strums Visibility' then
		local strumset = (value1 > 3 and 'playerStrums') or 'opponentStrums'
		setPropertyFromGroup(strumset, value1 % 4, 'visible', value2 == '1')
	end
end