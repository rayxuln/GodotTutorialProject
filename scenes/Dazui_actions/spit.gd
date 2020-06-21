
extends BehaviorTreeNodeAction

# func <The node's name>():
# 	pass
onready var the_owner = get_node_from_database("owner")


# override
func enter():
	the_owner.spit_out_end = false
	the_owner.spit_bullets()

# override
func exit():
	the_owner.anim_playback.travel("idle")
	pass

# override
func execute():
	if the_owner.spit_out_end:
		return BTNResult.FINISHED
		
	return BTNResult.RUNNING
