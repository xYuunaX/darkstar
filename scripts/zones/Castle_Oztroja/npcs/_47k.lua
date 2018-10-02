-----------------------------------
-- Area: Castle Oztroja
--  NPC: _47k (Torch Stand)
-- Notes: Opens door _472 near password #1
-- !pos -57.412 -1.864 -30.627 151
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onTrigger(player,npc)

    local DoorID = npc:getID() - 3;
    local DoorA = GetNPCByID(DoorID):getAnimation();
    local TorchStandA = npc:getAnimation();
    local Torch1 = npc:getID();
    local Torch2 = npc:getID() + 1;

    if (DoorA == 9 and TorchStandA == 9) then
        player:startEvent(10);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    local Torch1 = GetNPCByID(17396168):getID();
    local Torch2 = GetNPCByID(Torch1):getID() + 1;
    local DoorID = GetNPCByID(Torch1):getID() - 3;

    if (option == 1) then
        GetNPCByID(Torch1):openDoor(10); -- Torch Lighting
        GetNPCByID(Torch2):openDoor(10); -- Torch Lighting
        GetNPCByID(DoorID):openDoor(6);
    end

end;

    -- printf("RESULT: %u",option);