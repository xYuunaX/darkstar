-----------------------------------
-- Area: Dynamis Qufim
--  MOB: Nightmare Tiger
-----------------------------------
mixins = {require("scripts/mixins/dynamis_dreamland")}
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("dynamis_currency", 1449)
end

function onMobDeath(mob, player, isKiller)
end
