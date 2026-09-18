extends TextureRect

var map = self
var selected := false
var touch_offset := Vector2.ZERO

func _process(delta: float) -> void:
	if !(position.x <= 0):
		position.x = 0
	elif !(position.x >= -4560):
		position.x = -4560

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed:
			var global_rect = Rect2(map.position, map.size)
			if global_rect.has_point(event.position):
				selected = true
				touch_offset = position - event.position
			else:
				selected = false
	elif event is InputEventScreenDrag && selected && position.x <= 0 && position.x >= -4560:
			position.x = event.position.x + touch_offset.x
