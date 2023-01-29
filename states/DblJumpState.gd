extends JumpState

func enter(entity: BaseCharacter, data = {}):
	entity.velocity.y = entity.JUMP_VELOCITY
	entity.current_jumps -= 1
	super(entity)
