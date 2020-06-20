
extends "res://behavior_tree/BehaviorTreeNodeAction.gd"

# func <The node's name>():
# 	pass

onready var the_owner = get_node_from_database("owner")


# override
func enter():
	the_owner.anim_playback.travel("big_jump_down")
	the_owner.big_jump_down_done = false

# override
func exit():
	the_owner.anim_playback.travel("idle")
	pass

# override
func execute():
	if the_owner.big_jump_down_done:
		return BTNResult.FINISHED
		
	return BTNResult.RUNNING
