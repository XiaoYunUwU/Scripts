notify({
    Title = "XA：开玩笑😅",
    Description = "检测到您尚未加入XA Hub主群\n群号：1057545155\n\n未加入将无法正常使用脚本",
    Accept = {
        Text = "立即复制群号",
        Callback = function()
            setclipboard("1057545155")
        end
    },
    Dismiss = {
        Text = "残忍拒绝",
        Callback = function()
        end
    }
