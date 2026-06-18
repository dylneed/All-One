extends Node3D

func get_bus_db(bus_index):
	return (AudioServer.get_bus_peak_volume_left_db(bus_index,0) + AudioServer.get_bus_peak_volume_right_db(bus_index,0)) / 2.0

func db_to_light_energy(dB, db_floor=-60,db_ceiling=0,max_energy=.5,min_energy=-0.05,snap=0.001):
	return snapped(clamp((((dB-db_floor)/(db_ceiling-db_floor))*(max_energy-min_energy))+min_energy,min_energy,max_energy),snap)

func bus_to_light_energy(bus_index,db_floor=-60,db_ceiling=0,max_energy=.5,min_energy=-0.05,snap=0.001):
	return db_to_light_energy(get_bus_db(bus_index),db_floor,db_ceiling,max_energy,min_energy,snap)

var elapsed = 0.0
var old_energy = [0,0,0,0,0,0,0,0]
var new_energy = [0,0,0,0,0,0,0,0]
var current_energy = [0,0,0,0,0,0,0,0]
	
func _process(delta):
	if elapsed >= Global.flicker_time: elapsed = 0
	for i in Global.instruments.size():
		var instr = Global.instruments[i]
		if elapsed == 0:
			old_energy[i] = new_energy[i]
			new_energy[i] = bus_to_light_energy(AudioServer.get_bus_index(instr + Global.mute_bus_suffix))
		current_energy[i] = ((new_energy[i]-old_energy[i])*clamp(elapsed/Global.flicker_time,0,1)) + old_energy[i]
		get_node(instr).light_energy = current_energy[i]
	elapsed += delta
	
func _ready():
	for i in Global.instruments.size():
		var light_name = Global.instruments[i]
		var light_color = get_node(light_name).light_color
		var blue_index = 4- abs(4-i)
		light_color[0] = 90/255.0 #R
		light_color[1] = 0.0 #G
		light_color[2] = (blue_index * 6)/255.0
		light_color[3] = 1.0 #A
