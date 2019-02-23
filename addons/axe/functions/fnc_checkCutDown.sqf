#include "script_component.hpp"

[{
    params [["_tree",objNull]];
    if (isNull _tree) exitWith {};

    private _vectorUp = vectorUp _tree;
    if ((_vectorUp select 2) > 0.5) exitWith {
        [_tree] remoteExec ["hideObjectGlobal",2,false];
    };

    if (!(GVAR(allow_dragging))) exitWith {};

    private _vectorDir = vectorDir _tree;
    private _shape = ((getModelInfo _tree) select 1);

    private _pos = getPosATL _helper;
    private _treePos = getPosATL _tree;
    diag_log format ["TreePos: %1, HelperPos: %2", _treePos, _pos];
    diag_log format ["Dir: %1, Up: %2", _vectorDir, _vectorUp];

    //marking boundingBox
    private _boundingBox = boundingBoxReal _tree;
    _boundingBox params ["_lbfc", "_rtbc"];
    _lbfc params ["_x1", "_x2", "_x3"];
    _rtbc params ["_y1", "_y2", "_y3"];

    private _center = boundingCenter _tree;

    helper_grad_axe = [];
    actionHelper_grad_axe = _helper;
    newTree_grad_axe = _tree;

    {
        private _sphere = "Sign_Sphere10cm_F" createVehicle _x;
        _sphere setObjectMaterial [0, "\a3\data_f\default.rvmat"];
        _sphere setObjectTexture [0, (format ["#(argb,8,8,3)color(%1,%2,%3,1,ca)", random 1, random 1, random 1])];
        helper_grad_axe pushBack _sphere;
    }forEach [
        (_tree modelToWorld _center),
        (_tree modelToWorld _lbfc),
        (_tree modelToWorld _rtbc),
        (_tree modelToWorld [_x1,_x2,_y3]),
        (_tree modelToWorld [_x1,_y2,_x3]),
        (_tree modelToWorld [_y1,_x2,_x3]),
        (_tree modelToWorld [_x1,_y2,_y3]),
        (_tree modelToWorld [_y1,_x2,_y3]),
        (_tree modelToWorld [_y1,_y2,_x3]),
        (_tree modelToWorld [0,0,2])
    ];

    [_tree] remoteExec ["hideObjectGlobal",2,false];
    [_object, false] remoteExec ["enableSimulationGlobal",2,false];

    private _helper = "ace_fastroping_helper" createVehicle [0,0,0];
    private _newTree = createSimpleObject [_shape, _treePos];
    _newTree setVectorDirAndUp [_vectorDir,_vectorUp];
    _newTree setPosATL _treePos;
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
