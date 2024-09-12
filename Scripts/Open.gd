extends Interaction

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var audio_open: AudioStreamPlayer2D = $"../../AudioOpen"
@onready var audio_close: AudioStreamPlayer2D = $"../../AudioClose"

var open = false;

func action(object: Object) -> void:
	open = !open
	if open: 
		audio_open.play()
		animated_sprite_2d.play("open") 
	else:
		audio_close.play()
		animated_sprite_2d.play("open", -1.0, true) 

func _on_animated_sprite_2d_animation_finished() -> void:
	if open == false and animated_sprite_2d.name == "open":
		animated_sprite_2d.play("default")
