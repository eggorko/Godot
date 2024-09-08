extends Area2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func get_component(name: String) -> Object:
	return get_meta(name)

func has_component(name: String) -> bool:
	return has_meta(name)

func _on_interactable_interacted(object: Object) -> void:
	get_meta("Interaction").action(object)
