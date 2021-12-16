extends Node2D

signal color_choosed
export(int) var Value
export var Pick_Color = ""
onready var parent = get_node(".")
func get_color_value():
	return Value

func disabled_button():

	for i in parent.get_child_count():
		parent.get_child(i).set_deferred("disabled",true)
func enabled_button():
	for i in parent.get_child_count():
		parent.get_child(i).set_deferred("disabled",false)
func _on_Blue_pressed():
	Value = 1
	Pick_Color = "Blue"
	emit_signal("color_choosed")


func _on_Red_pressed():
	Value = 4
	Pick_Color = "Red"
	emit_signal("color_choosed")


func _on_Yellow_pressed():
	Value = 2
	Pick_Color = "Yellow"
	emit_signal("color_choosed")
