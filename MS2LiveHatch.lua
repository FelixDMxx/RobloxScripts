if not game:IsLoaded() then game.Loaded:Wait() end
if game.PlaceId ~= 9551640993 then return end
if not _G.MS2MarketWebhook then _G.MS2MarketWebhook = not _G.MS2MarketWebhook else return end

local a = require(game:GetService("ReplicatedStorage").LoadModule)
local player = game:GetService("Players").LocalPlayer

local RarityToDetect = {
	"Legendary"
}

a("Network"):Connect("DisplayEgg", function(eggName,petTable)
	for i,v in pairs(petTable) do
		local pet = a("Pets")[v[2]]
		if table.find(RarityToDetect, pet.Rarity) then
			local rarity = pet.Rarity
			local chance = 100
			for i2,v2 in pairs(a("Eggs")[eggName].Chances) do
				if v2[2] == v[2] then
					chance = v2[3]
				end
			end
			local R, G, B = Color3.fromRGB(0, 255, 255):ToHSV()
			if chance <= 0.005 then
				R = (R - 0.5) % 1
			elseif chance <= 0.01 then
				R = (R - 0.15) % 1
			end
			if v[3] == 1 then
				chance /= 100
				R = (R + 0.25) % 1
			end
			local Message = ""
			if pet.Secret then
				R = 0.85;
				rarity = "Secret"
				Message = "📢 <@&986297668366110781>"
			end
			
			local petName = v[2]
			if v[3] == 1 then
				petName = "Shiny "..petName
			end
			
			msg = {
				["content"] = Message,
				["embeds"] = {
					{
						["title"] = petName.." • ".."**Chance:** "..chance.."%".." • ".."**Rarity:** "..rarity,
						["color"] = tonumber(Color3.fromHSV(R, G , B):ToHex(), 16),
					}
				}
			}
			local response = syn.request({
				Url = "https://discord.com/api/webhooks/986298779969912852/GOjKovuqu7PlqNSMOR8WmCnWEOGv0P54FoQDLV7pinwPLzRJAeVBYMxDx2OEoYV6NJJZ",
				Method = "POST",
				Headers = {
					["Content-Type"] = "application/json"
				},
				Body = game:GetService("HttpService"):JSONEncode(msg)
			})
		end
	end
end)
