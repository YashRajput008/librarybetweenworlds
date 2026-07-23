extends Node2D

var player_near = false
var taken = false

@export var item: InvItem
var player = null

func _ready():
	visible = true

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		player_near = true
		player = body

func _on_area_2d_body_exited(body):
	if body.name == "Player":
		player_near = false

func _process(_delta):
	if player_near \
	and Input.is_action_just_pressed("interact") \
	and !taken:
		visible=false
		player.collect(item)
