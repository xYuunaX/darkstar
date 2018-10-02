-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--  MOB: Myxomycete
-- Note: PH for Noble Mold
-----------------------------------
local ID = require("scripts/zones/The_Sanctuary_of_ZiTah/IDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/weather");

function onMobRoam(mob)
    local weather = mob:getWeather();
    if (weather == dsp.weather.RAIN or weather == dsp.weather.SQUALL) then
        if (phOnDespawn(mob,ID.mob.NOBLE_MOLD_PH,100,math.random(43200, 57600),true)) then -- 12 to 16 hours
            local p = mob:getPos();
            GetMobByID(ID.mob.NOBLE_MOLD):setSpawn(p.x,p.y,p.z,p.rot);
            DespawnMob(mob:getID());
        end
    end
end;

function onMobDeath(mob, player, isKiller)
    checkRegime(player, mob, 115, 1);
    checkRegime(player, mob, 116, 2);
end;

function onMobDespawn(mob)
end;
