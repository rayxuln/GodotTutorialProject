
extends BehaviorTreeNodeAction

# func <The node's name>():
# 	pass

onready var the_owner = get_node_from_database("owner")

# override
func enter():
	the_owner.anim_playback.travel("die")
	the_owner.die_done = false

# override
func exit():
	pass

# override
func execute():
	if the_owner.die_done:
		the_owner.queue_free()
	return BTNResult.RUNNING
