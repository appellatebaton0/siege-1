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
- EM_DirectoryLoad -> Loads the contents of a directory to its parent, or loads a single scene to its parent for each file in a directory (for level buttons)
- EM_Animator -> Allows for any signal to be tied into playing an animation from an AnimationPlayer (like a button press).
