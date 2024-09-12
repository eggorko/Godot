extends Interaction

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../../AudioStreamPlayer2D"

func action(object: Object):
	if !audio_stream_player_2d.playing:
		audio_stream_player_2d.play()
	
func _on_audio_stream_player_2d_finished() -> void:
	#this, this is a bullshit
	get_parent().get_parent().queue_free()
	remove_from_interactor_interactable_list()
