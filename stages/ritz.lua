function onCreate()
	makeLuaSprite('bg', 'stages/ritz/back', -600, -300)
	setScrollFactor('bg', 0.9, 0.9)

	makeLuaSprite('stage', 'stages/ritz/front', -450, -650)

	makeLuaSprite('top', 'stages/ritz/top', 700, -500)
	setScrollFactor('top', 1.3, 1.3)

	makeAnimatedLuaSprite('butz', 'stages/ritz/butz', 1350, 375)
	addAnimationByPrefix('butz', 'idle', 'Bouncin', 24, true)
	scaleObject('butz', 0.7, 0.7)

	addLuaSprite('bg', false)
	addLuaSprite('stage', false)
	addLuaSprite('top', false)
	addLuaSprite('butz', false)
end

function onBeatHit()
	playAnim('butz', 'idle', true)
end