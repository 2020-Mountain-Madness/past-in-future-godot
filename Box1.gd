extends RigidBody2D

var picked = false

func _physics_process(delta):
	if picked == true:
		self.position = get_node("../FuturePlayer/Position2D").global_position


func _input(event):
	if Input.is_action_just_pressed("future_pick"):
		var bodies = $Detector.get_overlapping_bodies()
		for body in bodies:
			if body.name == "FuturePlayer":
				picked = true
