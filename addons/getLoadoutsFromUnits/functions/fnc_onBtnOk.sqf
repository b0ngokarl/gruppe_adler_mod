#include "script_component.hpp"
#include "..\IDCs.hpp"
systemChat "Wörked";
// called upon display load
// PARAMS:
// 	0: Display <DISPLAY>

params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
disableSerialization;

private _display = ctrlParent _control;
private _structuredText = [];
private _tab = "    ";
private _doubleTab = _tab + _tab;

GVAR(units) params ["_units", "_types"];
diag_log format ["Units: %1, Types: %2", _units, _types];
{
    private _listbox = _display displayCtrl _x;
    diag_log format ["ID: %1, Unit: %2", _forEachIndex, (_listbox lbData (lbCurSel _listbox)) select 0];
    [(_listbox lbData (lbCurSel _listbox)), _forEachIndex] call FUNC(addMedicItems);
}forEach [IDC_CFR, IDC_SQL, IDC_PTL];

if (cbChecked (_display displayCtrl IDC_ITEMS)) then {
    {

    }forEach _units;
};

_structuredText pushBack format ["class %1 {", ctrlText (_display displayCtrl IDC_NAME)];
_structuredText pushBack (_tab + "class AllUnits {");
_structuredText append ([
    "uniform",
    "backpack",
    "vest",
    "primaryWeapon",
    "primaryWeaponMagazine",
    "primaryWeaponMuzzle",
    "primaryWeaponOptics",
    "primaryWeaponPointer",
    "primaryWeaponUnderbarrel",
    "primaryWeaponUnderbarrelMagazine",
    "secondaryWeapon",
    "secondaryWeaponMagazine",
    "secondaryWeaponMuzzle",
    "secondaryWeaponOptics",
    "secondaryWeaponPointer",
    "secondaryWeaponUnderbarrel",
    "secondaryWeaponUnderbarrelMagazine",
    "handgunWeapon",
    "handgunWeaponMagazine",
    "handgunWeaponMuzzle",
    "handgunWeaponOptics",
    "handgunWeaponPointer",
    "handgunWeaponUnderbarrel",
    "handgunWeaponUnderbarrelMagazine",
    "headgear",
    "goggles",
    "nvgoggles",
    "binoculars",
    "map",
    "gps",
    "compass",
    "watch",
    "radio"
] apply {_doubleTab + _x + " = """";"});
_structuredText pushBack (_tab + "};");
_structuredText pushBack (_tab + "class Type {");

{
    _structuredText append ([_x, (_types select _forEachIndex), _tab] call FUNC(getLoadoutAndFormat));
}forEach _units;

_structuredText pushBack (_tab + "};");
_structuredText pushBack "};";

GVAR(units) = nil;
copyToClipboard (_structuredText joinString (toString [13,10]));
