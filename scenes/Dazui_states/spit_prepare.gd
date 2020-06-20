extends State


func _init(o).(o):
	pass

func enter():
	owner.anim_playback.travel("spit")
	owner.spit_out_begin = false

func execute():
	if owner.spit_out_begin:
		owner.state_machine.change_state(owner.SpitOutState.new(owner))

func exit():
	pass

func get_name():
	return "spit_prepare"
