extends Control

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/start/start.tscn")
	pass # Replace with function body.

func _input(event) -> void:
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://menus/start/start.tscn")
