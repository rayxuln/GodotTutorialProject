tool
extends GraphNode

var editor
var resource
var resource_data

func _on_type_string_get():
	if resource:
		return resource.node_type_to_string(resource_data["type"])
	return "UnkownType"
func _on_node_name_get():
	if resource_data:
		return resource_data["name"]
	return "Unkown"

var has_ready = false

func BehaviorTreeEditorGraphNode():
	pass

func _ready():
	if resource_data:
		$HBoxContainer/LineEdit.text = resource_data["name"]
	update_name()

func _process(delta):
	if not has_ready:
		notification(NOTIFICATION_READY)
		has_ready = true

# ---------- custom methods ------
func update_name():
	title = _on_node_name_get() + "(" + _on_type_string_get() + ")"

# ---------- signals -------------
func _on_LineEdit_text_changed(new_text):
	if resource_data:
		resource_data["name"] = new_text
	update_name()
	if editor:
		editor.refresh_inspetor()


func _on_BehaviorTreeNode_close_request():
	resource.remove_node(resource_data)
	editor.refresh_inspetor()
	get_parent().remove_child(self)
	queue_free()
