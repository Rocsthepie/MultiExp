function onUpdate()
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ESCAPE') then
		endSong()
	end
end