class CfgWeapons {
	
	class CBA_MiscItem;
	class CBA_MiscItem_ItemInfo;
	class ACE_ItemCore: CBA_MiscItem {};
	
	// MEDICAL SUPPLIES
	
	class medbag_FirstAid: ACE_ItemCore {
		scope = 2;
		author = "$STR_medbag_Medical_Supplies_Author";
		displayName = "$STR_medbag_Item_Medical_FirstAid_DisplayName";
		descriptionShort = "$STR_medbag_Item_Medical_FirstAid_Description";
		editorPreview = "\medbag_medical\supplies\data\previews\firstaid.jpg";
		picture = "\medbag_medical\supplies\data\ui\firstaid_ca.paa";
		model = "\a3\weapons_f\ammo\mag_firstaidkit.p3d";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 10;
		};
	};
	
	class medbag_MedicKit: ACE_ItemCore {
		scope = 2;
		author = "$STR_medbag_Medical_Supplies_Author";
		displayName = "$STR_medbag_Item_Medical_MedicKit_DisplayName";
		descriptionShort = "$STR_medbag_Item_Medical_MedicKit_Description";
		editorPreview = "\medbag_medical\supplies\data\previews\medickit.jpg";
		picture = "\medbag_medical\supplies\data\ui\medickit_ca.paa";
		model = "\a3\props_f_orange\humanitarian\camps\firstaidkit_01_closed_f.p3d";
		icon = "iconObject_1x1";
		mapSize = 0.015;
		class ItemInfo: CBA_MiscItem_ItemInfo {
			mass = 50;
		};
	};
	
};
