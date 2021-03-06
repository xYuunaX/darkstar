-----------------------------------
-- Area: Monarch Linn
-- Name: Ancient Vows
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/battlefield")
require("scripts/globals/missions");

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBattlefieldRegister(player,battlefield)

end;
function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBattlefieldEnter(player,battlefield)

end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function onBattlefieldLeave(player,battlefield,leavecode)
    -- printf("leavecode: %u",leavecode);
    
    if leavecode == dsp.battlefield.leaveCode.WON then -- play end CS. Need time and battle id for record keeping + storage
    
        local name, clearTime, partySize = battlefield:getRecord()
        if (player:getCurrentMission(COP) == dsp.mission.id.cop.ANCIENT_VOWS and player:getVar("PromathiaStatus") == 2) then
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 0, battlefield:getLocalVar("[cs]bit"), 0)
        else
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 0, battlefield:getLocalVar("[cs]bit"), 1)
        end
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002);
    end
    
end;

function onEventUpdate(player,csid,option)
-- print("bc update csid "..csid.." and option "..option);
end;
    
function onEventFinish(player,csid,option)

    if (csid == 32001) then
        player:addExp(1000);
        player:addTitle(dsp.title.TAVNAZIAN_TRAVELER);
        if (player:getCurrentMission(COP) == dsp.mission.id.cop.ANCIENT_VOWS and player:getVar("PromathiaStatus") == 2) then
            player:setVar("VowsDone",1);
            player:setVar("PromathiaStatus",0);
            player:completeMission(COP,dsp.mission.id.cop.ANCIENT_VOWS);
            player:addMission(COP,dsp.mission.id.cop.THE_CALL_OF_THE_WYRMKING);
            player:setPos(694,-5.5,-619,74,107); -- To South Gustaberg
        end
    end
end;