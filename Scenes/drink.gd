extends Interaction

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"

func action(object: Object):
	audio_stream_player_2d.play()

func _on_audio_stream_player_2d_finished() -> void:
	get_parent().queue_free()
