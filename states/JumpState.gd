extends AirMoveState
class_name JumpState

func keyframe(entity: BaseCharacter, id: String, _data: Dictionary = {}):
	entity.velocity.y = entity.JUMP_VELOCITY
	if not Input.is_action_pressed("ui_accept"):
		entity.velocity.y *= 0.75
	entity.current_jumps -= 1

func enter(entity: BaseCharacter, data = {}):
	entity.animationPlayer.seek(0)
	super(entity)
