tool
extends Control

var the_plugin

var current_behavior_tree

var editor_selection:EditorSelection

onready var graph_edit = $GraphEdit
onready var warning_label = $WarningLabel
onready var empty_menu = $EmptyPopupMenu

const GraphNode_BehaviorTreeNode = preload("BehaviorTreeEditor_GraphNode_BehaviorTreeNode.tscn")

var has_ready = false

func _ready():
	set_current_behavior_tree(null)
	if the_plugin:
		var editor_interface:EditorInterface = the_plugin.get_editor_interface()
		editor_selection = editor_interface.get_selection()
		editor_selection.connect("selection_changed", self, "_on_editor_selection_changed")


func _process(delta):
	if not has_ready:
		notification(NOTIFICATION_READY)
		has_ready = true

# ----------------- Custom Methods ------
func set_current_behavior_tree(n):
	if n:
		graph_edit.visible = true
		warning_label.visible = false
		
		current_behavior_tree = n
		
		if not current_behavior_tree.behavior_tree_resource:
			var res = BehaviorTreeResource.new()
			current_behavior_tree.behavior_tree_resource = res
			refresh_inspetor()
	else:
		current_behavior_tree = null
		graph_edit.visible = false
		warning_label.visible = true

func add_behavior_tree_node():
	var n = GraphNode_BehaviorTreeNode.instance()
	n.editor = self
	n.resource = current_behavior_tree.behavior_tree_resource
	n.resource_data = current_behavior_tree.behavior_tree_resource.create_node(BehaviorTreeResource.NodeType.NodeAction)
	graph_edit.add_child(n)
	n.set_global_position(get_global_mouse_position())
	
	refresh_inspetor()

func refresh_inspetor():
	var editor_interface:EditorInterface = the_plugin.get_editor_interface()
	editor_interface.get_inspector().refresh()

# ----------------- signals -------------
func _on_editor_selection_changed():
	var ns:Array = editor_selection.get_selected_nodes()
	if ns.size() > 0:
		if ns[0].has_method("BehaviorTree") :
			set_current_behavior_tree(ns[0])
	else:
		set_current_behavior_tree(null)
	



func _on_GraphEdit_connection_request(from, from_slot, to, to_slot):
	graph_edit.connect_node(from, from_slot, to, to_slot)


func _on_GraphEdit_disconnection_request(from, from_slot, to, to_slot):
	graph_edit.disconnect_node(from, from_slot, to, to_slot)


func _on_GraphEdit_node_selected(node):
	pass


func _on_GraphEdit_popup_request(position):
	empty_menu.set_global_position(position)
	empty_menu.popup()


func _on_CreateBehaviorTreeNodeButton_pressed():
	add_behavior_tree_node()
	empty_menu.visible = false


func _on_CreateConditionNodeButton_pressed():
	empty_menu.visible = false

