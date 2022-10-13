#include "..\script_component.hpp"
// -------------------------------------------------------------------------------------------------

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};

// -------------------------------------------------------------------------------------------------

[_unit] spawn {

    params ["_unit"];

    _unit playAction "Gear";

    if (vehicle _unit != _unit) then {
        playSound QPATHTOF(data\sounds\medickit_open_1.ogg);
    } else {
        playSound3D [QPATHTOF(data\sounds\medickit_open_1.ogg), _unit, false, getPosASL player, 1, 1, 0]
    };

    MEDBAG_MEDICAL_SUPPLIES_UNPACK_SUCCESS = false;
    MEDBAG_MEDICAL_SUPPLIES_UNPACK_FAILURE = false;

    [
        2,
        [], { MEDBAG_MEDICAL_SUPPLIES_UNPACK_SUCCESS = true; }, { MEDBAG_MEDICAL_SUPPLIES_UNPACK_FAILURE = true; },
        localize "Unpack Trauma Kit....",
 {true},
        ["isNotInside", "isNotSitting", "isNotSwimming"]
    ] call ACE_common_fnc_progressBar;

    waitUntil {if ((MEDBAG_MEDICAL_SUPPLIES_UNPACK_SUCCESS) || (MEDBAG_MEDICAL_SUPPLIES_UNPACK_FAILURE)) exitWith {true}; false};

    if (MEDBAG_MEDICAL_SUPPLIES_UNPACK_SUCCESS) exitWith {

        _unit removeItem QGVAR(Trauma);

        private _order = [3,2,1];
        private _overflow = true;

        [_unit, "ACE_fieldDressing", 18, _order, _overflow] call FUNC(addItem);
        [_unit, "ACE_elasticBandage", 14, _order, _overflow] call FUNC(addItem);
        [_unit, "ACE_packingBandage", 14, _order, _overflow] call FUNC(addItem);
        [_unit, "ACE_quikClot", 14, _order, _overflow] call FUNC(addItem);
        [_unit, "ACE_salineIV_500", 08, _order, _overflow] call FUNC(addItem);
        [_unit, "ACE_epinephrine", 10, _order, _overflow] call FUNC(addItem);
        [_unit, "ACE_morphine", 10, _order, _overflow] call FUNC(addItem);
        [_unit, "ACE_tourniquet", 08, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_Painkiller", 06, _order, _overflow] call FUNC(addItem);
        [_unit, "ACE_adenosine", 04, _order, _overflow] call FUNC(addItem);
        [_unit, "ACE_atropine", 04, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_chestSeal", 04, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_larynx", 06, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_guedel", 06, _order, _overflow] call FUNC(addItem);
        [_unit, "ACE_splint", 08, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_aatKit", 04, _order, _overflow] call FUNC(addItem);
        [_unit, "KAT_Empty_bloodIV_500", 04, _order, _overflow] call FUNC(addItem);
        [_unit, "ACE_fieldDressing", 06, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_Painkiller", 02, _order, _overflow] call FUNC(addItem);
        [_unit, "ACE_tourniquet", 04, _order, _overflow] call FUNC(addItem);
        [_unit, "ACE_EarPlugs", 01, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_accuvac", 01, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_X_AED", 01, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_stethoscope", 01, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_Pulseoximeter", 01, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_IO_FAST", 06, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_IV_16", 06, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_TXA", 06, _order, _overflow] call FUNC(addItem);

        _unit playActionNow "Stand";
    };
};
