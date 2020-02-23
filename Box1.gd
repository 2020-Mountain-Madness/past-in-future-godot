extends RigidBody2D

export (bool) var from_future = false
var picked = false

onready var pick_btn = "future_pick" if from_future else "past_pick"
onready var player = "FuturePlayer" if from_future else "Player"
onready var player_node = get_node("../FuturePlayer") if from_future else get_node("../Player")

func _physics_process(delta):
	if picked == true:
		self.position = player_node.global_position
		self.position.y -= 18
		sleeping = true
	else:
		sleeping = false


func _input(event):
	if Input.is_action_pressed(pick_btn) and not picked:
		var bodies = $Detector.get_overlapping_bodies()
		for body in bodies:
			print(body.name)
			if body.name == player:
				picked = true
	elif Input.is_action_pressed(pick_btn) and picked:
		picked = false
		self.position = player_node.global_position
		self.position.x += player_node.facing * 18
