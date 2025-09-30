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