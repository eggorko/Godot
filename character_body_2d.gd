extends CharacterBody2D

@export var speed: float = 10.0

@onready var sprite_2d: Sprite2D = %Sprite2D

func _physics_process(delta: float) -> void:

	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		print(velocity)
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		print(velocity)
		
	velocity = velocity.normalized() * speed
	
	move_and_slide()

	if velocity.x != 0:
		sprite_2d.flip_h = velocity.x < 0
		
