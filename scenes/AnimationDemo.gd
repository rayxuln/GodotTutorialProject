extends KinematicBody2D


onready var anim_player = $AnimationPlayer
onready var anim_tree = $AnimationTree
onready var anim_playback = anim_tree["parameters/body_state_machine/playback"]

func _process(delta):
	var input_vec = Vector2.ZERO
	input_vec.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vec.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	var speed = input_vec * 200
	anim_tree["parameters/body_state_machine/walk/blend_position"] = input_vec
	move_and_slide(speed)
	
	if speed.length() > 0:
		anim_playback.travel("walk")
	else:
		anim_playback.travel("idle")
	
	if Input.is_action_just_pressed("ui_cancel"):
		anim_tree["parameters/add_hurt/add_amount"] = 1 - anim_tree["parameters/add_hurt/add_amount"]


func _on_anim_event():
	print("hi~")
