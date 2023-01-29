class_name MoveState
extends BaseState

var can_dash: bool

func handle_input(entity: BaseCharacter, event: InputEvent):
	can_dash = Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right")
	if Input.is_action_just_pressed("ui_accept") and entity.current_jumps > 0:
		return "jump"

func physics_update(entity: BaseCharacter, delta):
	super(entity, delta)
	if entity.is_on_floor():
		var prev_velocity = entity.velocity
		entity.velocity.x = move_toward(entity.velocity.x, 0, entity.FRICTION)
		entity.current_jumps = entity.MAXJUMPS
		if entity.velocity == Vector2.ZERO and prev_velocity == Vector2.ZERO:
			return "idle" 
	elif entity.velocity.y >= 0:
		entity.velocity.x = move_toward(entity.velocity.x, 0, entity.FRICTION / 2)
		return "fall"
	
	if entity.velocity.x:
		entity.sprite.flip_h = entity.velocity.x < 0

func exit():
	can_dash = false
