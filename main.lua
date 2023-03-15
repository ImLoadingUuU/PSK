print("ProjectSUKA")
print("PSA Preloader")
local Build = "0002"
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true))()
local Debug = false
local Lang = {
     ["en-us"] = {
          ["fs_not_supported_title"] = "File system not supported",
          ["fs_not_supported_description"] = "Some feature may not works",
           ["fs_supported_title"] = "File system are supported",
          ["fs_supported_description"] = "Works perfectly",
          ["executor_detected_title"]  = "Executor Detected",
          ["executor_detected_description"] = "Executor: ",
          ["collectData_title"] = "Collect Data",
          ["collectData_description"] = "We will collect your data (Executor Name,Error Data, Experience Name)to help our team improve Project-SUKA.",
          ["collectData_disagree_title"] = "Disagree",
          ["collectData_disagree_description"] = "You may need stop using Project SUKA",
          ["build_info"] = "Build Info",
          ["ggs"] = "Switching Generic Games Script",
          ["ggs_desc"] = "Generic Games Script"
     },
      ["zh-cn"] = {
          ["fs_not_supported_title"] = "此外挂不支持文件系统",
          ["fs_not_supported_description"] = "一些功能将不会运作",
           ["fs_supported_title"] = "此外挂支持文件系统",
          ["fs_supported_description"]= "运作良好",
          ["executor_detected_title"]  = "外挂名称",
          ["executor_detected_description"] = "外挂: ",
          ["collectData_title"] = "采取数据",
          ["collectData_description"] = "我们将收集您的数据 (外掛名稱, 錯誤內容, 體驗名稱...)来帮助我们的团队改进 Project-SUKA.",
           ["collectData_disagree_title"] = "不同意",
          ["collectData_disagree_description"] = "请您暂停使用Project-SUKA",
          ["build_info"] = "构建版本",
          ["ggs"] = "通用游戏脚本",
          ["ggs_desc"] = "已使用通用游戏脚本"
     } 
}
local SelectedLang=  Lang[game:GetService("LocalizationService").RobloxLocaleId] or Lang["en-us"]
if readfile and writefile and loadfile   then
   
    Notification.new("success", SelectedLang["fs_supported_title"], SelectedLang["fs_supported_description"],true)
    else 
     Notification.new("warning", SelectedLang["fs_not_supported_title"], SelectedLang["fs_noT_supported_description"],true)
end

if  identifyexecutor then
     Notification.new("success", SelectedLang["executor_detected_title"], SelectedLang["executor_detected_description"] .. identifyexecutor(),true )
end
Notification.new("info", SelectedLang["collectData_title"],SelectedLang["collectData_description"],true)
Notification.new("info", SelectedLang["collectData_disagree_title"],SelectedLang["collectData_disagree_description"],true)
Notification.new("info", SelectedLang["build_info"], Build,true)
loadstring(game:HttpGet("https://raw.githubusercontent.com/ImLoadingUuU/PSK/main/".. game.PlaceId .. ".lua"))();
