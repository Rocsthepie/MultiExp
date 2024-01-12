local fileReader = {}

---Checks if specific file exists.
---@param path string
---@return boolean
function fileReader.checkFileExists(path)
	local file = getTextFromFile(path, false)
	if file == nil then
		-- try seeing if it's in the current mod directory
		file = getTextFromFile(currentModDirectory .. '/' .. path, true)

		if file == nil then
			-- try seeing if it's in the assets
			file = getTextFromFile('assets/' .. path, true)

			if createConditionalErrorMessage(file == nil, 'fileReader.checkFileExists() - Text file ' .. path .. ' cannot be found.') then
				return false
			end
		end
	end
	return true
end

---Returns the contents of a file as a table.
---@param path string
---@return table
function fileReader.returnContentsOfFile(path)
	if path == '' or not fileReader.checkFileExists(path) then
		return {}
	end
	local file = getTextFromFile(path, false)

	local findResults = {}
	local listOfValues = {''}
	table.remove(listOfValues, 1)

	local startOfValue = 1
	while true do
		findResults = ({ file:find('\n', startOfValue) })
		if findResults[1] == nil then
			findResults[1] = #file + 2
		end
		table.insert(listOfValues, file:sub(startOfValue, tonumber(findResults[1]) - 2))

		startOfValue = tonumber(findResults[1]) + 1
		if startOfValue >= #file then
			break
		end
	end

	return listOfValues
end

---Returns one line of content from a file as a string. If `valuePosition` isn't specified, it will return a random value from file. Returns `nil` if no file is found.
---@param path string
---@param valuePosition? integer
---@return string
function fileReader.returnValueFromFile(path, valuePosition)
	-- look for file
	local listOfValues = fileReader.returnContentsOfFile(path)
	if listOfValues == nil or #listOfValues == 0 then
		return nil
	end

	if valuePosition == nil then
		return listOfValues[getRandomInt(1, #listOfValues)]
	end
	return listOfValues[valuePosition]
end

return fileReader