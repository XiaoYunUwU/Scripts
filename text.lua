notify({
    Title = "XA：提示",
    Description = "欢迎加入XA Hub二群：\n996419273",
    Accept = {
        Text = "复制群号",
        Callback = function()
            setclipboard("996419273")
        end
    },
    Dismiss = {
        Text = "关闭",
        Callback = function()
        end
    }
})