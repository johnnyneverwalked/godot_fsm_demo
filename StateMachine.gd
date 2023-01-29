class_name StateMachine
extends Node

@export var state: BaseState
@export var locked: bool

signal state_changed(state: String)


var entity: BaseCharacter
var states: Array = []
var prev_state: BaseState

# Called when the node enters the scene tree for the first time.
func _ready():
	entity = get_parent()
	await entity.ready
	locked = false
	states = get_children()
	if not state:
		state = states[0]
	state.enter(entity)
		
func _unhandled_input(event: InputEvent):
	transition(state.handle_input(entity, event))


func _physics_process(delta):
	transition(state.physics_update(entity, delta))
	
func keyframe_reached(keyframe: String = ""):
	transition(state.keyframe(entity, keyframe))

func transition(to_state):
	if locked:
		return
	
	var transition
	for _state in states:
		if _state.id == to_state:
			transition = _state
			break
	
	if not transition or (transition.id == state.id and not transition.can_call_self):
		return
	
	if state:
		state.exit()
	prev_state = state
	state = transition
	state.enter(entity, {prev_state = prev_state})
	
	locked = state.lock_on_startup
	
	print("-> ", state.id)
	state_changed.emit(state.id)
	
