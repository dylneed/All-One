extends Node

var instruments = ["Feedback","Bassoon","Violin","Cello","Piano","Viola","Flute","Clarinet"]
var flicker_time = .75
var fade_in_time = 1
var fade_out_time = 0.25
var loop_length = 36 * 60
var mute_bus_suffix = " Mute"
var master_volume = 1
var load_scene = "res://menus/load/load.tscn"
var main_scene = "res://scenes/main/main.tscn"
