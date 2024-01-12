function onCreate()
	if songName == "Random Song" then
		addLuaScript('EXTRA SCRIPTS/playlist')
	else
		addLuaScript('EXTRA SCRIPTS/character_selector')

	end
end

-- this is used to detect what/when scripts on EXTRA SCRIPTS should be started (in this case, playlist script only triggers when entering 'Custom Song' song on Freeplay, with character selector triggering on every other song)