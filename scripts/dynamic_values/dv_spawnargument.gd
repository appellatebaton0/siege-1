class_name DynamicSpawnArgumentValue extends DynamicValue

@export var from:Interface
@export var index := 0

func find_interface(depth:int = 5, with:Node = self) -> Interface:
	
	if depth <= 0:
		return null
	
	var answer:Interface = null
	
	if with is Interface:
		answer = with
	else:
		answer = find_interface(depth - 1, with.get_parent())
	
	return answer

func _ready() -> void:
	if from == null:
		from = find_interface()

func value() -> Variant:
	return from.spawn_arguments[index]
