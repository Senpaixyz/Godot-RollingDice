extends Node2D
const DefaultSaver = preload("res://save.gd")
signal roll_dice
export(int) var Dealer_Money =400
var default_value = Dealer_Money
var Color_Amount = 0
var Taya = 0
var roll_duration = 0
var stop = false
var save
var dealer_money
var player_money
func _ready():
	load_save()
	$BettingBox.hide()
	$Player.hide()
	$TileMap.hide()
func load_save():
	save = DefaultSaver.new()
	var info =  save.load_info()
	save.is_save()
	print(info)
	if info:
		Dealer_Money = info["dealer_money"]
		$Player.Player_Money = info["player_money"]

		
func save():
	var save_info = {
		player_money = $Player.Player_Money,
		dealer_money= Dealer_Money
	}
	print(save_info)
	save.save(save_info)	
func start_game():#signal to HUD
	$TileMap.show()
	$Die.show()
	$Player.show()
	$Player.btn_disabled()
	$BettingBox.show()
	$BettingBox.enabled_button()
	$HUD.player_update_money($Player.Player_Money)
	$HUD.dealer_update_money(Dealer_Money)

func _on_BettingBox_color_choosed():
	$BettingBox.disabled_button()
	$Player.btn_enabled()
	


func _on_Amount_cancel():
	$BettingBox.enabled_button()
	$Player.btn_disabled()

func _on_Amount_amount_choiced():
	$Player.Player_Money -= $Player.current_amount
	$HUD.player_update_money($Player.Player_Money)
	$Player.btn_disabled()
	emit_signal("roll_dice")

func _on_Main_roll_dice():
	$Die/Start.start()
	$Die.play_sound()
	
func _on_Start_timeout():
	roll_duration += 1
	$HUD.die_duration(roll_duration)
	if roll_duration > 1 and roll_duration < 3:
		$Die.set_speed(800)
	elif roll_duration > 4 and roll_duration < 7:
		$Die.set_speed(500)
		
	elif roll_duration > 7 and roll_duration < 10:
		$Die.set_speed(200)

	elif roll_duration > 10:
		stop = true
	if stop:
		randomize()
		var randomize_color = randi() % 7
		$Die/AnimatedSprite.frame = randomize_color
		$Die.get_frame(randomize_color)
		$Die/AnimatedSprite.stop()
		$Die.set_speed(0)
		is_winner()
	else:
		$Die/AnimatedSprite.play()
		
func is_winner():
	if $Die.current_color == $BettingBox.Pick_Color:
			$Player.Player_Money += times_gold()
			Dealer_Money -= times_gold()
	else:
			Dealer_Money += $Player.current_amount		
	$Die/Start.stop()
	stop = false
	roll_duration = 0	
	if $Player.Player_Money > 0 and Dealer_Money > 0:
		$HUD.player_update_money($Player.Player_Money)
		$HUD.dealer_update_money(Dealer_Money)
		save()
		start_game()
	elif Dealer_Money < 0:
		$HUD.set_winner_message()
		reset()
	else:
		$HUD.show_gameover()
		reset()

func times_gold():
	var times_Gold = $BettingBox.Value * $Player.current_amount
	return times_Gold
func reset():
	$TileMap.hide()
	$BettingBox.hide()
	$Die.hide()
	stop = false
	roll_duration = 0
	$Player.hide()
	_on_HUD_new_game()

func _on_HUD_new_game():
	$Player.Player_Money = $Player.default_value
	Dealer_Money = default_value
	$HUD.player_update_money($Player.Player_Money)
	$HUD.dealer_update_money(Dealer_Money)
	save()
