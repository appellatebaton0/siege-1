extends Element
class_name LabelElement
## A label that can show DynamicValues

func _init():
	component_id = "LabelElement"


@export var values:Array[DynamicValue]

var me:Label = get_me()

## Use {x} to substitue values, with x being the index in the values array.
@export_multiline var text_format:String = "{0}"

func _ready() -> void:
	for child in get_children():
		if child is DynamicValue:
			values.append(child)
	
	_update_label()

func _process(_delta: float) -> void:
	_update_label()


func _update_label():
	if len(values) < 0:
		return
	
	var real_values:Array[Variant]
	for value in values:
		real_values.append(value.value())
	
	var real_text:String = text_format
	
	for i in range(len(values)):
		real_text = real_text.replace("{" + str(i) + "}", str(real_values[i]))
	
	me.text = real_text
	
