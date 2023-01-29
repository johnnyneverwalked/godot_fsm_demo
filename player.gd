class_name BaseCharacter
extends CharacterBody2D


@export var RUNSPEED: float = 450.0
@export var DASHSPEED: float = 775
@export var STRAFESPEED: float = 300.0
@export var WALKSPEED: float = 150.0
@export var MIN_WALKSPEED: float = 50.0
@export var FRICTION: float = 50.0
@export var JUMP_VELOCITY: float = -500.0
@export var MAXJUMPS: int = 2


@onready var sprite := $AnimatedSprite2D
@onready var animationPlayer := $AnimationPlayer

var current_jumps: int

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	current_jumps = MAXJUMPS

func _physics_process(delta):
	move_and_slide()
	$debug.text = $StateMachine.state.id
	if $StateMachine.locked:
		$debug.text += "+"
	
