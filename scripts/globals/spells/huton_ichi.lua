-----------------------------------------
-- Spell: Huton: Ichi
-- Deals wind damage to an enemy and lowers its resistance against ice.
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    --doNinjutsuNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus)
    local duration = 15 + caster:getMerit(MERIT_HUTON_EFFECT) -- T1 bonus debuff duration
    local bonusAcc = 0;
    local bonusMab = caster:getMerit(MERIT_HUTON_EFFECT); -- T1 mag atk

    local params = {};

    params.dmg = 28,0.5;

    params.multiplier = caster;

    params.hasMultipleTargetReduction = bonusAcc;

    params.resistBonus = bonusMab;

    dmg = doNinjutsuNuke(caster, target, spell, params);
    handleNinjutsuDebuff(caster,target,spell,30,duration,MOD_ICERES);

    return dmg;
end;