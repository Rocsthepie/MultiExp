function onCreate()
	makeLuaSprite('bg', 'stages/ritz/back', -600, -300);
	setLuaSpriteScrollFactor('bg', 0.9, 0.9);
	
	makeLuaSprite('stage', 'stages/ritz/front', -450, -650);

	makeLuaSprite('top', 'stages/ritz/top', 700, -500);
	setLuaSpriteScrollFactor('top', 1.3, 1.3);

	makeAnimatedLuaSprite('butz', 'stages/ritz/butz', 1350, 375)
	addAnimationByPrefix('butz', 'idle', 'Bouncin', 24, true)
	scaleObject('butz', 0.7, 0.7);

	addLuaSprite('bg', false);
	addLuaSprite('stage', false);
	addLuaSprite('top', false);
	addLuaSprite('butz', false)
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

function onBeatHit()
	objectPlayAnimation('butz', 'idle', true);
end