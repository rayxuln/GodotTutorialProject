extends Object

class_name StateMachine

var current_state:State = null

func _init(state:State = null):
	current_state = state
	if current_state != null:
		current_state.enter()
	pass

func change_state(state:State):
	if current_state != null :
		current_state.exit()
		current_state.call_deferred("free")
	
	current_state = state
	
	if current_state != null :
		current_state.enter()

func update():
	if current_state != null :
		current_state.execute()
	
func is_state(state_name:String):
	if current_state == null :
		return false
	return current_state.get_name() == state_name
