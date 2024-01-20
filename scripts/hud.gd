extends CanvasLayer

@onready var label = $MarginContainer/VBoxContainer/HBoxContainer/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_score_updated.connect(_on_score_updated)

func _on_score_updated(new_score: int) -> void:
	label.text = "Score: %d" %new_score
