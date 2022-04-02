--[[
    Auto Queue for Lmaobox
    Author: LNX (github.com/lnx00)
    Modified by VanillaIsMyWaifu
]]


AutoQueue = true
local lastTime = 0
local casualQueue = party.GetAllMatchGroups()["Casual"]

local function Draw_AutoQueue()
    if not AutoQueue or gamecoordinator.HasLiveMatch() or gamecoordinator.IsConnectedToMatchServer() or gamecoordinator.GetNumMatchInvites() > 0 then
        return
    end

    if globals.RealTime() - lastTime < 4 then
        return
    end

    lastTime = globals.RealTime()
    if #party.GetQueuedMatchGroups() == 0 and not party.IsInStandbyQueue() and party.CanQueueForMatchGroup(casualQueue) == true then
        party.QueueUp(casualQueue)
        printc("\nQueued For Caual\n")
    end
end

-- Can't use CreateMove, because it's not called in main menu
callbacks.Unregister("Draw", "Draw_AutoQueue")
callbacks.Register("Draw", "Draw_AutoQueue", Draw_AutoQueue)

engine.Notification("AutoQueue By LNX00\nModdified by vanillaismywaifu")
