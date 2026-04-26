--[[local textMap = {
    ["Outgoing"] = "发送",
    ["Incoming"] = "接收",
    ["Ignore"] = "忽略",
    ["Unignore"] = "取消忽略",
    ["Block"] = "阻止",
    ["Unblock"] = "取消阻止",
    ["Clear Logs"] = "清除日志",
    ["Replay"] = "重放",
    ["Copy Calling Code"] = "复制调用代码",
    ["Copy Intercept Code"] = "复制拦截代码",
    ["Copy Remote Path"] = "复制远程对象路径",
    ["Copy Script Path"] = "复制脚本路径",
    ["Copy Function Info"] = "复制函数信息",
    ["Export Logs to HTML"] = "导出日志为 HTML",
    ["Search"] = "搜索",
    ["All"] = "全部",
    ["Settings"] = "设置",
    ["Plugins"] = "插件",
    ["Main"] = "主设置",
    ["Code Generation"] = "代码生成",
    ["Filter"] = "筛选",
    ["Ignored"] = "已忽略",
    ["Blocked"] = "已阻止",
    ["Logging"] = "日志记录",
    ["Support Info"] = "支持信息",
    ["Credits"] = "致谢",
    ["DPI Scale"] = "界面缩放",
    ["Logs Per Page"] = "每页日志数量",
    ["Execute On Teleport"] = "传送后自动执行",
    ["Use alternative metamethod hook"] = "使用备用hookmetamethod",
    ["Built-in Anticheat Bypass"] = "内置反作弊绕过",
    ["Ignore Remotes"] = "忽略的远程对象",
    ["Auto Ignore Spammy Events"] = "自动忽略高频事件",
    ["Log Events from Actors"] = "记录 Actor 环境事件",
    ["Ignore Player Module Remotes"] = "忽略玩家模块远程对象",
    ["Show Executor Remote Logs"] = "显示注入器远程日志",
    ["Reset Filtering to Default"] = "重置筛选为默认",
    ["Enable File Logs"] = "启用文件日志",
    ["Current Session Log"] = "当前会话日志",
    ["Logs Path"] = "日志路径",
    ["Copy Session Name"] = "复制会话名称",
    ["Copy Full Path"] = "复制完整路径",
    ["No remotes have been ignored yet."] = "暂无被忽略的远程对象",
    ["No remotes have been blocked yet."] = "暂无被阻止的远程对象",
    ["Waiting for plugins..."] = "等待插件加载...",
    ["No plugins installed."] = "未安装任何插件",
    ["Executor"] = "注入器",
    ["Actor"] = "Actor 环境",
    ["Method"] = "方法",
    ["Timestamp"] = "时间戳",
    ["ClassName"] = "类名",
    ["Remote Path"] = "远程对象路径",
    ["Caller Data"] = "调用者数据",
    ["Flags"] = "标志",
    ["Origin"] = "来源",
    ["Function Hash"] = "函数哈希",
    ["Upvalues"] = "上值",
    ["Protos"] = "子函数",
    ["Constants"] = "常量",
    ["Script Path"] = "脚本路径",
    ["Func Source"] = "函数源码",
    ["Search for logs..."] = "搜索日志...",
}

local mt = getrawmetatable(game)
local oldIndex = mt.__newindex
setreadonly(mt, false)

mt.__newindex = newcclosure(function(t, k, v)
    if k == "Text" and (t:IsA("TextLabel") or t:IsA("TextButton") or t:IsA("TextBox")) then
        local new = textMap[v]
        if new then v = new end
    elseif k == "PlaceholderText" and t:IsA("TextBox") then
        local new = textMap[v]
        if new then v = new end
    elseif k == "Title" and (t:IsA("TextButton") or t:IsA("Frame")) then
        local new = textMap[v]
        if new then v = new end
    end
    return oldIndex(t, k, v)
end)

setreadonly(mt, true)
]]
loadstring(game:HttpGet("https://github.com/notpoiu/cobalt/releases/latest/download/Cobalt.luau"))()
