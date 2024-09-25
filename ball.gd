extends CharacterBody2D
const SPEED = 300.0

var pole
var points1 = 0
var points2 = 0

func _ready() -> void:
	velocity = Vector2(SPEED, SPEED)
	pole = [velocity.x, velocity.y]
	
func _physics_process(delta: float) -> void:
	move_and_slide()
	
	if is_on_floor() or is_on_ceiling():
		velocity.y = - pole[0]
		pole[0] = velocity.y

	if is_on_wall():
		velocity.x = - pole[1]
		pole[1] = velocity.x

	#print("Current Velocity: ", velocity)


func _on_sides_body_entered(body: Node2D) -> void:
	if position.x > get_viewport().size[0]/2:
		for child in get_tree().current_scene.get_children():
			if child.name == 'PlayerLeftPoints':
					points1=points1+1
					child.text = str(points1)
					break
	else: 
		for child in get_tree().current_scene.get_children():
			if child.name == 'PlayerRightPoints':
					points2=points2+1
					child.text = str(points2)
					break
	print(points1,points2)
	#for i in range(100):
		#pole = [-100,0]
	position.x = get_viewport().size[0]/2-100
	position.y = get_viewport().size[1]/2-100
	#pole = [velocity.x, velocity.y]
	
