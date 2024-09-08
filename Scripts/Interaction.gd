extends Node
class_name Interaction

var interactor: Interactor = null

func _enter_tree() -> void:
	get_parent().set_meta("Interaction", self)

func _exit_tree() -> void:
	get_parent().remove_meta("Interactions")

func action(object: Object) -> void:
	interactor = object.get_meta("Interactor")
	pass

#func remove_from_interactor_interactable_list():
	#interactor.interactable_list.erase(self)
