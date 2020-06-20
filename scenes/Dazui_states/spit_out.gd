extends State


func _init(o).(o):
	pass

func enter():
	owner.spit_out_end = false
	owner.spit_bullets()

func execute():
	if owner.spit_out_end:
		owner.state_machine.change_state(owner.ThinkState.new(owner))

func exit():
	pass

func get_name():
	return "spit_out"
