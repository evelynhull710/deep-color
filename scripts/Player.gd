extends CharacterBody2D

@export var speed := 250.0

func _physics_process(_delta: float) -> void:
	var direction := Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)

	if direction != Vector2.ZERO:
		direction = direction.normalized()

	velocity = direction * speed
	move_and_slide()

func _ready() -> void:
	print("Player script running")

func _on_hurtbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		print("HIT")
#func _on_hurtbox_body_entered(body):
	#print("first HIT")
	#if body.is_in_group("enemies"):
		#print("HIT")
