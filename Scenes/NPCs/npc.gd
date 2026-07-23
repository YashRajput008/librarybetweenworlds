extends CharacterBody2D

var player_near = false

@onready var dialogue = get_tree().get_first_node_in_group("DialogueUI")

func _ready():
	print(dialogue)

func _process(_delta):
	if player_near and Input.is_action_just_pressed("interact"):
		if dialogue:
			dialogue.show_dialogue(
				"Old Sage",
				"Welcome, traveler. The gods have been waiting for you."
			)


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		player_near = true


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		player_near = false
