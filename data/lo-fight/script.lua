local allowCountdown = false
local stops = 0

local vol = 0

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true)

		if stops == 0 then
			playMusic('city', 0, true)
			makeAnimatedLuaSprite('whit', 'whittyCutscene', -200, -90)
			addAnimationByPrefix('whit', 'start', 'Whitty Cutscene Startup', 24, false)
			playAnim('whit', 'start', true)
			addLuaSprite('whit', true)
			cameraFlash('camGame', '000000', 1, true)

			setProperty('dad.visible', false)
			setProperty('camHUD.alpha', 0)
			setProperty('camGame.zoom', 1.5)
			doTweenZoom('www', 'camGame', 1.3, 2.5, 'linear')
			setProperty('camFollowPos.x', 100)
			setProperty('camFollowPos.y', 200)
			doTweenX('wwwD', 'camFollowPos', 250, 2.5, 'linear')

			runTimer('startC', 224 / 24)
			runTimer('rip', 34 / 24)
			runTimer('fire', 41 / 24)
			runTimer('beep', 147 / 24)
			runTimer('bff', 170 / 24)
			runTimer('150', 150 / 24)
		elseif stops == 1 then
			setProperty('camHUD.alpha', 1)
			runTimer('startDialogue', 0.1)
			allowCountdown = true
		end

		stops = stops + 1
		return Function_Stop
	end
	return Function_Continue
end

function onUpdate()
	if vol < 1 then
		setPropertyFromClass('flixel.FlxG','sound.music.volume', vol)
		vol = vol + 0.01
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue')
	end
	if tag == 'startC' then -- Timer completed, play dialogue
		startCountdown()
	end

	if tag == '150' then -- Timer completed, play dialogue
		doTweenX('wwywD', 'camFollowPos', 960, 1, 'sineInOut')
		doTweenZoom('wwhw', 'camGame', 0.75, 1, 'sineInOut')
		doTweenY('wwwD', 'camFollowPos', 460, 1, 'sineInOut')
	end

	if tag == 'rip' then -- Timer completed, play dialogue
		playSound('rip')
	end
	if tag == 'fire' then -- Timer completed, play dialogue
		playSound('fire')
	end

	if tag == 'beep' then -- Timer completed, play dialogue
		playAnim('boyfriend', 'singLEFT', true)
		playSound('beepboop')
	end
	if tag == 'bff' then -- Timer completed, play dialogue
	   playAnim('boyfriend', 'idle', true)
	   setProperty('boyfriend.specialAnim',false)
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	setProperty('dad.visible', true)
	setProperty('whit.visible', false)
end