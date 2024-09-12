class_name Interactor

extends Area2D

signal current_interactable(interactable: Interactable)

@export var interactable_list: Array[Interactable] = []
@export var current_interactable_index: int = 0

func _enter_tree() -> void:
	get_parent().set_meta("Interactor", self)
	
func _exit_tree() -> void:
	get_parent().remove_meta("Interactor")
	
func _ready() -> void:
	self.area_entered.connect(entered)
	self.area_exited.connect(exited)

func interact(object: Object, index: int = 0) -> void:
	if !interactable_list.is_empty():
		if current_interactable_index != 0:
			interactable_list[current_interactable_index].interact(object)	
		else:
			interactable_list[index].interact(object)	
					 
func next_interactable():
	if current_interactable_index < interactable_list.size() - 1:
		current_interactable_index += 1
		current_interactable.emit(interactable_list[current_interactable_index])
		#print(current_interactable_index)
		
func previous_interactable():
	if current_interactable_index > 0:
		current_interactable_index -= 1
		current_interactable.emit(interactable_list[current_interactable_index])
		#print(current_interactable_index)

func reset_interactable():
	if interactable_list.size() > 0:
		current_interactable_index = 0
		
func entered(area: Area2D) -> void:
	if area.get_parent().has_meta("Interactable"):
		var interactable = area.get_parent().get_meta("Interactable") as Interactable
		if not interactable in interactable_list:
			interactable_list.append(interactable)
			if !interactable.remove_from_the_list.is_connected(remove_from_the_list):
				interactable.remove_from_the_list.connect(remove_from_the_list, 4)

func exited(area: Area2D) -> void:
	if area.get_parent().has_meta("Interactable"):
		var interactable = area.get_parent().get_meta("Interactable") as Interactable
		remove_from_the_list(interactable)

func remove_from_the_list(interactable: Interactable):
	if interactable in interactable_list:
		reset_interactable()
		interactable_list.erase(interactable)
