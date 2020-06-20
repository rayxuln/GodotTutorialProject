extends State


func _init(o).(o):
	pass

func enter():
	owner.anim_playback.travel("big_jump_up")
	owner.big_jump_up_done = false

func execute():
	if owner.big_jump_up_done:
		owner.state_machine.change_state(owner.BigJumpMoveState.new(owner))

func exit():
	pass

func get_name():
	return "big_jump_up"
