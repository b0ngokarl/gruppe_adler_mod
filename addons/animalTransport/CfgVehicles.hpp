class CfgVehicles {
    class Animal_Base_F;
    class Sheep_random_F: Animal_Base_F {
        class GRAD_AnimalTransport {
            stop = "Sheep_Stop";
            default = "Sheep_Idle_Stop";
            actionPoint[] = {0, 0.35, 0.65};
        };
        ACE_dragging_canCarry = 1;
        ACE_dragging_carryPosition[] = {0, 1, 1};
        ACE_dragging_carryDirection = 90;
    };
    class Goat_Base_F: Animal_Base_F {
        class GRAD_AnimalTransport {
            stop = "Goat_Stop";
            default = "Goat_Idle_Stop";
        };
    };
    class Dog_Base_F: Animal_Base_F {
        class GRAD_AnimalTransport {
            stop = "Dog_Stop";
            default = "Dog_Idle_Stop";
        };
    };
    class Fowl_Base_F: Animal_Base_F {
        class GRAD_AnimalTransport {
            actionPoint[] = {0, 0, 0.25};
        };
    };
    class Rabbit_F: Animal_Base_F {
        class GRAD_AnimalTransport {
            actionPoint[] = {0, 0, 0.1};
        };
    };

    class Van_01_base_F;
    class I_G_Van_01_transport_F: Van_01_base_F {
		class GRAD_AnimalTransport {
            unloadPoint[] = {0, -4, -0.6};
            unloadActionPoint[] = {0, -3.5, -0.4};
            class Sheep_random_F {
                class Spaces {
                    class FrontOuterLeft {
                        offset[] = {-0.7, -1.4, -0.6};
                        cargoIndices[] = {2, 4};
                    };
                    class FrontInnerLeft {
                        offset[] = {-0.25, -1.6, -0.6};
                        cargoIndices[] = {2, 4};
                    };
                    class FrontInnerRight {
                        offset[] = {0.2, -1.4, -0.6};
                        cargoIndices[] = {3, 5};
                    };
                    class FrontOuterRight {
                        offset[] = { 0.65, -1.6, -0.6};
                        cargoIndices[] = {3, 5};
                    };
                    class BackOuterRight {
                        offset[] = { 0.7, -3.0, -0.6};
                        cargoIndices[] = {7, 9,11};
                    };
                    class BackInnerRight {
                        offset[] = { 0.25, -2.8, -0.6};
                        cargoIndices[] = {7, 9,11};
                    };
                    class BackInnerLeft {
                        offset[] = { -0.2, -3.0, -0.6};
                        cargoIndices[] = {6, 8, 10};
                    };
                    class BackOuterLeft {
                        offset[] = { -0.65, -2.8, -0.6};
                        cargoIndices[] = {6, 8, 10};
                    };
                };
            };
        };
	};

    class RHS_Ural_Civ_Base;
    class rhsgref_ins_ural_work_open: RHS_Ural_Civ_Base {
		class GRAD_AnimalTransport {
            unloadPoint[] = {0, -4, -0.2};
            unloadActionPoint[] = {0, -3.2, -0.1};
            class Sheep_random_F {
                class Spaces {
                    class FrontLeft {
                        offset[] = {-0.50, -0.70, -0.20};
                        cargoIndices[] = {13, 3, 5};
                    };
                    class FrontMiddle {
                        offset[] = {-0.05, -0.70, -0.20};
                        cargoIndices[] = {};
                    };
                    class FrontRight {
                        offset[] = {0.50, -0.70, -0.20};
                        cargoIndices[] = {12, 2, 4};
                    };
                    class CenterLeft {
                        offset[] = {-0.50, -2.10, -0.20};
                        cargoIndices[] = {5, 7, 9};
                    };
                    class CenterMiddle {
                        offset[] = {0.00, -2.20, -0.20};
                        cargoIndices[] = {};
                    };
                    class CenterRight {
                        offset[] = {0.5, -2.10, -0.20};
                        cargoIndices[] = {4, 6, 8};
                    };
                    class RearRight {
                        offset[] = {-0.4, -2.60, -0.20};
                        dir = 90;
                        cargoIndices[] = {8, 9};
                    };
                    class RearLeft {
                        offset[] = {0.4, -3.0, -0.20};
                        dir = 270;
                        cargoIndices[] = {10, 11};
                    };
                };
            };
        };
    };
};