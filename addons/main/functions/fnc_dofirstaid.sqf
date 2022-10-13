#include "..\script_component.hpp"    


private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// -------------------------------------------------------------------------------------------------

if (isNull _unit) exitWith {};

// -------------------------------------------------------------------------------------------------

[_unit] spawn {
    
    params ["_unit"];
    
    _unit playAction "Gear";
    
    if (vehicle _unit != _unit) then {
        playSound QPATHTOF(data\sounds\firstaid_open_1.ogg);
    } else {
        playSound3D [QPATHTOF(data\sounds\firstaid_open_1.ogg), _unit, false, getPosASL player, 1, 1, 0]
    };
    
    MEDBAG_MEDICAL_SUPPLIES_UNPACK_SUCCESS = false;
    MEDBAG_MEDICAL_SUPPLIES_UNPACK_FAILURE = false;
    
    [
        2,
        [],
        { MEDBAG_MEDICAL_SUPPLIES_UNPACK_SUCCESS = true; },
        { MEDBAG_MEDICAL_SUPPLIES_UNPACK_FAILURE = true; },
        localize "Unpack Boo Boo Bag....",
        {true},
        ["isNotInside", "isNotSitting", "isNotSwimming"]
    ] call ACE_common_fnc_progressBar;
    
    waitUntil {if ((MEDBAG_MEDICAL_SUPPLIES_UNPACK_SUCCESS) || (MEDBAG_MEDICAL_SUPPLIES_UNPACK_FAILURE)) exitWith {true}; false};
    
    if (MEDBAG_MEDICAL_SUPPLIES_UNPACK_SUCCESS) exitWith {
        
        _unit removeItem QGVAR(FirstAid);
        
        private _order = [1,3,2];
        private _overflow = false;
        
        [_unit, "ACE_fieldDressing", 8, _order, _overflow] call FUNC(addItem);
        [_unit, "ACE_quikClot", 8, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_Painkiller", 1, _order, _overflow] call FUNC(addItem);
        [_unit, "ACE_tourniquet", 4, _order, _overflow] call FUNC(addItem);
        [_unit, "ACE_EarPlugs", 1, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_chestSeal", 1, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_aatKit", 1, _order, _overflow] call FUNC(addItem);
        [_unit, "ACE_salineIV_500", 1, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_larynx", 1, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_guedel", 1, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_TXA", 1, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_IV_16", 1, _order, _overflow] call FUNC(addItem);
        [_unit, "ACE_splint", 2, _order, _overflow] call FUNC(addItem);
    };
};
