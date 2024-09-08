extends Interaction

@onready var animated_sprite_2d: AnimatedSprite2D = $"../../AnimatedSprite2D"
@onready var audio_open: AudioStreamPlayer2D = $"../../AudioOpen"
@onready var audio_close: AudioStreamPlayer2D = $"../../AudioClose"

var open = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

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
