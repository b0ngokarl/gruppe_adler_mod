#include "script_component.hpp"

params [
    ["_vehicle", objNull, [objNull]],
    ["_animal", objNull, [objNull]]
];

private _unloadPoint = [
    [_vehicle] call FUNC(getCustomConfig),
    "unloadPoint",
    [0, 0, 0]
] call BIS_fnc_returnConfigEntry;

_animal attachTo [_vehicle, _unloadPoint];
detach _animal;
_animal setVariable ["ace_dragging_canCarry", true, true];
["ace_common_setDir", [_animal, (getDir _vehicle) - 180], _animal] call CBA_fnc_targetEvent;
