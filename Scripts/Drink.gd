extends Interaction

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../../AudioStreamPlayer2D"
var calling_object: Object = null

func action(object: Object):
	calling_object = object
	audio_stream_player_2d.play()
	
func _on_audio_stream_player_2d_finished() -> void:
	calling_object.get_meta("Interactor").interactable_list.erase(get_parent())
	get_parent().get_parent().queue_free()
