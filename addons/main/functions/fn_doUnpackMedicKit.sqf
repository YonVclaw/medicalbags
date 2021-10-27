/*
 *	ARMA EXTENDED ENVIRONMENT
 *	\medbag_medical\supplies\functions\fn_doUnpackMedicKit.sqf
 *	by Ojemineh
 *	
 *	unpack medical supplies
 *	
 *	Arguments:
 *	0: unit - <OBJECT>
 *	
 *	Return:
 *	nothing
 *	
 *	Example:
 *	[player] call medbag_medical_supplies_fnc_doUnpackMedicKit;
 *	
 */

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
		playSound "medbag_Medical_MedicKit_Open_1";
	} else {
		private _pitch = random [0.6, 1, 1.4];
		[_unit, "medbag_Medical_MedicKit_Open_1", [], 30, 1000, -1, _pitch] call medbag_fnc_play3dSound;
	};
	
	medbag_MEDICAL_SUPPLIES_UNPACK_SUCCESS = false;
	medbag_MEDICAL_SUPPLIES_UNPACK_FAILURE = false;
	
	[
		2,
		[],
		{ medbag_MEDICAL_SUPPLIES_UNPACK_SUCCESS = true; },
		{ medbag_MEDICAL_SUPPLIES_UNPACK_FAILURE = true; },
		localize "STR_medbag_Medical_Supplies_Progress_MedicKit",
		{true},
		["isNotInside", "isNotSitting", "isNotSwimming"]
	] call ACE_common_fnc_progressBar;
	
	waitUntil {if ((medbag_MEDICAL_SUPPLIES_UNPACK_SUCCESS) || (medbag_MEDICAL_SUPPLIES_UNPACK_FAILURE)) exitWith {true}; false};
	
	if (medbag_MEDICAL_SUPPLIES_UNPACK_SUCCESS) exitWith {
		
		_unit removeItem "medbag_MedicKit";
		
		private _order = [3,1,2];
		private _overflow = false;
		
		 if ((missionnamespace getVariable ["ace_medical_level", 0]) >= 2) then {
            [_unit, "ACE_fieldDressing", 12, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_elasticBandage", 10, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_packingBandage", 10, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_quikClot", 10, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_salineIV_500", 08, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_epinephrine", 10, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_morphine", 10, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_tourniquet", 04, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "kat_Painkiller", 06, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_adenosine", 04, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_atropine", 04, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "kat_chestSeal", 04, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "kat_larynx", 06, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "kat_guedel", 06, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_splint", 08, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "kat_aatKit", 04, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "KAT_Empty_bloodIV_500", 04, _order, _overflow] call TFS_fnc_addItem;
        } else {
            [_unit, "ACE_fieldDressing", 6, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "kat_Painkiller", 2, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_tourniquet", 4, _order, _overflow] call TFS_fnc_addItem;
            [_unit, "ACE_EarPlugs", 1, _order, _overflow] call TFS_fnc_addItem;
        };
		
		
		_unit playActionNow "Stand";
		
	};
	
	if (medbag_MEDICAL_SUPPLIES_UNPACK_FAILURE) exitWith {
		
		[_unit, "medbag_Medical_MedicKit_Open_1"] call medbag_fnc_stop3dSound;
		
		_unit playActionNow "Stand";
		
	};
	
};
