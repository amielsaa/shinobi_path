extends Node
class_name SaveManager
const SAVEFILE:String = "user://savefile.json"
 
var json = JSON.new()
var data = 0
@export var highest_record:int = 0
 
func _ready():
	load_score()
	
func save_score():
	var file = FileAccess.open(SAVEFILE, FileAccess.WRITE_READ)
	file.store_string(json.stringify(data))
	file.close()
	file = null
 
func load_score():
	var file = FileAccess.open(SAVEFILE, FileAccess.WRITE_READ)
	var content = json.parse_string(file.get_as_text())
	data = content

func _init():
	load_score()
 
