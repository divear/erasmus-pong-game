extends CharacterBody2D
var SPEED = 300.0
#var login = preload("res://control.tscn").instantiate()


var pole
var points1 = 0
var points2 = 0

# make the bs with the points work
# make the title look good

func _ready() -> void:
	#get_tree().root.add_child(login)
	#hide()
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
	#print(points1,points2)
	#print(get_viewport().size[0]/2)
	position.x = get_viewport().size[0]/4
	position.y = get_viewport().size[1]/4
	
	
	#pole = [10*randi(),100*randi()]
	var rng = RandomNumberGenerator.new()
	#print(rng.randi_range(-10, 10))
	#while true:
	velocity.x = randi_range(-SPEED,SPEED)
	velocity.y = SPEED-velocity.x
	
	# check if: 1. x is too small 2. 
	#if abs(int(velocity.x))>SPEED/2-20 or abs(int(velocity.x<SPEED/2+20)):
		#velocity.x += SPEED*0.5
		#print(velocity.x)
			#return
	print(velocity.x)
	if abs(velocity.x) < SPEED:
		velocity.x += SPEED*2
		
	
		
