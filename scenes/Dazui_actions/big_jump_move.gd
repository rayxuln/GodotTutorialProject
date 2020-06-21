
extends BehaviorTreeNodeAction

# func <The node's name>():
# 	pass

onready var the_owner = get_node_from_database("owner")


# override
func enter():
	the_owner.move_enable = true

# override
func exit():
	pass

# override
func execute():
	var target_pos = get_from_database("target_pos")
	the_owner.chase_to(target_pos)
	
	if (the_owner.global_position - target_pos).length() <= 10:
		return BTNResult.FINISHED

	return BTNResult.RUNNING
