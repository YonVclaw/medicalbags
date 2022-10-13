#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = "YonV";
        name = COMPONENT_NAME;
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "ace_medical",
            "ace_medical_ai",
            "ace_medical_blood",
            "ace_medical_damage",
            "ace_medical_engine",
            "ace_medical_feedback",
            "ace_medical_gui",
            "ace_medical_statemachine",
            "ace_medical_status",
            "ace_medical_treatment",
            "ace_medical_vitals",
            "ace_dogtags",
            "kat_main",
            "kat_airway",
            "kat_circulation",
            "cba_settings"
        };
        units[] = {
            QGVAR(Item_FirstAid),
            QGVAR(Item_MedicKit),
            QGVAR(Item_DrugKit),
            QGVAR(Item_Trauma)
        };
        weapons[] = {
            QGVAR(FirstAid),
            QGVAR(MedicKit),
            QGVAR(DrugKit),
            QGVAR(Trauma)
        };
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
