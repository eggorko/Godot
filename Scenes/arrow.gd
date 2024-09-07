extends Area2D

var speed = 200
var direction = 1

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var whoosh: AnimatedSprite2D = $Whoosh
@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

var is_facing_right: bool = true

func _ready() -> void:
	timer.wait_time = 5;
	animated_sprite_2d.play()
	whoosh.play()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += speed * direction * delta

func fly(directionn: int) -> void:
	var new_facing_right = directionn > 0
	if new_facing_right != is_facing_right:
		is_facing_right = new_facing_right
		whoosh.position.x = whoosh.position.x * -1
		animated_sprite_2d.flip_h = !is_facing_right
		whoosh.flip_h = is_facing_right
	timer.start()

func _on_timer_timeout() -> void:
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	set_deferred("monitorable", false)
	set_deferred("monitoring", false)
	
	collision_shape_2d.disabled
	animated_sprite_2d.hide()
	whoosh.hide()
	audio_stream_player_2d.play()
	await audio_stream_player_2d.finished
	queue_free()
