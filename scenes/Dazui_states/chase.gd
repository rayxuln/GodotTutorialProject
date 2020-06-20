extends State


func _init(o).(o):
	pass

func enter():
	owner.anim_playback.travel("walk")
	owner.get_node("ChaseTimer").start(owner.chase_time+randi()%4-2)
	owner.chase_done = false
	
func execute():
	owner.chase_to(owner.get_global_mouse_position())
	if owner.chase_done:
		owner.state_machine.change_state(owner.ThinkState.new(owner))

func exit():
	pass

func get_name():
	return "chase"
