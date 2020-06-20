
extends "res://behavior_tree/BehaviorTreeNodeAction.gd"

# func <The node's name>():
# 	pass

onready var the_owner = get_node_from_database("owner")

# override
func enter():
	the_owner.anim_playback.travel("big_jump_up")
	the_owner.big_jump_up_done = false

# override
func exit():
	pass

# override
func execute():
	if the_owner.big_jump_up_done:
		return BTNResult.FINISHED
	return BTNResult.RUNNING

