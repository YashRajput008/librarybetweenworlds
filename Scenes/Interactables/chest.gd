extends Node2D

var player_near = false
var opened = false

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		player_near = true

func _on_area_2d_body_exited(body):
	if body.name == "Player":
		player_near = false

func _process(_delta):
	if player_near \
	and Input.is_action_just_pressed("interact") \
	and !opened:

		opened = true
		$AnimatedSprite2D.play("open")

func _on_animated_sprite_2d_animation_finished():
	print("You found 10 gold!")
