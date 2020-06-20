
extends "res://behavior_tree/BehaviorTreeNodeAction.gd"

# func <The node's name>():
# 	pass

onready var the_owner = get_node_from_database("owner")

# override
func enter():
	the_owner.anim_playback.travel("walk")
	the_owner.get_node("ChaseTimer").start(the_owner.chase_time+randi()%4-2)
	the_owner.chase_done = false

# override
func exit():
	the_owner.anim_playback.travel("idle")
	pass

# override
func execute():
	the_owner.chase_to(the_owner.get_global_mouse_position())
	if the_owner.chase_done and not the_owner.move_enable:
		return BTNResult.FINISHED
	return BTNResult.RUNNING
