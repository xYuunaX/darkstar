-----------------------------------
--
-- Zone: Korroloka_Tunnel (173)
--
-----------------------------------
local ID = require("scripts/zones/Korroloka_Tunnel/IDs");
require("scripts/globals/conquest");
-----------------------------------

function onInitialize(zone)
    -- Waterfalls (RegionID, X, Radius, Z)
    zone:registerRegion(1,  -87, 4, -105, 0, 0, 0); -- Left pool
    zone:registerRegion(2, -101, 7, -114, 0, 0, 0); -- Center Pool
    zone:registerRegion(3, -112, 3, -103, 0, 0, 0); -- Right Pool
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-500,-21.824,0.358,60);
    end
    return cs;
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onRegionEnter(player,region)
    local pooltime = (os.time() - player:getVar("POOL_TIME"));

    if (player:getVar("BathedInScent") == 1) then  -- pollen scent from touching all 3 Blue Rafflesias in Yuhtunga
        switch (region:GetRegionID()): caseof
        {
            [1] = function (x)  -- Left Pool
                player:messageSpecial(ID.text.ENTERED_SPRING);
                player:setLocalVar("POOL_TIME", os.time());
            end,
            [2] = function (x)  -- Center Pool
                player:messageSpecial(ID.text.ENTERED_SPRING);
                player:setLocalVar("POOL_TIME", os.time());
            end,
            [3] = function (x)  -- Right pool
                player:messageSpecial(ID.text.ENTERED_SPRING);
                player:setLocalVar("POOL_TIME", os.time());
            end,
        }
    end
end;

function onRegionLeave(player,region)
    local RegionID = region:GetRegionID();
    local pooltime = os.time() - player:getLocalVar("POOL_TIME");

    if (RegionID <= 3 and player:getVar("BathedInScent") == 1) then
        if (pooltime >= 300) then
            player:messageSpecial(ID.text.LEFT_SPRING_CLEAN);
            player:setLocalVar("POOL_TIME", 0);
            player:setVar("BathedInScent", 0);
        else
            player:messageSpecial(ID.text.LEFT_SPRING_EARLY);
            player:setLocalVar("POOL_TIME", 0);
        end
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
