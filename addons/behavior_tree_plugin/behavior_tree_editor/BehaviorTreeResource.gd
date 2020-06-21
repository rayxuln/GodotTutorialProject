tool
extends Resource

class_name BehaviorTreeResource

export(String) var tree_name = "6566"

export(Array) var nodes:Array
export(Array) var connections:Array

enum NodeType{
	NodeUndefined,
	NodeAction,
	NodeConcurrent,
	NodePrioritySelector,
	NodeProxy,
	NodeRandomSelector,
	NodeSequenceSelector
}

func node_type_to_string(t):
	match t:
		NodeType.NodeUndefined:
			return "Unkown"
		NodeType.NodeAction:
			return "Action"
		NodeType.NodeConcurrent:
			return "Concurrent"
		NodeType.NodePrioritySelector:
			return "PrioritySelector"
		NodeType.NodeProxy:
			return "Proxy"
		NodeType.NodeRandomSelector:
			return "RandomSelector"
		NodeType.NodeSequenceSelector:
			return "SequenceSelector"

func create_node(type):
	var res = {
		"g_name": "",
		"position": Vector2.ZERO,
		"type": type,
		"name": "Unkown",
		"custom_script": null,
		"data": {}
	}
	nodes.append(res)
	return res

func remove_node(n):
	nodes.remove(nodes.find(n))
