extends TileMapLayer
class_name map

func _ready():
	await get_tree().process_frame

	var nav_map = get_navigation_map()  # from tilemap
	for child in get_children():
		if child is entity:
			child.set_navigation_map(nav_map)
