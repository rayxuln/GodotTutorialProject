
extends Node

class_name BehaviorTree

export(NodePath) var root_path setget _on_root_path_set, _on_root_path_get
func _on_root_path_set(v):
	root_path = v
func _on_root_path_get():
	return root_path
onready var root = get_node_or_null(root_path)

export(Dictionary) var database

export(bool) var enable = true
export(bool) var debug_mode = true

func BehaviorTree():
	pass

func _ready():
	if root:
		root.activate()

func _process(delta):
	if not enable:
		return
	
	if root and root.eval():
		root.tick()

func reset():
	if root:
		root.clear()
