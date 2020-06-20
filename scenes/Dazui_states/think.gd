extends State


func _init(o).(o):
	pass

func enter():
	owner.get_node("ThinkTimer").start(owner.think_time+randi()%4-2)
	owner.anim_playback.travel("idle")
	owner.think_done = false

func execute():
	if owner.think_done:
		var m = randi()%3
		match m:
			0:
				# 追踪
				print("chasing")
				owner.state_machine.change_state(owner.ChaseState.new(owner))
			1:
				# 大跳
				print("big jump")
				owner.state_machine.change_state(owner.BigJumpUpState.new(owner))
			2:
				# 吐弹
				print("spitting")
				owner.state_machine.change_state(owner.SpitPrepareState.new(owner))

func exit():
	pass

func get_name():
	return "think"
