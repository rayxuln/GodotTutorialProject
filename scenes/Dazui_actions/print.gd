
extends "res://behavior_tree/BehaviorTreeNodeAction.gd"

# func <The node's name>():
# 	pass

export(String) var msg = 666
export(float) var time = 1

var has_timer_done = false

func _on_timeout():
	has_timer_done = true

# override
func enter():
	has_timer_done = false
	print(msg)
	get_tree().create_timer(time).connect("timeout", self, "_on_timeout")

# override
func exit():
	pass

# override
func execute():
	if has_timer_done:
		return BTNResult.FINISHED
	return BTNResult.RUNNING
