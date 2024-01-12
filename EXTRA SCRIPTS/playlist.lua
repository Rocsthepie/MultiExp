--[[
	The display name table is the name of the playlist.
	It is used for a variety of things, including:
		* The animation sprite of the playlist.
		* The songs that can be selected from the playlist.
		* How many playlists there are.

	Remember that the last display entry doesn't have a comma (,) on the end of it!
]]

local displayName={
	'all',
	'basegame',
	'favs',
	'mods'
}

local allPlaylist={
	
}
local shift = 0

local playlistPage = 1
local playlistPageMax = #displayName

-- require() lets us load extra code that can be shared between scripts
local fileReader = require('mods/' .. currentModDirectory .. '/EXTRA SCRIPTS/module_fileReader')

function onCreatePost()
	setProperty('iconP1.visible', false)
	setProperty('iconP2.visible', false)
	setProperty('healthBar.visible', false)
	setProperty('healthBarBG.visible', false)
	setProperty('scoreTxt.visible', false)
	setProperty('scoreTxtP2.visible', false)
end

function onCreate()
	makeLuaSprite('bagr', 'multibg', 0, 0)
	setObjectCamera('bagr', 'hud')
	scaleObject('bagr', 1.5, 1.5)
	addLuaSprite('bagr', true)

	makeAnimatedLuaSprite('imagePlaylist', 'playlist', 337, 200)
	for i = 1, #displayName, 1 do
		addAnimationByPrefix('imagePlaylist', displayName[i],displayName[i], 1, true)
	end
	-- set it to the first one on the displayNames list
	playAnim('imagePlaylist', displayName[1], true)

	scaleObject('imagePlaylist', 0.5, 0.5);
	setObjectCamera('imagePlaylist', 'hud');
	addLuaSprite('imagePlaylist', true)

	makeLuaText('textChoosePlaylist', 'Choose a Playlist', 1000, 150, 75)
	setObjectCamera('textChoosePlaylist', 'hud');
	setTextAlignment('textChoosePlaylist', 'center')
	setTextSize('textChoosePlaylist', '75')
	setTextFont('textChoosePlaylist', 'fnf.ttf')
	addLuaText('textChoosePlaylist')

	-- check if the ALL SONGS playlist exists
	local allSongPlaylistExists = false
	for i = 1, #displayName, 1 do
		if displayName[i] == 'all' then
			allSongPlaylistExists = true
			break
		end
	end

	if allSongPlaylistExists then
		-- create the ALL SONGS playlist

		for playlistPosition = 1, #displayName, 1 do
			if displayName[playlistPosition] ~= 'all' and displayName[playlistPosition] ~= 'favs' then
				local playlist = getAllSongsFromPlaylist(displayName[playlistPosition])
				if playlist ~= nil and #playlist > 0 then
					for index, value in ipairs(playlist) do
						if value ~= '' then
							table.insert(allPlaylist, playlist[index])
						end
					end
				end
			end
		end
	end
end

function onStartCountdown()
	-- we're not using a song here, so stop the countdown regardless
	return Function_Stop
end

function onUpdate()
	-- that little movement when you press left or right, feels good man
	shift = shift * 0.90
	setProperty('imagePlaylist.x', 337 + shift)

	if justPressedLeft() or justPressedRight() then
		playSound('scrollMenu', 0.4)
		
		-- '(justPressedLeft() and -1) or 1' is basically a ? b : c but lua
		-- basically, it will check if a is true, if so, it will return b, otherwise it will return c
		setPlaylist((justPressedLeft() and -1) or 1)
	end

	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
		-- check if playlist contains any songs

		local playlistSelected = getAllSongsFromPlaylist(displayName[playlistPage])
		if displayName[playlistPage] == 'all' then
			playlistSelected = allPlaylist
		end

		if playlistSelected ~= nil and #playlistSelected > 0 then
			-- playlist contains songs
			playSound('confirmMenu')
			removeLuaSprite('playlist', true)
			removeLuaText('playlist')

			-- checking for a table in a table - table[1][2]
			local playlistSongName = playlistSelected[getRandomInt(1, #playlistSelected)]
			loadSong(playlistSongName)
		else
			-- playlist contains no songs
			playSound('cancelMenu')
			createErrorMessage('onUpdate() - Playlist ' .. displayName[playlistPage] .. ' is empty.')
		end
	elseif getPropertyFromClass('flixel.FlxG', 'keys.justPressed.BACKSPACE') or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ESCAPE') then
		-- exit the song
		-- don't use endSong(), as that will bring up the results screen
		exitSong(false)
	end
end

---@param playlistName string
---@return table
function getAllSongsFromPlaylist(playlistName)
	if playlistName == 'all' then
		return {}
	end

	local file = 'PLAYLISTS/' .. playlistName .. '.txt'
	if not fileReader.checkFileExists(file) then
		return {}
	end

	return fileReader.returnContentsOfFile(file)
end

---@param pageChange integer
function setPlaylist(pageChange)
	playlistPage = playlistPage + pageChange
	if playlistPage > playlistPageMax then
		-- loop around to 1 if you pressed right again
		playlistPage = 1
	elseif playlistPage < 1 then
		-- loop around to the max if you pressed left again
		playlistPage = playlistPageMax
	end
	shift = pageChange * -5

	-- makes it easy to hide in visual studio code
	do
		if createConditionalErrorMessage(#displayName == 0, 'setPlaylist() - displayName[] is empty.') then
			return
		elseif createConditionalErrorMessage(playlistPageMax < 1, 'setPlaylist() - playlistPageMax has a value of ' .. playlistPageMax .. ', which is below 1.') then
			return
		elseif createConditionalErrorMessage(playlistPage > playlistPageMax, 'setPlaylist() - playlistPage, valued at ' .. playlistPage .. ', is above variable playlistPageMax, which is valued at ' .. playlistPageMax .. '.') then
			return
		elseif createConditionalErrorMessage(playlistPage < 1, 'setPlaylist() - playlistPage, valued at ' .. playlistPage .. ', is below value 1.') then
			return
		elseif createConditionalErrorMessage(displayName[playlistPage] == nil, 'setPlaylist() - The current playlist does not have a sprite value in displayName[].') then
			return
		end
	end
	playAnim('imagePlaylist', displayName[playlistPage], true)
end