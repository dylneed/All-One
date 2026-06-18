extends Control

func _ready():
	$MarginContainer/ButtonsContainer/StartButton.grab_focus()

func _on_resized() -> void:
	var viewport_size = get_viewport_rect().size
	var button_font_size = int(viewport_size[1] * 0.052)
	$MarginContainer/ButtonsContainer/StartButton.add_theme_font_size_override("font_size", button_font_size)
	$MarginContainer/ButtonsContainer/OptionsButton.add_theme_font_size_override("font_size", button_font_size)
	$MarginContainer/ButtonsContainer/CreditsButton.add_theme_font_size_override("font_size", button_font_size)
	$MarginContainer/ButtonsContainer/QuitButton.add_theme_font_size_override("font_size", button_font_size)
	var title_font_size = int(get_viewport_rect().size[1] * 0.155)
	$MarginContainer/Title.add_theme_font_size_override("font_size", title_font_size)
	var horizontal_margins = int(viewport_size[0] * 0.0315)
	$MarginContainer.add_theme_constant_override("margin_left",horizontal_margins)
	$MarginContainer.add_theme_constant_override("margin_right",horizontal_margins)
	var vertical_margins = int(viewport_size[1] * 0.0375)
	$MarginContainer.add_theme_constant_override("margin_top",vertical_margins)
	$MarginContainer.add_theme_constant_override("margin_bottom",horizontal_margins)

var to_load = false
var elapsed = 0.0

func _process(delta):
	if to_load:
		$MarginContainer.modulate[3] = 1 - clamp(elapsed/Global.fade_out_time,0,1)
		if elapsed >= Global.fade_in_time:
			get_tree().change_scene_to_file(Global.load_scene)
		elapsed += delta

func _on_start_button_pressed() -> void:
	to_load = true
	
func _on_options_button_pressed() -> void:
	print("Options")

func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menus/credits/credits.tscn")

func _on_quit_button_pressed() -> void: get_tree().quit()
