local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Lang = {
    ["en-us"] = {
        ["about"] = "Free Roblox Script",
        ["introTitle"] = "Loading",
         ["loaded"] = {
            ["title"] = "Loaded",
            ["content"] = "Loaded,Thanks you using Project-SUKA"
        },
        ["tab"] = {
            ["esp"]= "ESP",
            ["settings"] = "Setting"
        },
        ["esps"] = {
            ["killerESP"] = "Killer ESP",
            ["playerESP"] = "Player ESP"
        }
    },
    ["zh-cn"] = {
        ["about"] = "免费的罗布乐思脚本",
        ["introTitle"] = "载入中",
         ["loaded"] = {
            ["title"] = "已载入",
            ["content"] = "已载入,感谢使用Project-SUKA"
        },
        ["tab"] = {
            ["esp"]= "透视",
            ["settings"] = "设定"
        },
        ["esps"] = {
            ["killerESP"] = "杀手透视",
            ["playerESP"] = "玩家透视"
        }
    }
}
local lang = Lang[game:GetService("LocalizationService").RobloxLocaleId] or Lang["en-us"]
local p 
if game.Players.LocalPlayer.MembershipType == Enum.MembershipType.Premium then
     p = true
end

local Window = OrionLib:MakeWindow({Name = "Project-SUKA", HidePremium = false, SaveConfig = true, ConfigFolder = "PSA",IntroText = lang["introTitle"]})
local Billboards = {

}
local PBillboards = {

}
--Player Tab--

local ESP = Window:MakeTab({
	Name = lang.tab.esp,
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local PlayerSection = ESP:AddSection({
	Name = lang.tab.esp
})
OrionLib:MakeNotification({
	Name = lang.loaded.title,
	Content = lang.loaded.content,
	Image = "rbxassetid://4483345998",
	Time = 5
})

ESP:AddToggle({
	Name = lang.esps.killerESP,
	Default = false,
	Callback = function(Value)
	   if Value then
           for i,v in pairs(game.Players:GetChildren()) do
           if v.Character:FindFirstChild("Knife") or v.Backpack:FindFirstChild("Knife") then
           print("Found")
               local Billboard = Instance.new("BillboardGui")
              Billboard.AlwaysOnTop = true
               Billboard.Adornee = v.Character.Head
               Billboard.Parent = v.Character.Head
               Billboard.DistanceUpperLimit = -1
               Billboard.Enabled = true
               Billboard.Size = UDim2.new(1,0,1,0)
               Billboard.MaxDistance = 114514114451444
               local Frame = Instance.new("Frame")
               Frame.Size = UDim2.new(1,0,1,0)
               Frame.BackgroundColor3 = Color3.fromRGB(255,0,0)
               Frame.Parent = Billboard
               table.insert(Billboards,Billboard)
               return
           end
          
           
       end

       else 
       for i,v in pairs(Billboards) do
           if v:IsA("BillboardGui") then
               v:Destroy()
           end
       end
       end
	end    
})

ESP:AddToggle({
	Name = lang.esps.PlayerESP,
	Default = false,
	Callback = function(Value)
	    if Value then
           for i,v in pairs(game.Players:GetChildren()) do
           if not v.Character:FindFirstChild("Knife")  and not v.Backpack:FindFirstChild("Knife") and v ~= game.Players.LocalPlayer then
           print("Found")
               local Billboard = Instance.new("BillboardGui")
               Billboard.AlwaysOnTop = true
               Billboard.Adornee = v.Character.Head
               Billboard.Parent = v.Character.Head
               Billboard.DistanceUpperLimit = -1
               Billboard.Enabled = true
               Billboard.Size = UDim2.new(1,0,1,0)
               Billboard.MaxDistance = 114514114451444
               local Frame = Instance.new("Frame")
               Frame.Size = UDim2.new(1,0,1,0)
               Frame.BackgroundColor3 = Color3.fromRGB(0,255,0)
               Frame.Parent = Billboard
               table.insert(PBillboards,Billboard)
               
           end
            
       end

       else 
       for i,v in pairs(PBillboards) do
           if v:IsA("BillboardGui") then
               v:Destroy()
           end
       end
       end
	end    
})


--Player Tab End--

--Settings Tab--

local SettingsTab = Window:MakeTab({
	Name = lang.tab.settings,
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local SettingsSection = SettingsTab:AddSection({
	Name = lang.tab.settings
})

SettingsSection:AddButton({
	Name = "Destroy UI",
	Callback = function()
        OrionLib:Destroy()
  	end    
})
SettingsSection:AddParagraph("Project-SUKA",lang.about)

--Settings End--

OrionLib:Init() --UI Lib End
