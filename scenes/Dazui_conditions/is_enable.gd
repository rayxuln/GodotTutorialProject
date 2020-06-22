
extends BehaviorTreeCondition

export(bool) var enable = true

# func <The node's name>():
# 	pass


# override
func check(btn):
	return enable
