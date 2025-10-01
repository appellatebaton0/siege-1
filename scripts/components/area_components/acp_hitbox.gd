class_name HitboxAreaSubComponent extends AreaSubComponent
## Allows an area to do damage to actors via hurtbox components.

func _init() -> void:
	component_id = "HitboxAreaSub"

signal hurt(target:Actor) ## Emitted when this actor hurts another
signal clicked_on ## Emitted when this actor is clicked on

func hurt_to(target:Actor):
	hurt.emit(target)

func is_valid_area(area:Area2D) -> bool:
	var component = area
	if component is AreaComponent:
		for child in component.get_components():
			if child is HurtboxAreaSubComponent:
				return true
	return false

func on_area_entered(area: Area2D) -> void:
	if is_valid_area(area):
		hurt_to(area.actor)

func on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			clicked_on.emit()
