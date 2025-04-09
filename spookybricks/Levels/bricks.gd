extends TileMapLayer

@export_range(0,1) var powerup_range = 0.5

const UNBREAKABLE_BRICK = Vector2i(1,2)
const STRONG_BRICK = Vector2i(2,1)
const CRACKED_BRICK = Vector2i(0,2)

signal spawn_powerup

func brick_hit(pos, normal):
	var brick_pos = local_to_map(pos-normal)
	check_brick_type(brick_pos)
	if no_bricks_remain():
		get_tree().quit()


func check_brick_type(brick_pos):
	if get_cell_atlas_coords(brick_pos) == UNBREAKABLE_BRICK:
		return
	elif get_cell_atlas_coords(brick_pos) == STRONG_BRICK:
		# Strong Brick in Cracked Brick umwandeln
		set_cell(brick_pos, 1, CRACKED_BRICK)
	else:
		erase_cell(brick_pos)
		check_powerup(map_to_local(brick_pos))


func check_powerup(brick_pos):
	if randf() <= powerup_range:
		emit_signal("spawn_powerup", brick_pos)


func no_bricks_remain():
	var blocks_left = get_used_cells().size()
	var unbreakable_blocks_left = get_used_cells_by_id(1, UNBREAKABLE_BRICK).size()
	if blocks_left == unbreakable_blocks_left:
		return true
