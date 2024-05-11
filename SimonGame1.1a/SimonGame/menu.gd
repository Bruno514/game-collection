extends Control

signal StartGame

@onready var subRef = $subtitleRef

# Called when the node enters the scene tree for the first time.
func _ready():
	titleAnim()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass

func titleAnim():
	var tween = get_tree().create_tween()
	tween.tween_property(subRef, "rotation", 0.3, 2.5)
	await get_tree().create_timer(2.5).timeout
	var tween2 = get_tree().create_tween()
	tween2.tween_property(subRef, "rotation", -0.3, 2.5)
	
	
	


func _on_menu_button_pressed():
	# deixar menu invisivel
	visible = false
	StartGame.emit()


func _on_subtitle_timer_timeout():
	titleAnim()
	pass # Replace with function body.
