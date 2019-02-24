#include "script_component.hpp"

[{
    params [["_tree",objNull]];
    if (isNull _tree) exitWith {};
    _tree setVariable [QGVAR(chopped), true, true];
    private _vectorUp = vectorUp _tree;
    if ((_vectorUp select 2) > 0.5) exitWith {
        [_tree] remoteExec ["hideObjectGlobal",2,false];
    };

    if (!(GVAR(allow_dragging))) exitWith {};

    private _vectorDir = vectorDir _tree;
    private _shape = ((getModelInfo _tree) select 1);

    private _treePos = getPosASL _tree;

    [_tree] remoteExec ["hideObjectGlobal",2,false];
    [_tree, false] remoteExec ["enableSimulationGlobal",2,false];

    //marking boundingBox
    private _boundingBox = boundingBoxReal _tree;
    _boundingBox params ["_lbfc", "_rtbc"];
    _lbfc params ["_x1", "_x2", "_x3"];
    _rtbc params ["_y1", "_y2", "_y3"];

    private _center = boundingCenter _tree;

    diag_log format ["DistanceCorner: %1, DistanceLength: %2", (_lbfc distance _rtbc), [0,0,_x3] distance [0,0,_y3]];

    private _helper = "Sign_Sphere10cm_F" createVehicle _treePos;
    private _newTree = createSimpleObject [_shape, [0,0,0]];
    _helper setVectorDirAndUp [_vectorDir,_vectorUp];
    _helper setPosASL _treePos;
    _newTree attachTo [_helper, [0,0,0]];
    actionHelper_grad_axe = _helper;
    newTree_grad_axe = _newTree;

    diag_log format ["TreePos: %1, HelperPos: %2, NewTreePos: %3", _treePos, (getPosASL _helper), (getPosASL _newTree)];
    diag_log format ["Dir: %1, Up: %2", _vectorDir, _vectorUp];

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
