extends Control

var unloaded = true

#func _ready():
	#Preload.print_dir("./")
	#Preload.print_dir("../")
	#Preload.print_dir("res://")
	#Preload.print_dir("res://scenes/main/assets/audio/")

	#if not ProjectSettings.load_resource_pack("res://Music1.pck"): print("Failed to load Music1 (..)")
	#if not ProjectSettings.load_resource_pack("res://Music2.pck"): print("Failed to load Music2 (.)")
	#if not ProjectSettings.load_resource_pack("res://Music3.pck"): print("Failed to load Music3 (res://)")
	#if not ProjectSettings.load_resource_pack("res://Music4.pck"): print("Failed to load Music4")
	#if not ProjectSettings.load_resource_pack("res://Music5.pck"): print("Failed to load Music5")
	#pass

func _process(_elapsed):
	if unloaded: 
		get_tree().change_scene_to_file(Global.main_scene)
		unloaded = false
	
