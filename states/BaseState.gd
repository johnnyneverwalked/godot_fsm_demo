class_name BaseState
extends Node

@export var id: String
@export var can_call_self: bool
@export var lock_on_startup: bool
@export var looping: bool

# Called every frame. 'delta' is the elapsed time since the previous frame.
func handle_input_(entity: BaseCharacter, _input: InputEvent):
	pass

func keyframe(_entity: BaseCharacter, _id: String, _data: Dictionary = {}):
	pass

func physics_update(_entity: BaseCharacter, _delta: float):
	pass

func enter(entity: BaseCharacter, _data: Dictionary = {}):
	entity.animationPlayer.play(id)

func exit():
	pass
