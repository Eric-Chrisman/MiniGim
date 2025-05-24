extends StaticBody2D
class_name entity

var navigation_map

func set_navigation_map(new_navigation_map):
	navigation_map = new_navigation_map
	$NavigationObstacle2D.set_navigation_map(navigation_map)
