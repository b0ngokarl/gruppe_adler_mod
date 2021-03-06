#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = "$STR_grad_Author";
        name = QUOTE(ADDON);
        url = "$STR_grad_URL";
        requiredVersion = 1.0;
        requiredAddons[] = {"grad_main", "A3_Data_F", "A3_Weapons_F"};
        units[] = {};
        weapons[] = {};
        VERSION_CONFIG;
        authors[] = {
            "Fusselwurm <fusselwurm@gmail.com>",
            "Willard"
        };
    };
};

#include "cfgAmmo.hpp"
