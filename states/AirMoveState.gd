class_name AirMoveState
extends MoveState

var fast_fall: bool

func handle_input(entity: BaseCharacter, event: InputEvent):
#	if event.get_action_strength("ui_down") > .175 and Input.is_action_just_pressed("ui_down"):
#		fast_fall = true
#		if entity.velocity.y < 0:
#			entity.velocity.y = 0
#		return "fall"
		
	if event.is_action_pressed("ui_accept") and entity.current_jumps > 0:
		if entity.current_jumps == entity.MAXJUMPS:
			return "jump"
		return "dbl_jump"
	return super(entity, event)

func physics_update(entity: BaseCharacter, delta: float):
	entity.velocity.y += entity.gravity * delta * (5 if fast_fall else 1)
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		entity.velocity.x = sign(direction) \
		* clamp(
			abs(direction) * entity.STRAFESPEED, 
			0,
			entity.STRAFESPEED
		)
	return super(entity, delta)

func enter(entity: BaseCharacter, data = {}):
	super(entity, data)
	fast_fall = false
	
