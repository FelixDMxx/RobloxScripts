local blacklist = {"RainbowJulieee","FelixDM"}

print(game.Players.LocalPlayer.Name)
if table.find(blacklist, game.Players.LocalPlayer.Name) then return end
