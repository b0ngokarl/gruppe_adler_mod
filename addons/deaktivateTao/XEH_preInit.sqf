#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

[
	QGVAR(deactivateTAO), 
	"CHECKBOX", 
	[
		"Deactivate", 
		"Deactivates TAO Folding map and displays a message on use."
	], 
	"Deactivate Tao", 
	false
] call CBA_Settings_fnc_init;

ADDON = true;
