extends Node
class_name Interaction

func _enter_tree() -> void:
	get_parent().set_meta("Interaction", self)

func _exit_tree() -> void:
	get_parent().remove_meta("Interactions")

func action(object: Object) -> void:
	pass
	
