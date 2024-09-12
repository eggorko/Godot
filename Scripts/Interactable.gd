extends Node
class_name Interactable

signal remove_from_the_list(interactable: Interactable)

@export var interaction_nodes: Array[Interaction] = []

func _enter_tree() -> void:
	get_parent().set_meta("Interactable", self)

func _exit_tree() -> void:
	get_parent().remove_meta("Interactable")

func _ready():
	for child in get_children():
		if child is Interaction:
			if not child in interaction_nodes:
				interaction_nodes.append(child)
				child.remove_from_the_list.connect(remove_myself, 4)

func remove_myself():
	remove_from_the_list.emit(self)

func interact(object: Object) -> void:
	for interaction in interaction_nodes:
		interaction.action(object)
