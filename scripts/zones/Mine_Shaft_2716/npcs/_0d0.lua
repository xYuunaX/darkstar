-----------------------------------
-- Area: Mine_Shaft_2716
-- NPC:  Shaft entrance
-----------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/missions");

function onTrade(player,npc,trade)
    if (player:getCurrentMission(COP) == dsp.mission.id.cop.THREE_PATHS and ( player:getVar("COP_Louverance_s_Path") == 7 or player:getVar("COP_Louverance_s_Path") == 8 )) then
        if (trade:getItemCount() == 1 and trade:hasItemQty(1684,1)) then            
            player:startEvent(3);
        end
    else
        TradeBCNM(player,npc,trade);
    end
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == dsp.mission.id.cop.FIRE_IN_THE_EYES_OF_MEN and player:getVar("PromathiaStatus")==0) then
        player:startEvent(4);
    else
        EventTriggerBCNM(player,npc);
    end
end;

function onEventUpdate(player,csid,option,extras)
    EventUpdateBCNM(player,csid,option,extras);
end;

function onEventFinish(player,csid,option)
    if csid == 3 then
        player:setVar("COP_Louverance_s_Path",9);
        player:tradeComplete();
    elseif csid == 4 then
        player:setVar("PromathiaStatus",1);
    else
        EventFinishBCNM(player,csid,option);
    end
end;
