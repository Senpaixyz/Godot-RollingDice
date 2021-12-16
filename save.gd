var save_info = {}


func save(info):
	save_info = info
	var save =  File.new()
	save.open("res://save/save.save", File.WRITE)
	save.store_line(to_json(save_info))
	save.close()

func load_info():
	var save = File.new()
	if not save.file_exists("res://save/save.save"):
		return
	save.open("res://save/save.save",File.READ)
	var current_line = parse_json(save.get_as_text())
	save_info = current_line

	save.close()
	return save_info	
	
	
func clear_save():
	var save = File.new()
	save.open("res://save/save.save", File.WRITE)
	save.store_line(to_json("0"))
	save.close()

func is_save():
	var save = File.new()
	save.open("res://save/save.save", File.READ)
	var size = save.get_len()
	save.close()
	return size
