extends BaseState

var can_dash: bool

func handle_input(entity: BaseCharacter, event: InputEvent):
	can_dash = Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right")
	if Input.get_action_strength("ui_down") > .125 and Input.is_action_just_pressed("ui_down"):
		entity.position.y += 2
	if InputBuffer.is_action_press_buffered("ui_accept"):
		return "jump"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_update(entity, delta):
	super(entity, delta)
	if not entity.is_on_floor():
		return "fall"

	var direction = Input.get_axis("ui_left", "ui_right")
	if not direction:
		entity.velocity.x = move_toward(entity.velocity.x, 0, entity.FRICTION)
		return
	if abs(direction) > .175:
		return "dash" if can_dash else "run"
	return "walk"

func enter(entity: BaseCharacter, data = {}):
	super(entity)
	entity.current_jumps = entity.MAXJUMPS

func exit():
	can_dash = false
