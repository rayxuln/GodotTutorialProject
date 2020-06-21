
extends BehaviorTreeCondition

# func <The node's name>():
# 	pass


# override
func check(btn):
	var the_owner = btn.get_node_from_database("owner")
	return the_owner.is_dead
