extends NodeState

@export var player: Player
@export var animted_sprite_2d: AnimatedSprite2D


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass
		
		
func _on_next_transitions() -> void:
	if !animted_sprite_2d.is_playing():
		transition.emit("Idle")


func _on_enter() -> void:
	match player.player_direction:
		Vector2.UP:
			animted_sprite_2d.play("watering_back")
		Vector2.RIGHT:
			animted_sprite_2d.play("watering_right")
		Vector2.DOWN:
			animted_sprite_2d.play("watering_front")
		Vector2.LEFT:
			animted_sprite_2d.play("watering_left")
		_:
			animted_sprite_2d.play("watering_front")
			


func _on_exit() -> void:
	animted_sprite_2d.stop()
