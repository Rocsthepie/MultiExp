local allowCountdown = false
local inSelection = true

local characterNames = {
	-- main characters
	{'default1','no1','bf1','geef1','dad1','mom1','pico1','tankman1','spooky1','monster1','senpai1','spirit1'},

	-- extra characters
	{'bf-christ1','dad-christ1','mom-christ1','monster-christ1','bf-pixel1','senpai-angry1','bf-gf1'},

	-- mod characters
	{'whitty1','whitty-crazy1','ritz1','senpai-hd1'}
}

local opponentNames = {
	-- main opponents
	{'default2','no2','bf2','geef2','dad2','mom2','pico2','tankman2','spooky2','monster2','senpai2','spirit2'},

	-- extra opponents
	{'bf-christ2','dad-christ2','mom-christ2','monster-christ2','bf-pixel2','senpai-angry2','bf-gf2'},

	-- mod characters
	{'whitty2','whitty-crazy2','ritz2','senpai-hd2'}
}

local gfNames = {
	-- main gf
	{'default3','no3','gf3','speakers3','gf-christ3','gf-pixel3','gf-tankman3','pico-tankman3','gf-whitty3'},--------------note to self: add pico-speakers

	-- p1 gf
	{'bf1','geef1','dad1','mom1','pico1','tankman1','spooky1','monster1','senpai1','spirit1','senpai-hd1','whitty1','ritz1'},

	-- p2 gf
	{'bf2','geef2','dad2','mom2','pico2','tankman2','spooky2','monster2','senpai2','spirit2','senpai-hd2','whitty2','ritz2'}
}

local categoryNames = {'Main Characters','Character Variants','Mod Characters'} -- category display for characters
local opponentCategoryNames = {'Main Characters','Character Variants','Mod Characters'} -- category display for opponents
local gfCategoryNames = {'Girlfriend','Extra Player one','Extra Player two'} -- category display for opponents

local category = 1
local maxCategory = #characterNames

local opponentCategory = 1
local opponentMaxCategory = #opponentNames

local gfCategory = 1
local gfMaxCategory = #gfNames

local page = 1
local maxPage = #characterNames[1] -- gets main characters length

local opponentPage = 1
local opponentMaxPage = #opponentNames[1] -- gets main opponents length

local gfPage = 1
local gfMaxPage = #gfNames[1] -- gets main gf length

local textToRemove = {'ad', 'ws', 'lr', 'ud', 'jl', 'ik', 'character', 'cat1', 'cat2', 'cat3'}

function onCreate()
	makeLuaSprite('fader', '', -200, -200)
	makeGraphic('fader', 1920, 1080, '000000')
	addLuaSprite('fader', true)
	setScrollFactor('fader', 0, 0)
	setProperty('fader.alpha', 0)
	setObjectCamera('fader', 'other')

	makeLuaSprite('bagr', 'multibg', 0, 0)
	setObjectCamera('bagr','hud');
	scaleObject('bagr', 1.5, 1.5);
	addLuaSprite('bagr', true)

	makeAnimatedLuaSprite('pfp1', 'portrait', 875, 250)---------------------------------------------------------pfps player
	addAnimationByPrefix('pfp1', 'bf1', 'bf0', 1, true)
	addAnimationByPrefix('pfp1', 'geef1', 'gf0', 1, true)
	addAnimationByPrefix('pfp1', 'pico1', 'pico0', 1, true)
	addAnimationByPrefix('pfp1', 'dad1', 'dad0', 1, true)
	addAnimationByPrefix('pfp1', 'mom1', 'mom0', 1, true)
	addAnimationByPrefix('pfp1', 'tankman1', 'tankman0', 1, true)
	addAnimationByPrefix('pfp1', 'spooky1', 'spooky0', 1, true)
	addAnimationByPrefix('pfp1', 'monster1', 'monster0', 1, true)
	addAnimationByPrefix('pfp1', 'senpai1', 'senpai pixel0', 1, true)
	addAnimationByPrefix('pfp1', 'spirit1', 'spirit pixel0', 1, true)
	addAnimationByPrefix('pfp1', 'bf-christ1', 'bf natal0', 1, true)
	addAnimationByPrefix('pfp1', 'dad-christ1', 'dad natal0', 1, true)
	addAnimationByPrefix('pfp1', 'mom-christ1', 'mom natal0', 1, true)
	addAnimationByPrefix('pfp1', 'monster-christ1', 'monster natal0', 1, true)
	addAnimationByPrefix('pfp1', 'bf-pixel1', 'bf pixel0', 1, true)
	addAnimationByPrefix('pfp1', 'senpai-angry1', 'senpai angry pixel0', 1, true)
	addAnimationByPrefix('pfp1', 'bf-gf1', 'bf gf0', 1, true)
	addAnimationByPrefix('pfp1', 'whitty1', 'whitty0', 1, true)
	addAnimationByPrefix('pfp1', 'whitty-crazy1', 'whitty crazy0', 1, true)
	addAnimationByPrefix('pfp1', 'ritz1', 'ritz0', 1, true)
	addAnimationByPrefix('pfp1', 'senpai-hd1', 'senpai hd0', 1, true)
	addAnimationByPrefix('pfp1', 'no1', 'no bf0', 1, true)
	addAnimationByPrefix('pfp1', 'default1', 'default bf0', 1, true)

	scaleObject('pfp1', 0.5, 0.5);
	setObjectCamera('pfp1','hud');
	addLuaSprite('pfp1', true)

	makeAnimatedLuaSprite('pfp2', 'portrait', 75, 250)---------------------------------------------------------pfps oponent
	addAnimationByPrefix('pfp2', 'bf2', 'bf0', 1, true)
	addAnimationByPrefix('pfp2', 'geef2', 'gf0', 1, true)
	addAnimationByPrefix('pfp2', 'pico2', 'pico0', 1, true)
	addAnimationByPrefix('pfp2', 'dad2', 'dad0', 1, true)
	addAnimationByPrefix('pfp2', 'mom2', 'mom0', 1, true)
	addAnimationByPrefix('pfp2', 'tankman2', 'tankman0', 1, true)
	addAnimationByPrefix('pfp2', 'spooky2', 'spooky0', 1, true)
	addAnimationByPrefix('pfp2', 'monster2', 'monster0', 1, true)
	addAnimationByPrefix('pfp2', 'senpai2', 'senpai pixel0', 1, true)
	addAnimationByPrefix('pfp2', 'spirit2', 'spirit pixel0', 1, true)
	addAnimationByPrefix('pfp2', 'bf-christ2', 'bf natal0', 1, true)
	addAnimationByPrefix('pfp2', 'dad-christ2', 'dad natal0', 1, true)
	addAnimationByPrefix('pfp2', 'mom-christ2', 'mom natal0', 1, true)
	addAnimationByPrefix('pfp2', 'monster-christ2', 'monster natal0', 1, true)
	addAnimationByPrefix('pfp2', 'bf-pixel2', 'bf pixel0', 1, true)
	addAnimationByPrefix('pfp2', 'senpai-angry2', 'senpai angry pixel0', 1, true)
	addAnimationByPrefix('pfp2', 'bf-gf2', 'bf gf0', 1, true)
	addAnimationByPrefix('pfp2', 'whitty2', 'whitty0', 1, true)
	addAnimationByPrefix('pfp2', 'whitty-crazy2', 'whitty crazy0', 1, true)
	addAnimationByPrefix('pfp2', 'ritz2', 'ritz0', 1, true)
	addAnimationByPrefix('pfp2', 'senpai-hd2', 'senpai hd0', 1, true)
	addAnimationByPrefix('pfp2', 'no2', 'no dad0', 1, true)
	addAnimationByPrefix('pfp2', 'default2', 'default dad0', 1, true)

	scaleObject('pfp2', 0.5, 0.5);
	setObjectCamera('pfp2','hud');
	addLuaSprite('pfp2', true)

	makeAnimatedLuaSprite('pfp3', 'portrait', 475, 250)---------------------------------------------------------pfps gf
	addAnimationByPrefix('pfp3', 'gf3', 'gf0', 1, true)
	addAnimationByPrefix('pfp3', 'gf-christ3', 'gf natal0', 1, true)
	addAnimationByPrefix('pfp3', 'gf-pixel3', 'gf pixel0', 1, true)
	addAnimationByPrefix('pfp3', 'gf-tankman3', 'gf tankman0', 1, true)
	addAnimationByPrefix('pfp3', 'gf-whitty3', 'gf whitty0', 1, true)
	addAnimationByPrefix('pfp3', 'speakers3', 'speakers0', 1, true)
	addAnimationByPrefix('pfp3', 'pico-tankman3', 'pico tankman0', 1, true)
	addAnimationByPrefix('pfp3', 'bf1', 'bf0', 1, true)
	addAnimationByPrefix('pfp3', 'geef1', 'gf0', 1, true)
	addAnimationByPrefix('pfp3', 'pico1', 'pico0', 1, true)
	addAnimationByPrefix('pfp3', 'dad1', 'dad0', 1, true)
	addAnimationByPrefix('pfp3', 'mom1', 'mom0', 1, true)
	addAnimationByPrefix('pfp3', 'tankman1', 'tankman0', 1, true)
	addAnimationByPrefix('pfp3', 'spooky1', 'spooky0', 1, true)
	addAnimationByPrefix('pfp3', 'monster1', 'monster0', 1, true)
	addAnimationByPrefix('pfp3', 'senpai1', 'senpai pixel0', 1, true)
	addAnimationByPrefix('pfp3', 'spirit1', 'spirit pixel0', 1, true)
	addAnimationByPrefix('pfp3', 'bf-christ1', 'bf natal0', 1, true)
	addAnimationByPrefix('pfp3', 'dad-christ1', 'dad natal0', 1, true)
	addAnimationByPrefix('pfp3', 'mom-christ1', 'mom natal0', 1, true)
	addAnimationByPrefix('pfp3', 'monster-christ1', 'monster natal0', 1, true)
	addAnimationByPrefix('pfp3', 'bf-pixel1', 'bf pixel0', 1, true)
	addAnimationByPrefix('pfp3', 'bf-gf1', 'bf gf0', 1, true)
	addAnimationByPrefix('pfp3', 'whitty1', 'whitty0', 1, true)
	addAnimationByPrefix('pfp3', 'whitty-crazy1', 'whitty crazy0', 1, true)
	addAnimationByPrefix('pfp3', 'ritz1', 'ritz0', 1, true)
	addAnimationByPrefix('pfp3', 'senpai-hd1', 'senpai hd0', 1, true)
	addAnimationByPrefix('pfp3', 'bf2', 'bf0', 1, true)
	addAnimationByPrefix('pfp3', 'geef2', 'gf0', 1, true)
	addAnimationByPrefix('pfp3', 'pico2', 'pico0', 1, true)
	addAnimationByPrefix('pfp3', 'dad2', 'dad0', 1, true)
	addAnimationByPrefix('pfp3', 'mom2', 'mom0', 1, true)
	addAnimationByPrefix('pfp3', 'tankman2', 'tankman0', 1, true)
	addAnimationByPrefix('pfp3', 'spooky2', 'spooky0', 1, true)
	addAnimationByPrefix('pfp3', 'monster2', 'monster0', 1, true)
	addAnimationByPrefix('pfp3', 'senpai2', 'senpai pixel0', 1, true)
	addAnimationByPrefix('pfp3', 'spirit2', 'spirit pixel0', 1, true)
	addAnimationByPrefix('pfp3', 'bf-christ2', 'bf natal0', 1, true)
	addAnimationByPrefix('pfp3', 'dad-christ2', 'dad natal0', 1, true)
	addAnimationByPrefix('pfp3', 'mom-christ2', 'mom natal0', 1, true)
	addAnimationByPrefix('pfp3', 'monster-christ2', 'monster natal0', 1, true)
	addAnimationByPrefix('pfp3', 'bf-pixel2', 'bf pixel0', 1, true)
	addAnimationByPrefix('pfp3', 'bf-gf2', 'bf gf0', 1, true)
	addAnimationByPrefix('pfp3', 'whitty2', 'whitty0', 1, true)
	addAnimationByPrefix('pfp3', 'whitty-crazy2', 'whitty crazy0', 1, true)
	addAnimationByPrefix('pfp3', 'ritz2', 'ritz0', 1, true)
	addAnimationByPrefix('pfp3', 'senpai-hd2', 'senpai hd0', 1, true)
	addAnimationByPrefix('pfp3', 'no3', 'no gf0', 1, true)
	addAnimationByPrefix('pfp3', 'default3', 'default gf0', 1, true)

	scaleObject('pfp3', 0.5, 0.5);
	setObjectCamera('pfp3','hud');
	addLuaSprite('pfp3', true)

	makeLuaText('ad', 'A or D to change character', 200, 0, 615)
	setObjectCamera('ad','hud');
	addLuaText('ad')

	makeLuaText('ws', 'W or S to change character category', 200, 0, 665)
	setObjectCamera('ws','hud');
	addLuaText('ws')

	makeLuaText('lr', 'LEFT or RIGHT to change character', 200, 1075, 615)
	setObjectCamera('lr','hud');
	addLuaText('lr')

	makeLuaText('ud', 'UP or DOWN to change character category', 200, 1075, 665)
	setObjectCamera('ud','hud');
	addLuaText('ud')

	makeLuaText('jl', 'J or L to change girlfriend', 200, 537, 615)
	setObjectCamera('jl','hud');
	addLuaText('jl')

	makeLuaText('ik', 'I or K to change girlfriend category', 200, 537, 665)
	setObjectCamera('ik','hud');
	addLuaText('ik')

	makeLuaText('character', 'Choose Your Characters', 1000, 130, 75)
	setObjectCamera('character','hud');
	setTextSize('character','75')
	setTextAlignment('character','center')
	setTextFont('character', 'fnf.ttf')
	setTextColor('character','ffff00')
	addLuaText('character')

	makeLuaText('cat1', categoryNames[category], 1000, 529, 215)
	setObjectCamera('cat1','hud');
	setTextSize('cat1','25')
	setTextAlignment('cat1','center')
	setTextFont('cat1', 'fnf.ttf')
	setTextColor('cat1','00ffff')
	addLuaText('cat1')

	makeLuaText('cat2', opponentCategoryNames[opponentCategory], 1000, -271, 215)
	setObjectCamera('cat2','hud');
	setTextSize('cat2','25')
	setTextAlignment('cat2','center')
	setTextFont('cat2', 'fnf.ttf')
	setTextColor('cat2','00ffff')
	addLuaText('cat2')

	makeLuaText('cat3', gfCategoryNames[gfCategory], 1000, 130, 215)
	setObjectCamera('cat3','hud');
	setTextSize('cat3','25')
	setTextAlignment('cat3','center')
	setTextFont('cat3', 'fnf.ttf')
	setTextColor('cat3','00ffff')
	addLuaText('cat3')

	playMusic('offsetSong')
end

function onCreatePost()
	setProperty('iconP1.visible', false)----------------------------------------------------------------hide HUD
	setProperty('iconP2.visible', false)
	setProperty('healthBar.visible', false)
	setProperty('healthBarBG.visible', false)
	setProperty('scoreTxt.visible', false)
	setProperty('scoreTxtP2.visible', false)
end

function onStartCountdown()
	setProperty('iconP1.visible', true)----------------------------------------------------------------hide HUD
	setProperty('iconP2.visible', true)
	setProperty('healthBar.visible', true)
	setProperty('healthBarBG.visible', true)
	setProperty('scoreTxt.visible', true)
	setProperty('scoreTxtP2.visible', true)
	if not allowCountdown and not isStoryMode then
		setProperty('inCutscene', true);
		allowCountdown = true;
		return Function_Stop;
	end

	return Function_Continue;
end

function onUpdate()
	if inSelection == false then
		return
	end

	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
		if getProperty('inCutscene') == true then
			for i = 1, 3 do
				removeLuaSprite('pfp' .. i)
			end

			for i = 0, #textToRemove do
				removeLuaText(textToRemove[i])
			end
			stopSound('offsetSong')
			playMusic('gameOverEnd', 0.5)

			runTimer('startsong', 5)
			runTimer('fadein', 2.5)
			runTimer('fadedelay', 1.5)
			setProperty('seenCutscene', true)
		end
	elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.BACKSPACE') or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ESCAPE') then
		exitSong(false)
	end

	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.LEFT') then
		setCharacter(-1)
	elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.RIGHT') then
		setCharacter(1)
	end

	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.A') then
		setOpponent(-1)
	elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.D') then
		setOpponent(1)
	end

	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.J') then
		setGf(-1)
	elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.L') then
		setGf(1)
	end

	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.DOWN') then
		setCharacterCategory(1)
	elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.UP') then
		setCharacterCategory(-1)
	end

	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.S') then
		setOpponentCategory(1)
	elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.W') then
		setOpponentCategory(-1)
	end

	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.K') then
		setGfCategory(1)
	elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.I') then
		setGfCategory(-1)
	end
end

function onTimerCompleted(tag)
	if tag == 'fadedelay' then
		doTweenAlpha('faderfader', 'fader', 1, 0.9, 'linear')
	end

	if tag == 'fadein' then
		inSelection = false
		removeLuaSprite('bagr', true)
		runTimer('fadeout', 2.5)
		if page > 2 or category > 1 then
			triggerEvent('Change Character', 0, characterNames[category][page])
		elseif page == 2 and category == 1 then
			setProperty('boyfriend.visible', false)
		end

		if opponentPage > 2 or opponentCategory > 1 then
			triggerEvent('Change Character', 1, opponentNames[opponentCategory][opponentPage])
		elseif opponentPage == 2 and opponentCategory == 1 then
			setProperty('dad.visible', false)
		end

		if gfPage > 2 and gfCategory == 1 then
			triggerEvent('Change Character', 2, gfNames[gfCategory][gfPage])
		elseif gfPage == 2 and gfCategory == 1 then
			setProperty('gf.visible', false)
		elseif gfCategory > 1 then
			triggerEvent('Change Character', 2, gfNames[gfCategory][gfPage])
		end
		if string.find(getProperty('gf.curCharacter'), '1') then -- if gf is an Extra Player One
			setCharacterX('gf', defaultBoyfriendX - 150)
			setCharacterY('gf', defaultBoyfriendY - 30)
			setProperty('gf.flipX', not getProperty('gf.flipX'))
		end
		if string.find(getProperty('gf.curCharacter'), '2') then -- if gf is an Extra Player Two
			setCharacterX('gf', defaultOpponentX + 150)
			setCharacterY('gf', defaultOpponentY - 30)
		end
	end

	if tag == 'startsong' then
		startCountdown()
		close(false)
	end
end

function setCharacterCategory(categoryChange)
	category = category + categoryChange
	category = menuSelecterHandler(category, maxCategory)

	page = 1
	maxPage = #characterNames[category]
	playAnim('pfp1', characterNames[category][page], true)
	setTextString('cat1', categoryNames[category]);
end

function setOpponentCategory(opponentCategoryChange)
	opponentCategory = opponentCategory + opponentCategoryChange
	opponentCategory = menuSelecterHandler(opponentCategory, opponentMaxCategory)

	opponentPage = 1
	opponentMaxPage = #opponentNames[opponentCategory]
	playAnim('pfp2', opponentNames[opponentCategory][opponentPage], true)
	setTextString('cat2', opponentCategoryNames[opponentCategory]);
end

function setGfCategory(gfCategoryChange)
	gfCategory = gfCategory + gfCategoryChange
	gfCategory = menuSelecterHandler(gfCategory, gfMaxCategory)

	gfPage = 1
	gfMaxPage = #gfNames[gfCategory]
	playAnim('pfp3', gfNames[gfCategory][gfPage], true)
	setTextString('cat3', gfCategoryNames[gfCategory]);
end

function setCharacter(pageChange)
	page = page + pageChange
	page = menuSelecterHandler(page, maxPage)

	playAnim('pfp1', characterNames[category][page], true)
end

function setOpponent(pageChange)
	opponentPage = opponentPage + pageChange
	opponentPage = menuSelecterHandler(opponentPage, opponentMaxPage)

	playAnim('pfp2', opponentNames[opponentCategory][opponentPage], true)
end

function setGf(pageChange)
	gfPage = gfPage + pageChange
	gfPage = menuSelecterHandler(gfPage, gfMaxPage)

	playAnim('pfp3', gfNames[gfCategory][gfPage], true)
end

function menuSelecterHandler(value, maxValue)
	if value > maxValue then
		return 1
	elseif value < 1 then
		return maxValue
	end

	return value
end

function onTweenCompleted(tag)
	if tag == 'faderfader' then
		doTweenAlpha('faderfaderBYE', 'fader', 0, 1.4, 'linear')
	end
end