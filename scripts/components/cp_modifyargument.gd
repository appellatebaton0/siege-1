class_name ModArgumentComponent extends Component
## Modifies a given spawn argument on a given node.

func _init():
	component_id = "ModProperty"

## The index to modify
@export var index := 0
## The value to set it to
@export var new_value:DynamicValue
## The node to modify
@export var target:DynamicNodeValue

func _ready() -> void:
	for child in get_children():
		if child is DynamicNodeValue and target == null:
			target = child
		elif child is DynamicValue and new_value == null:
			new_value = child

func modify(override_target:Node = null, override_index := -1, override_value:Variant = null):
	var use_target:Node 
	var use_index:int = index
	var use_value:Variant
	
	# Do the overrides if needed.
	if override_value != null:
		use_value = override_value
	elif new_value != null:
		use_value = new_value.value()
	
	if override_target != null:
		use_target = override_target
	elif target != null:
		use_target = target
	
	if override_index != -1:
		use_index = override_index
	
	# If everything's valid, modify the spawn arguments.
	if use_value != null and (use_target is Interface or use_target is Actor):
		use_target.spawn_arguments[use_index] = use_value
