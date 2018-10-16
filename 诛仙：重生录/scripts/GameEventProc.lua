GameEventProc = {}

--添加事件 name-->事件类型  func-->方法
function GameEventProc.RegisterEventHandler(name, func)
    if (name == nil or func == nil) then
        Game.Log("RegisterEventHandler中name或func为空")
        return
    end
    if (GameEventProc[name] == nil) then
        local a = {}
        table.insert(a, func)
        GameEventProc[name] = a
    else
        table.insert(GameEventProc[name], func)
    end
end
--移除事件
function GameEventProc.UnregisterEventHandler(name, func)
    if (name == nil or func == nil) then
        Game.Log("UnregisterEventHandler中name或func为空")
        return
    end
    local a = GameEventProc[name]
    if (a ~= nil) then
        for k, v in pairs(a) do
            if (v == func) then
                a[k] = nil
            end
        end
    end
end

--派发事件
function GameEventProc.SendEvent(eventType, ...)
    if (eventType ~= nil) then
        local a = GameEventProc[eventType]
        if (a ~= nil) then
            for k, v in pairs(a) do
                v(...)
            end
        end
    end
end