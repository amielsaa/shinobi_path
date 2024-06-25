extends Control

@onready var current_score_label = $Score/CurrentScore
@onready var highest_score_label = $Score/HighestScore
@onready var saveLoad = SaveManager.new()

var current_score = 0 :
	set(x):
		current_score = x
		current_score_label.text = "SCORE: " + str(current_score)

func _ready():
	highest_score_label.text = "HIGHEST SCORE: " + str( saveLoad.data )

func update_score(score_added):
	current_score += score_added

	
func save_score():
	if ( current_score > saveLoad.data ):
		saveLoad.data = current_score
		highest_score_label.text = "HIGHEST SCORE: " + str( current_score )
	saveLoad.save_score()
