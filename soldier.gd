extends CharacterBody2D

# Movement speed
@export var speed: float = 200.0

# AnimationTree parameters
var is_moving: bool = false
var is_attacking: bool = false

# Reference to the AnimationTree and AnimationNodeStateMachine
@onready var animation_tree: AnimationTree = $AnimationTree

# Reference to the Sprite2D to handle flipping
@onready var sprite: Sprite2D = $Sprite2D

func _physics_process(delta: float) -> void:
	var velocity = Vector2.ZERO

	# Handle input
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= 1

	if Input.is_action_just_pressed("attack"):
		attack()
	
	# Set is_moving based on velocity
	is_moving = velocity.length() > 0

	# Move the character
	velocity = velocity.normalized() * speed
   	move_and_slide(velocity)

	# Flip sprite based on direction
	if velocity.x != 0:
		sprite.flip_h = velocity.x < 0

	# Update AnimationTree parameters
	animation_tree.set("parameters/conditions/is_moving", is_moving)
	animation_tree.set("parameters/conditions/attack", is_attacking)
	
func attack():
	if not is_attacking:
		is_attacking = true
