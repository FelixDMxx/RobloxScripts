local blacklist = {"RainbowJulieee"}

function check()
	if table.find(blacklist, game:GetService("Players").LocalPlayer.Name) then 
		return false 
	else 
		return true 
	end
end

return check()
