extends MultiplayerSynchronizer


var input_dir : Vector2


func _ready() -> void:
	# Only the server receives the inputs:
	public_visibility = false
	set_visibility_for(1, true)


func _physics_process(delta: float) -> void:
	if is_multiplayer_authority():
		input_dir = Input.get_vector("left", "right", "up", "down")

		# Prevent moving while typing a message
		if get_tree().get_first_node_in_group("send_message").visible:
			input_dir = Vector2()
