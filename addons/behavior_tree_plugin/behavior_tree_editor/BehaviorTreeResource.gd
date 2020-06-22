tool
extends Resource

class_name BehaviorTreeResource

export(String) var tree_name = "6566"

export(Array) var nodes:Array
export(Array) var connections:Array
export(String) var root:String

enum NodeType{
	NodeUndefined,
	NodeAction,
	NodeConcurrent,
	NodePrioritySelector,
	NodeProxy,
	NodeRandomSelector,
	NodeSequenceSelector,
	Condition
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
		NodeType.Condition:
			return "Condition"

func create_node(type):
	var res = {
		"g_name": "",
		"position": Vector2.ZERO,
		"type": type,
		"name": "Unkown",
		"custom_script": null,
		"data": {}
	}
	match type:
		NodeType.NodeUndefined:
			pass
		NodeType.NodeAction:
			pass
		NodeType.NodeConcurrent:
			res["concurrent_mode"] = 0
			res["condition_mode"] = 0
		NodeType.NodePrioritySelector:
			res["max_select_delay"] = 0
			res["min_select_delay"] = 0
			res["delay_on_start"] = false
		NodeType.NodeProxy:
			pass
		NodeType.NodeRandomSelector:
			res["max_select_delay"] = 0
			res["min_select_delay"] = 0
			res["delay_on_start"] = false
		NodeType.NodeSequenceSelector:
			pass
		NodeType.Condition:
			pass
	nodes.append(res)
	return res

func remove_node(n):
	nodes.remove(nodes.find(n))
