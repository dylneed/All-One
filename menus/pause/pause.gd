extends Control

var paused = false

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/start/start.tscn")

func _input(event) -> void:
	if Input.is_action_pressed("pause"):
		if paused: close_pause_menu()
		else: open_pause_menu()


func _on_return_button_pressed() -> void:
	close_pause_menu()

func open_pause_menu() -> void:
	paused = true
	show()

func close_pause_menu() -> void:
	paused = false
	hide()
