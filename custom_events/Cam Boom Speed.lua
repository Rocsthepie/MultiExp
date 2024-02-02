local boomSpeed = 4
local bam = 1
function onEvent(eventName, value1, value2)
	if eventName == 'Cam Boom Speed' then
		boomSpeed = tonumber(value1)
		bam = tonumber(value2)
	end
end

function onBeatHit()
	if curBeat % boomSpeed == 0 then
		triggerEvent('Add Camera Zoom', 0.015 * bam, 0.03 * bam)
	end
end