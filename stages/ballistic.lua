function onCreate()
   	makeAnimatedLuaSprite('stage', 'stages/whitty/ballistic', -470, -160)
    	addAnimationByPrefix('stage', 'BallisticBackgroundGo', 'Background Whitty Startup', 24, false)
    	addAnimationByPrefix('stage', 'BallisticBackgroundStart', 'Background Whitty Start0', 24, true)
    	addAnimationByPrefix('stage', 'BallisticBackground', 'Background Whitty Moving', 24, true)
    playAnim('stage', 'BallisticBackground', false)

   	makeLuaSprite('eff','thefunnyeffect', 0, 0)
	setGraphicSize('eff', 1280, 720)
	setObjectCamera('eff', 'camHud')
	setBlendMode('eff', 'multiply')

	addLuaSprite('stage')
	addLuaSprite('eff')
end

function onUpdatePost()
	if flashingLights then
		setProperty('eff.alpha', getHealth() / 1.5)
	end
end
