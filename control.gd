extends Control
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		# Setze den Titel für das Pong-Spiel
	var title_label = $Label
	title_label.text = "Pong"
	#title_label.set_align(Label.ALIGN_CENTER)



var d = 0
var m = 0
# Called every frame. 'delta' is t	he elapsed time since the previous frame.
func _process(delta: float) -> void:
	var title_label = $Label
	title_label.text = "PO" + "O".repeat(d/5) + "NG"
	title_label.position.x = d
	d+=1
	if d >100:
		d=0
		m+=1


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://node_2d.tscn")
	hide()


func _on_exit_pressed() -> void:
	get_tree().quit()
