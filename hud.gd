extends CanvasLayer

signal start_game

	
func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
# Called when the node enters the scene tree for the first time.
func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	await $MessageTimer.timeout

	$Message.text = "RELIKT'S VERY COOL\nTEST GAME"
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
func update_score(score):
	$ScoreLabel.text = str(score)
	$GetReady.hide()


func _on_message_timer_timeout():
	$StartButton.hide()
	
#	


func _on_start_button_pressed():
	$Message.hide()
	$StartButton.hide()
	$StartButton2.show()
	$Label2.show()
	$GetReady.hide()
#	start_game.emit()


func _on_start_button_2_pressed():
	$StartButton2.hide()
	$Label2.hide()
	$StartButton3.show()
	$OptionsButton.hide()
	$ExitButton.hide()
	


func _on_get_ready_ready():
	$Label2.hide()
	$StartButton2.hide()
	$GetReady.hide()
	$StartButton3.hide()
#	$OptionsButton.hide()
#	$ExitButton.hide()


func _on_start_button_3_pressed():
	start_game.emit()
	$GetReady.show()
	$StartButton3.hide()
