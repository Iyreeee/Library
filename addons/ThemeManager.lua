local httpService = game:GetService('HttpService')

return function(Library)
	if not isfile("AntimonyTheme.json") then return end

	local data = readfile("AntimonyTheme.json")
	local success, decoded = pcall(httpService.JSONDecode, httpService, data)
	if not success then return end

	local fields = { "FontColor", "MainColor", "AccentColor", "BackgroundColor", "OutlineColor" }
	for _, field in next, fields do
        Library[field] = decoded[field]
	end

	Library.AccentColorDark = Library:GetDarkerColor(Library.AccentColor)
	Library:UpdateColorsUsingRegistry()
end
