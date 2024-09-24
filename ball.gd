extends CharacterBody2D

# Constants
const SPEED = 500

# Velocity variable
#var velocity = Vector2()

func _ready() -> void:
	rotation = randi()*360


func _process(delta: float) -> void:
	# Set velocity based on the current rotation
	velocity = Vector2(SPEED, 0).rotated(rotation)

	# Move the character and detect collision
	var collision = move_and_collide(velocity * delta)

	if collision && collision.get_collider().to_string():
		print(collision.get_collider())
		velocity = velocity.bounce(collision.get_normal())
		rotation = velocity.angle()
		move_and_collide(velocity)


func _on_sides_area_entered(area: Area2D) -> void:
	position.x = 100
	position.y = 100
	
