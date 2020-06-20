extends KinematicBody2D

var state_machine:StateMachine;
const ChaseState = preload("res://scenes/Dazui_states/chase.gd")
const BigJumpUpState = preload("res://scenes/Dazui_states/big_jump_up.gd")
const BigJumpMoveState = preload("res://scenes/Dazui_states/big_jump_move.gd")
const BigJumpDownState = preload("res://scenes/Dazui_states/big_jump_down.gd")
const SpitOutState = preload("res://scenes/Dazui_states/spit_out.gd")
const SpitPrepareState = preload("res://scenes/Dazui_states/spit_prepare.gd")
const ThinkState = preload("res://scenes/Dazui_states/think.gd")
const DieState = preload("res://scenes/Dazui_states/die.gd")

onready var anim_tree = $AnimationTree
onready var anim_playback = anim_tree["parameters/playback"]

var think_time = 3
var think_done = false

var move_speed = 200
var move_enable = false
var chase_time = 5
var chase_done = false

var big_jump_up_done = false
var big_jump_down_done = false

var spit_out_begin = false
var spit_out_end = false

var is_dead = false
var die_done = false

func _ready():
	randomize()
#	state_machine = StateMachine.new(ThinkState.new(self))
	
	

func _process(delta):
#	state_machine.update()

	if Input.is_action_just_pressed("ui_accept"):
#		state_machine.change_state(DieState.new(self))
		is_dead = true

func chase_to(pos):
	if move_enable:
		var vec = pos - global_position
		vec = vec.normalized()
		move_and_slide(vec * move_speed)

func spit_bullets():
	print("一大堆子弹被喷薄而出...")

func _on_walk_begin():
	move_enable = true
func _on_walk_end():
	move_enable = false

func _on_big_jump_up_end():
	big_jump_up_done = true

func _on_big_jump_down_end():
	big_jump_down_done = true

func _on_spit_out_begin():
	spit_out_begin = true

func _on_spit_out_end():
	spit_out_end = true
	
func _on_die_end():
	die_done = true

func _on_ThinkTimer_timeout():
	think_done = true


func _on_ChaseTimer_timeout():
	chase_done = true
