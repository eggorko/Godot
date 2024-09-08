class_name Interactor

extends Area2D

signal remove_from_the_list(interactable: Interactable)

@export var interactable_list: Array[Interactable] = []

func _enter_tree() -> void:
	get_parent().set_meta("Interactor", self)
	
func _exit_tree() -> void:
	get_parent().remove_meta("Interactor")
	
func _ready() -> void:
	self.area_entered.connect(entered)
	self.area_exited.connect(exited)

func interact(object: Object) -> void:
	if !interactable_list.is_empty():
		interactable_list[0].interact(object)	

func entered(area: Area2D) -> void:
	if area.get_parent().has_meta("Interactable"):
		var interactable = area.get_parent().get_meta("Interactable") as Interactable
		if not interactable in interactable_list:
			interactable_list.append(interactable)
					
func exited(area: Area2D) -> void:
	if area.get_parent().has_meta("Interactable"):
		var interactable = area.get_parent().get_meta("Interactable") as Interactable
		if interactable in interactable_list:
			interactable_list.erase(interactable)
