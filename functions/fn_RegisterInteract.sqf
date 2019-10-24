if (!hasInterface) exitWith {};


    /*
     * Argument:
     * 0: Action name <STRING>
     * 1: Name of the action shown in the menu <STRING>
     * 2: Icon <STRING>
     * 3: Statement <CODE>
     * 4: Condition <CODE>
     * 5: Insert children code <CODE> (Optional)
     * 6: Action parameters <ANY> (Optional)
     * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
     * 8: Distance <NUMBER> (Optional)
     * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
     * 10: Modifier function <CODE> (Optional)
     */

private _loadAction = [
    "GRAD_animalTransport_loadAction",
    "load on vehicle",
    "", // icon
    {
        private _vehicle = [_target] call GRAD_animalTransport_fnc_findSuitableVehicle;
        ["GRAD_animalTransport_loadAnimal", [_vehicle, _target], _vehicle] call CBA_fnc_targetEvent;
    },
    {
        !(isNull ([_target] call GRAD_animalTransport_fnc_findSuitableVehicle))
    }
] call ace_interact_menu_fnc_createAction;

{
    [
        _x,
        0,
        [],
        _loadAction,
        true
    ] call ace_interact_menu_fnc_addActionToClass
} forEach ["Sheep_random_F", "Goat_random_F", "Alsatian_Random_F", "Fin_random_F"];



private _unloadAction = [
    "GRAD_animalTransport_unloadAction",
    "unload animals",
    "", // icon
    {
        ["GRAD_animalTransport_unloadAnimals", [_target], _target] call CBA_fnc_targetEvent;
    },
    {
        (_target getVariable ["GRAD_animalTransport_animals", []]) findIf { !(isNull _x) } != -1;
    }
] call ace_interact_menu_fnc_createAction;

{
    [
        _x,
        0,
        ["ACE_MainActions"],
        _unloadAction,
        true
    ] call ace_interact_menu_fnc_addActionToClass
} forEach ["Car"];
