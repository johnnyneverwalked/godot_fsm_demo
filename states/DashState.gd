extends MoveState

func keyframe(entity: BaseCharacter, _id: String, _data: Dictionary = {}):
	if InputBuffer.is_action_press_buffered("ui_accept"):
		return "jump"
	if Input.get_axis("ui_left", "ui_right"):
		return "run"
	return "idle"

func enter(entity: BaseCharacter, _data: Dictionary = {}):
	super(entity, _data)
	var direction = Input.get_axis("ui_left", "ui_right")
	entity.velocity.x = sign(direction) * entity.DASHSPEED
	
