local function setStrumVisibilty(value1, isVisible)
	local strumset = (value1 > 3 and 'playerStrums') or 'opponentStrums'
	setPropertyFromGroup(strumset, v1 % 4, 'visible', isVisible)
end

local allowCountdown = false
function onStartCountdown()
	for i = 0, 7 do
		setStrumVisibilty(i, false)
	end

	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true)
		runTimer('startDialogue', 0.8)
		allowCountdown = true
		return Function_Stop
	end
	return Function_Continue
end

function onCreatePost()
	for i = 0, 7 do
		setStrumVisibilty(i, false)
	end
end

function onTimerCompleted(tag, _, _)
	if tag == 'startDialogue' then
		startDialogue('dialogue')
	end
end