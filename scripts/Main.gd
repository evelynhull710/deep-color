extends Node2D

@export var enemy_scene: PackedScene = preload("res://scenes/Enemy.tscn")
@onready var player := $Player
@export var enemy_count := 8
@export var spawn_radius := 500.0

func _ready() -> void:
	spawn_enemies()

func spawn_enemies() -> void:
	for i in enemy_count:
		var e := enemy_scene.instantiate()
		add_child(e)

		# random position around the player
		var angle := randf() * TAU
		var r := randf_range(spawn_radius * 0.5, spawn_radius)
		e.global_position = player.global_position + Vector2(cos(angle), sin(angle)) * r

		e.target = player
