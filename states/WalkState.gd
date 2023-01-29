extends MoveState

func physics_update(entity: BaseCharacter, delta: float):
	var direction = Input.get_axis("ui_left", "ui_right")
	if sign(direction) != sign(entity.velocity.x) and abs(direction) > .5:
		return "dash" if can_dash else "run"
	if direction:
		entity.velocity.x = sign(direction) \
		* (clamp(
			abs(direction) * entity.WALKSPEED, 
			entity.MIN_WALKSPEED,
			entity.WALKSPEED
		) + entity.FRICTION)
	return super(entity, delta)
