extends TileMapLayer

func brick_hit(pos, normal):
	var brick_pos = local_to_map(pos-normal)
	check_brick_type(brick_pos)
	if no_bricks_remain():
		get_tree().quit()


func check_brick_type(brick_pos):
	# TODO: nächste Stunde checken wir den Typ des Bricks
	if not get_cell_atlas_coords(brick_pos) == Vector2i(1,2):
		erase_cell(brick_pos)


func no_bricks_remain():
	var blocks_left = get_used_cells().size()
	if blocks_left == 0:
		return true
