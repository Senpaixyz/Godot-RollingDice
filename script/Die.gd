extends RigidBody2D

var Rotation_Speed = 0
onready var circle_entity =  get_node(".")
var current_color = ""
var drag = Vector2()
var dragging

func _ready():
	circle_entity.hide()
func set_speed(val):
	Rotation_Speed = val
func get_speed():
	return Rotation_Speed
func _physics_process(_delta):
	circle_entity.rotate(deg2rad(get_speed() * _delta))

func play_sound():
	#$RotationSound.play
	pass
func get_frame(frame):
	match(frame):
		0:
			current_color = "Blue"
		1:
			current_color = "Red"
		2:
			current_color = "Blue"
		3:
			current_color = "Red"
		4:
			current_color = "Blue"
		5:
			current_color = "Yellow"
		
	
		
	
