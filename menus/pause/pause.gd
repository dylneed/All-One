extends Control

var paused = false

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/start/start.tscn")

func _input(event) -> void:
	if Input.is_action_pressed("pause"):
		if paused: close_pause_menu()
		else: show()


func _on_return_button_pressed() -> void:
	close_pause_menu()

func open_pause_menu() -> void:
	show()

func close_pause_menu() -> void:
	hide()
