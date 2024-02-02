function onCreate()
	makeLuaSprite('stageback', 'stages/whitty/back', -420, -130)
	setScrollFactor('stageback', 1.0, 1.0)

	makeLuaSprite('stagefront', 'stages/whitty/front', -300, 670)
	setScrollFactor('stagefront', 1.0, 1.0)

	addLuaSprite('stageback')
	addLuaSprite('stagefront')
	close(false)
end