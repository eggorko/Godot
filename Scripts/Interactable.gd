extends Node
class_name Interactable

@export var interaction_nodes: Array[Interaction] = []

func _enter_tree() -> void:
	get_parent().set_meta("Interactable", self)

func _exit_tree() -> void:
	get_parent().remove_meta("Interactable")

func _ready():
	for child in get_children():
		if child is Interaction:
			interaction_nodes.append(child)
	
func interact(object: Object) -> void:
	for interaction in interaction_nodes:
		interaction.action(object)
