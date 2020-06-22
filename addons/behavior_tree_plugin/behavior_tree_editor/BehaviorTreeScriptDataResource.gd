
extends Resource

class_name  BehaviorTreeScriptDataResource

var graph_node

export(Dictionary) var data setget _on_data_set, _on_data_get
func _on_data_set(v):
	graph_node.resource_data["data"] = v
func _on_data_get():
	return graph_node.resource_data["data"]
