extends AnimatedSprite2D


func _on_animation_finished() -> void:
	queue_free()
	
func play_jump_effect(positon: Vector2): 
	self.global_position = positon
	self.offset.y = -23
	self.scale.x = .35
	self.scale.y = .35
	self.play("Jump")

func play_land_effect(positon: Vector2): 
	self.global_position = positon
	self.offset.y = -2
	self.scale.x = .45
	self.scale.y = .45
	self.play("Land")
