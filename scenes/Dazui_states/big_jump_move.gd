extends State


func _init(o).(o):
	pass

func enter():
	owner.move_enable = true

func execute():
	var target_pos = owner.get_global_mouse_position()
	owner.chase_to(target_pos)
	
	if (owner.global_position - target_pos).length() <= 10:
		owner.state_machine.change_state(owner.BigJumpDownState.new(owner))

func exit():
	pass

func get_name():
	return "big_jump_move"
