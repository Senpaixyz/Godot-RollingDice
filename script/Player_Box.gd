extends Node2D
signal cancel
signal amount_choiced
onready var Player = get_node(".")
export var Player_Money = 200
var default_value = Player_Money
var current_amount = 0
func _ready():
	Player.hide()


func _on_Cancel_pressed():
	emit_signal("cancel")

func _on_5_pressed():
	current_amount = 5
	emit_signal("amount_choiced")

func _on_10_pressed():
	current_amount = 10
	emit_signal("amount_choiced")

func _on_20_pressed():
	current_amount = 20
	emit_signal("amount_choiced")

func _on_ALL_pressed():
	current_amount = Player_Money
	emit_signal("amount_choiced")
func btn_enabled():
	for i in Player.get_child_count():
		Player.get_child(i).set_deferred("disabled",false)
func btn_disabled():
	for i in Player.get_child_count():
		print(Player.get_child(i).name)
		Player.get_child(i).set_deferred("disabled",true)
