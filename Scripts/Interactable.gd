extends Node
class_name Interactable

signal interacted(object: Object)

func _enter_tree() -> void:
	get_parent().set_meta("Interactable", self)

func _exit_tree() -> void:
	get_parent().remove_meta("Interactable")
	
func interact(object: Object) -> void:
	interacted.emit(object)
