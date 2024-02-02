local xx = 700
local yy = 350
local xx2 = 1000
local yy2 = 500
local ofs = 50

function onUpdate()
	if mustHitSection then
		local boyfriendAnim = getProperty('boyfriend.animation.curAnim.name')
		if boyfriendAnim == 'singLEFT' then
			triggerEvent('Camera Follow Pos', xx2 - ofs, yy2)
		elseif boyfriendAnim == 'singRIGHT' then
			triggerEvent('Camera Follow Pos', xx2 + ofs, yy2)
		elseif boyfriendAnim == 'singUP' then
			triggerEvent('Camera Follow Pos', xx2, yy2 - ofs)
		elseif boyfriendAnim == 'singDOWN' then
			triggerEvent('Camera Follow Pos', xx2, yy2 + ofs)
		else
			triggerEvent('Camera Follow Pos', xx2, yy2)
		end
	else
		local dadAnim = getProperty('dad.animation.curAnim.name')
		if dadAnim:find('singLEFT') then
			triggerEvent('Camera Follow Pos', xx - ofs, yy)
		elseif dadAnim:find('singRIGHT') then
			triggerEvent('Camera Follow Pos', xx + ofs, yy)
		elseif dadAnim:find('singUP') then
			triggerEvent('Camera Follow Pos',xx, yy - ofs)
		elseif dadAnim:find('singDOWN') then
			triggerEvent('Camera Follow Pos',xx, yy + ofs)
		else
			triggerEvent('Camera Follow Pos', xx, yy)
		end
	end
end