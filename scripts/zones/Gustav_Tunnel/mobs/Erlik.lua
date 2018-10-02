----------------------------------
-- Area: Gustav Tunnel
--  MOB: Erlik
-- Note: Place holder Baobhan Sith
-----------------------------------
local ID = require("scripts/zones/Gustav_Tunnel/IDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,767,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.BAOBHAN_SITH_PH,5,math.random(14400,28800)); -- 4 to 8 hours
end;
