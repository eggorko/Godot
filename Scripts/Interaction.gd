extends Node
class_name Interaction

signal remove_from_the_list

func _enter_tree() -> void:
	get_parent().set_meta("Interaction", self)

func _exit_tree() -> void:
	get_parent().remove_meta("Interactions")

func action(object: Object) -> void:
	pass

func remove_from_interactor_interactable_list():
	remove_from_the_list.emit()
