class_name AddComponent extends Component
## Adds a given node to another via a signal.

func _init():
	component_id = "Delete"

## The node to add to the target.
@export var scene:DynamicValue
## The node the scene will be added to.
@export var target:DynamicNodeValue

func _ready() -> void:
	for child in get_children():
		if child is DynamicNodeValue and target == null:
			target = child
		elif child is DynamicValue and scene == null:
			scene = child

func add():
	var node := target.value()
	
	var new = scene.value().instantiate()
	
	node.add_child(new)
