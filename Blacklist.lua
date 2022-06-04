local blacklist = {"RainbowJulieee","FelixDM"}

if table.find(blacklist, game.Players.LocalPlayer.Name) then return false else return true end
