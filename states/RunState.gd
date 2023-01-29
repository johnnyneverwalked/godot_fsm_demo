extends MoveState

func physics_update(entity: BaseCharacter, delta: float):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		entity.velocity.x = sign(direction) * (entity.RUNSPEED + entity.FRICTION)
	return super(entity, delta)
