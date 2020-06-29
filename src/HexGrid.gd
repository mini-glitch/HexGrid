# this script uses pointy side up hexagons
# to change this alter the DIR_ constants and the hex_transform calculation

extends Node2D
class_name HexGrid

const DIR_NE = Vector2(1, -1)
const DIR_E = Vector2(1, 0)
const DIR_SE = Vector2(0, 1)
const DIR_SW = Vector2(-1, 1)
const DIR_W = Vector2(-1, 0)
const DIR_NW = Vector2(0, -1)
const DIR_ALL = [DIR_NE, DIR_E, DIR_SE, DIR_SW, DIR_W, DIR_NW]

export(Vector2) var hex_size := Vector2.ONE
var hexes := {}
var hex_transform: Transform2D

func _ready() -> void:
	# create the hex_transform which is used to convert axial to world space
	hex_transform = Transform2D(
		Vector2(hex_size.x, 0),
		Vector2(hex_size.x / 2, hex_size.y * 3/4),
		Vector2(0, 0)
	)

# adds a hex node at the given axial position
func add_hex(hex: Node2D, pos: Vector2) -> void:
	hexes[pos] = hex
	add_child(hex)
	hex.position = axial_to_world(pos)
	hex.grid_pos = pos
	hex.grid = self
	
# removes a hex node at the given axial position
func remove_hex(pos: Vector2) -> void:
	if not hexes.has(pos):
		printerr("Attempted to remove nonexistent hex from HexGrid!")
		return
	hexes[pos].queue_free()
	hexes.erase(pos)
	
# returns the hex node at the given axial position
# returns null if there is no hex at that position
func get_hex(pos: Vector2) -> Node2D:
	return hexes.get(pos)

# returns the neighboring hexes
func get_neighbors(pos: Vector2) -> Array:
	var positions = get_neighbor_positions(pos)
	var neighbors := []
	for pos in positions:
		neighbors.append(get_hex(pos))
	return neighbors

# returns positions of neighboring hexes
func get_neighbor_positions(pos: Vector2) -> Array:
	var neighbors := []
	for dir in DIR_ALL:
		neighbors.append(pos + dir)
	return neighbors

# convert axial position to world position relative to HexGrid node
func axial_to_world(pos: Vector2) -> Vector2:
	return hex_transform * pos
