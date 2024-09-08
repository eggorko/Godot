extends AnimatedSprite2D

@onready var collision_shape_2d: CollisionShape2D = $"../CollisionShape2D"
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"
@onready var area_2d: Area2D = $Area2D
# Called when the node enters the scene tree for the first time.
var TARGET_LAYER = 1 << 1

func _ready() -> void:
	print(get_parent().collision_layer)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_area_entered(area: Area2D) -> void:
	#print("Area Entered: " + str(area.collision_layer & TARGET_LAYER))
	if area.collision_layer & TARGET_LAYER != 0:
		get_parent().collision_layer &= ~1
		get_parent().collision_mask &= ~1
		area_2d.set_deferred("monitoring", false)
		area_2d.set_deferred("monitorable", false)
		if !audio_stream_player_2d.playing:
			audio_stream_player_2d.play()
		self.play("destruction")
		await self.animation_finished
		audio_stream_player_2d.stop()
		get_parent().queue_free()
