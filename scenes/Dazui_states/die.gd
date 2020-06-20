extends State


func _init(o).(o):
	pass

func enter():
	owner.anim_playback.travel("die")
	owner.die_done = false

func execute():
	if owner.die_done:
		owner.queue_free()

func exit():
	pass

func get_name():
	return "die"
