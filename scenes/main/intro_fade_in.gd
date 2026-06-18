extends Control

var elapsed = 0.0
var ProtoController

func _ready():
	ProtoController = get_node("../ProtoController")
	ProtoController.can_look = false
	ProtoController.can_move=false
	AudioServer.set_bus_volume_linear(0,0)

func _process(delta):
	var new_value = clamp(elapsed/Global.fade_in_time,0,1)
	#self.color[3]=1-new_value
	self.modulate[3]=1-new_value
	AudioServer.set_bus_volume_linear(0,new_value*Global.master_volume)
	if elapsed >= Global.fade_in_time:
		ProtoController.can_look = true
		ProtoController.can_move = true
		self.queue_free()
	elapsed += delta
