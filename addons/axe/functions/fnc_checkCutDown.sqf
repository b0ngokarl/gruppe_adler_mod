#include "script_component.hpp"

[{
    params [["_tree",objNull], ["_helper",objNull]];
    if (isNull _tree) exitWith {};

    private _vectorUp = vectorUp _tree;
    if ((_vectorUp select 2) > 0.5) exitWith {
        [_tree] remoteExec ["hideObjectGlobal",2,false];
        deleteVehicle _helper;
    };

    if (!(GVAR(allow_dragging)) || {isNull _helper}) exitWith {};

    private _pos = getPosWorld _helper;

    diag_log str(_pos);
    systemChat str(_pos);


    "VR_3DSelector_01_default_F" createVehicle ((getPos _helper) vectorAdd [0,0,2]);
    private _helper2 = "VR_3DSelector_01_exit_F" createVehicle _pos;
    _helper2 setPosWorld _pos;
    _tree attachTo [_helper, [0,0,0]];

    [_helper, true, [0,0,0], 0, false] call ace_dragging_fnc_setDraggable;

    private _action = [
        QGVAR(removeTree),
        "Remove Tree",
        "",
        {
            [_player, _target] call FUNC(removeTree);
        },
        {true},
        {},
        [],
        [0,0,0],
        4
    ] call ace_interact_menu_fnc_createAction;
    [_helper, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;


},_this,2] call CBA_fnc_waitAndExecute;
