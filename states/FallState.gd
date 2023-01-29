extends AirMoveState

@export var COYOTE_FRAMES := 5

func handle_input(entity: BaseCharacter, event: InputEvent):
	if event.get_action_strength("ui_down") > .175 and Input.is_action_just_pressed("ui_down"):
		fast_fall = true
	return super(entity, event)

func physics_update(entity: BaseCharacter, delta):
	if entity.is_on_floor():
		return "idle"
	entity.velocity.y += (entity.gravity / 2) * delta
	return super(entity, delta)

func enter(entity: BaseCharacter, data = {}):
	super(entity, data)
#	if data.has("prev_state") and data.prev_state is AirMoveState:
#		fast_fall = data.prev_state.fast_fall
	fast_fall = InputBuffer.is_action_press_buffered("ui_down")
	print_debug(fast_fall)
		
	await get_tree().create_timer( COYOTE_FRAMES / 60.0, false, true).timeout
	entity.current_jumps = min(entity.current_jumps, entity.MAXJUMPS - 1)

func exit():
	fast_fall = false
