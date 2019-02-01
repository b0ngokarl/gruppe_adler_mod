#include "script_component.hpp"

[{
    params [["_tree",objNull]];
    if (isNull _tree) exitWith {};

    private _vectorUp = vectorUp _tree;
    if ((_vectorUp select 2) > 0.5) exitWith {
        [_tree] remoteExec ["hideObjectGlobal",2,false];
    };

    if !(GVAR(allow_dragging)) exitWith {};

    private _pos = getPosWorld _tree;
    private _vectorDir = vectorDir _tree;
    private _shape = getModelInfo _tree;

    [_tree] remoteExec ["hideObjectGlobal",2,false];
    [_object, false] remoteExec ["enableSimulationGlobal",2,false];

    private _newTree = createSimpleObject [_shape, _pos];
    _newTree setPosWorld _pos;
    _newTree setVectorDirAndUp [_dir,_up];

    private _helper = "ace_fastroping_helper" createVehicle [0,0,0];
    _helper setPosWorld _pos;
    _newTree attachTo [_helper, [0,0,0]];

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
