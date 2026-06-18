extends Node

func get_UTC_seconds():
	var time_dict = Time.get_time_dict_from_system()
	var seconds =(time_dict.hour*3600) + (time_dict.minute*60) + time_dict.second
	return seconds-(Time.get_time_zone_from_system().bias * 60)

func start_audio(start_time=0):	
	for stream_name in Global.instruments:
		var positional_node = get_node("./Positional/"+stream_name)
		positional_node.play(start_time)
		var mute_bus_node = get_node("./MuteBus/"+stream_name)
		mute_bus_node.play(start_time+Global.flicker_time)
	var overheads_node = get_node("./Positional/Overheads")
	overheads_node.play(start_time)
	var reverb_node = get_node("./Positional/Reverb")
	reverb_node.play(start_time)

func _ready():
	var start_time = get_UTC_seconds() % Global.loop_length
	start_audio(start_time)
	print("Initializing Audio at {0}m{1}s".format([start_time/60,start_time % 60]))

func _process(_delta):
	if get_node("./Positional/Reverb").get_playback_position() >= Global.loop_length: start_audio()
