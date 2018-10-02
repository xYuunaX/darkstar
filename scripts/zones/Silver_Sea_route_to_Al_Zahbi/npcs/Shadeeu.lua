-----------------------------------
-- Area: Silver_Sea_route_to_Al_Zahbi
--  NPC: Shadeeu
-- Notes: Tells ship ETA time
-- !pos 0.340 -12.232 -4.120 58
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_route_to_Al_Zahbi/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.ON_WAY_TO_AL_ZAHBI,0,0); -- Earth Time, Vana Hours. Needs a get-time function for boat?
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

