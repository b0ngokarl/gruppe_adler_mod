#include "script_component.hpp"

if (isServer) then {
    [QGVAR(checkUniform), {_this call FUNC(checkUniformOnServer);}] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
    [QGVAR(resetUniform), {_this call FUNC(resetUniform);}] call CBA_fnc_addEventHandler;
};