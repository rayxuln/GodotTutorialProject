extends State


func _init(o).(o):
	pass

func enter():
	owner.anim_playback.travel("big_jump_down")
	owner.big_jump_down_done = false

func execute():
	if owner.big_jump_down_done:
		owner.state_machine.change_state(owner.ThinkState.new(owner))

func exit():
	pass

func get_name():
	return "big_jump_down"
