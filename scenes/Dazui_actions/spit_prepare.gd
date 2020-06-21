
extends BehaviorTreeNodeAction

# func <The node's name>():
# 	pass
onready var the_owner = get_node_from_database("owner")


# override
func enter():
	the_owner.anim_playback.travel("spit")
	the_owner.spit_out_begin = false

# override
func exit():
	pass

# override
func execute():
	if the_owner.spit_out_begin:
		return BTNResult.FINISHED
		
	return BTNResult.RUNNING

