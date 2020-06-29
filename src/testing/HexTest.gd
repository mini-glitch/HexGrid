extends Node2D

const HexTile = preload("res://HexTile.tscn")

onready var hex_grid = $HexGrid

func _ready() -> void:
	add_hex(Vector2.ZERO)
	for dir in hex_grid.DIR_ALL:
		add_hex(dir)

func add_hex(pos: Vector2) -> void:
	var hex = HexTile.instance()
	hex.get_node("Coords").text = str(pos)
	hex_grid.add_hex(hex, pos)
