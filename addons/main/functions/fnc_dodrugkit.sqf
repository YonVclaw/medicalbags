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
        playSound QPATHTOF(data\sounds\medickit_open_1.ogg);
    } else {
        playSound3D [QPATHTOF(data\sounds\medickit_open_1.ogg), _unit, false, getPosASL player, 1, 1, 0]
    };

    MEDBAG_MEDICAL_SUPPLIES_UNPACK_SUCCESS = false;
    MEDBAG_MEDICAL_SUPPLIES_UNPACK_FAILURE = false;
    
    [
        2,
        [],
        { MEDBAG_MEDICAL_SUPPLIES_UNPACK_SUCCESS = true; },
        { MEDBAG_MEDICAL_SUPPLIES_UNPACK_FAILURE = true; },
        localize "Unpack Drug Kit....",

        {true},
        ["isNotInside", "isNotSitting", "isNotSwimming"]
    ] call ACE_common_fnc_progressBar;
    
    waitUntil {if ((MEDBAG_MEDICAL_SUPPLIES_UNPACK_SUCCESS) || (MEDBAG_MEDICAL_SUPPLIES_UNPACK_FAILURE)) exitWith {true}; false};
    
    if (MEDBAG_MEDICAL_SUPPLIES_UNPACK_SUCCESS) exitWith {
        
        _unit removeItem QGVAR(DrugKit);
        
        private _order = [3,1,2];
        private _overflow = false;
        
        [_unit, "kat_TXA", 10, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_amiodarone", 10, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_atropine", 10, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_lidocaine", 10, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_naloxone", 10, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_nitroglycerin", 10, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_norepinephrine", 10, _order, _overflow] call FUNC(addItem);
        [_unit, "kat_phenylephrine", 10, _order, _overflow] call FUNC(addItem);
        [_unit, "ACE_epinephrine", 10, _order, _overflow] call FUNC(addItem);
        [_unit, "ACE_morphine", 16, _order, _overflow] call FUNC(addItem);
        [_unit, "ACE_adenosine", 8, _order, _overflow] call FUNC(addItem);
    };    
};
