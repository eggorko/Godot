extends Area2D
class_name Interactor

signal got_interactable(interactable: Interactable)

func _enter_tree() -> void:
	get_parent().set_meta("Interactor", self)
	
func _exit_tree() -> void:
	get_parent().remove_meta("Interactor")
	
func _ready() -> void:
	self.area_entered.connect(entered)
	self.area_exited.connect(exited)


func entered(area: Area2D) -> void:
	if area.get_parent().has_meta("Interactable"):
		got_interactable.emit(area.get_parent().get_meta("Interactable"))
		
func exited(area: Area2D) -> void:
	if area.get_parent().has_meta("Interactable"):
		got_interactable.emit(null)
