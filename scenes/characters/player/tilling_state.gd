extends NodeState

@export var player: Player
@export var animted_sprite_2d: AnimatedSprite2D
@export var hit_component_collision_shape: CollisionShape2D

func _ready() -> void:
	hit_component_collision_shape.disabled = true
	hit_component_collision_shape.position = Vector2(0, 0)

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
			animted_sprite_2d.play("tilling_back")
			hit_component_collision_shape.position = Vector2(0, -20)
		Vector2.RIGHT:
			animted_sprite_2d.play("tilling_right")
			hit_component_collision_shape.position = Vector2(9, 0)
		Vector2.DOWN:
			animted_sprite_2d.play("tilling_front")
			hit_component_collision_shape.position = Vector2(0, 3)
		Vector2.LEFT:
			animted_sprite_2d.play("tilling_left")
			hit_component_collision_shape.position = Vector2(-9, 0)
		_:
			animted_sprite_2d.play("tilling_front")
			hit_component_collision_shape.position = Vector2(0, 3)
			
	hit_component_collision_shape.disabled = false

func _on_exit() -> void:
	animted_sprite_2d.stop()
	hit_component_collision_shape.disabled = true
