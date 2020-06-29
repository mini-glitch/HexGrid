extends Node2D

var grid: HexGrid
var grid_pos: Vector2

func _on_Area2D_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		grid.remove_hex(grid_pos)
