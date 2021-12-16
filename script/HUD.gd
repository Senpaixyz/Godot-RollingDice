extends CanvasLayer
var scene = preload("res://save.gd")
signal start_game 
signal new_game
func _ready():
	$bgmusic.play()
	$Gameover.hide()
	$Winner.hide()
	$PlayerMoney.hide()
	$DealerMoney.hide()
	var ins = scene.new()
	if ins.is_save() == 0:
		$Continue.disabled = true

func hide():
	$NewGame.hide()
	$Continue.hide()
	$Gameover.hide()
	$Winner.hide()
	$Title.hide()
	
func show():
	$PlayerMoney.show()
	$DealerMoney.show()
func _on_Continue_pressed():
	show()
	emit_signal("start_game")
	hide()
func _on_Start_pressed():
	show()
	emit_signal("start_game")
	emit_signal("new_game")
	hide()

	

func die_duration(dur):
	$Duration.text = str(dur)
func player_update_money(val):
	$PlayerMoney.text = str(val)
func dealer_update_money(val):
	$DealerMoney.text = str(val)
func show_gameover():
	$Title.show()
	$NewGame.show()
	$Gameover.show()
	$PlayerMoney.hide()
	$DealerMoney.hide()
	
	
func set_winner_message():
	$Title.show()
	$NewGame.show()
	$Winner.show()
	$PlayerMoney.hide()
	$DealerMoney.hide()



