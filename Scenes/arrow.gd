extends Area2D

var speed = 200
var direction = 1

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var whoosh: AnimatedSprite2D = $Whoosh

@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.wait_time = 5;
	animated_sprite_2d.play()
	whoosh.play()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += speed * direction * delta

func fly(flip: bool) -> void:
	animated_sprite_2d.flip_h = flip
	whoosh.flip_h = flip;
	timer.start()

func _on_timer_timeout() -> void:
	queue_free()
