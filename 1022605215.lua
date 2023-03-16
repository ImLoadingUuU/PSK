local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/ImLoadingUuU/PSK/main/OrionLib.lua'))()
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
      ["introTitle"] = "加载中",
      ["loaded"] = {
         ["title"] = "已加载",
         ["content"] = "已加载，感谢您使用Project-SUKA"
      },
      ["tab"] = {
         ["esp"]= "透视",
         ["settings"] = "设定"
      },
      ["esps"] = {
         ["killerESP"] = "杀手透视",
         ["playerESP"] = "玩家透视"
      },
      ["kun"]= "ikun 2yhalf, geigei my kun "
   },
   ["ja-jp"] = {
      ["about"] = "無料のRobloxスクリプト",
      ["introTitle"] = "ロード中",
      ["loaded"] = {
         ["title"] = "ロード完了",
         ["content"] = "ロード完了、Project-SUKAの使用ありがとうございます"
      },
      ["tab"] = {
         ["esp"]= "ESP",
         ["settings"] = "設定"
      },
      ["esps"] = {
         ["killerESP"] = "キラーESP",
         ["playerESP"] = "プレイヤーESP"
      }
   },
   ["ko-kr"] = {
      ["about"] = "무료 Roblox 스크립트",
      ["introTitle"] = "로드 중",
      ["loaded"] = {
         ["title"] = "로드 완료",
         ["content"] = "로드 완료, Project-SUKA 사용해 주셔서 감사합니다."
      },
      ["tab"] = {
         ["esp"]= "ESP",
         ["settings"] = "설정"
      },
      ["esps"] = {
         ["killerESP"] = "킬러 ESP",
         ["playerESP"] = "플레이어 ESP"
      }
   },
   ["fr-fr"] = {
      ["about"] = "Script Roblox gratuit",
      ["introTitle"] = "Chargement",
      ["loaded"] = {
         ["title"] = "Chargé",
         ["content"] = "Chargé, merci d'utiliser Project-SUKA"
      },
      ["tab"] = {
         ["esp"]= "ESP",
         ["settings"] = "Paramètres"
      },
      ["esps"] = {
         ["killerESP"] = "ESP Tueur",
         ["playerESP"] = "ESP Joueur"
      }
   },
   ["de-de"] = {
      ["about"] = "Kostenloses Roblox-Script",
      ["introTitle"] = "Laden",
      ["loaded"] = {
         ["title"] = "Geladen",
         ["content"] = "Geladen, vielen Dank, dass Sie Project-SUKA verwenden"
      },
      ["tab"] = {
         ["esp"]= "ESP",
         ["settings"] = "Einstellungen"
      }
   }
}
local lang = Lang[game:GetService("LocalizationService").RobloxLocaleId] or Lang["en-us"]

local p 
if game.Players.LocalPlayer.MembershipType == Enum.MembershipType.Premium then
     p = true
end

local Window = OrionLib:MakeWindow({Name = "Project-SUKA", HidePremium = false, SaveConfig = true, ConfigFolder = "PSA",IntroText = lang["introTitle"]})
if not Lang[game:GetService("LocalizationService").RobloxLocaleId] then
	OrionLib:MakeNotification({
	Name = "Language not supported",
	Content = "Sorry About That! ",
	Image = "rbxassetid://4483345998",
	Time = 5
})

end
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
