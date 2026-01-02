extends CharacterBody2D

@export var speed := 140.0
@export var stop_distance := 18.0
var target: Node2D

func _physics_process(_delta: float) -> void:
	if target == null:
		return

	var offset := target.global_position - global_position
	var dist := offset.length()

	# stop near the player
	if dist <= stop_distance:
		velocity = Vector2.ZERO
		move_and_slide()
		return

	var dir := offset / dist
	velocity = dir * speed
	move_and_slide()
