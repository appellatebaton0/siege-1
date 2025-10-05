# siege-1
The game I'm making for Hackclub's Siege - Week 1
Spare Change

A game about fighting off faulty appliances with money, while trying to stay in-budget

And, as always, more building to the framework!
## Here's a list of things added for this game thus far;
### General
- DynamicFloatValues & DynamicVector2Values -> DVs for their respective types.
    - DF_Cast -> Casts a DV to a float
    - DF_Manual -> A static set float
    - DV2_Manual -> A static set Vector2
- DC_Cast -> Casts a DV to a bool
- DynamicScenes -> DVs for PackedScenes
    - DS_Random -> Picks a random scene from an array of options
- CP_Look -> A Node2D CP that looks at at a DV_Node.
- CP_MotionSub -> Changed MotionStates to be extended from this, provides functionality to a CP_Motion (used to make always-on functionality)
	- MS_BounceFollow -> Chase a node while constantly jumping
	- MCP_Knockback -> Provides an in to *take* knockback. There's another node, ACP_Knockback, that *does* knockback to anything it hits. Different use cases.
- EM_AutoColumn -> Automatically sets the columns of a GridContainer to be about the same as the rows
- CP_DirectoryLoad -> Loads the contents of a directory to its parent, or loads a single scene to its parent for each file in a directory (for level buttons)
- EM_Animator -> Allows for any signal to be tied into playing an animation from an AnimationPlayer (like a button press).
- CP_Add -> Adds a node as a child of another when called.
- CP_Delete -> Frees a node when called
- CP_ModifyArgument -> Modifies an actor's spawn arguments
- DV_SpawnArgument -> Pulls an actor's spawn arguments.
- DS_Cast -> Returns a child DV if it's a scene.
- CP_Health -> Hosts a float locked above zero, for being damaged and knowing when to die
- CP_Damage -> Childed to a hitbox, duplicates self to the target on a hit to do damage.
- DCP_Single -> Does a manual/dynamic float of damage to the target once.
- DC_Inequality -> Returns whether a float makes an inequality true
- DV2_Cast -> Casts a value to a Vector2
- DF_Vector -> Returns the X or Y value of a Vector2
- DF_Modify -> Modifies a float via an operator
- DV_Int -> A DV that is always an integer
	- DI_Cast -> Casts a value to an integer
- MS_Follow -> Follows another node via lerp/linear. Good for camera.
