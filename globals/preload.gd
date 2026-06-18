extends Node
func print_dir(dir_str):
	print(dir_str)
	var dir := DirAccess.open(dir_str)
	if dir == null: printerr("Could not open folder"); return
	dir.list_dir_begin()
	for file: String in dir.get_files():
		#var resource := load(dir.get_current_dir() + "/" + file)
		#print(resource)
		print(dir.get_current_dir() + "/" + file)
		
#func open_pck():
	#if not ProjectSettings.load_resource_pack("res://Background.pck"): print("Failed to load Background")
	#if not ProjectSettings.load_resource_pack("res://Music1.pck"): print("Failed to load Music1 (preload)")
	#if not ProjectSettings.load_resource_pack("res://Music2.pck"): print("Failed to load Music2 (preload)")
	#if not ProjectSettings.load_resource_pack("res://Music3.pck"): print("Failed to load Music3 (preload)")
	#if not ProjectSettings.load_resource_pack("res://Music4.pck"): print("Failed to load Music4 (preload)")
	#if not ProjectSettings.load_resource_pack("res://Music5.pck"): print("Failed to load Music5 (preload)")
	#return true
#var _pck = open_pck()
