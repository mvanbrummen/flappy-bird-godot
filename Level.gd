extends Node2D

export (PackedScene) var pipe

var screen_size

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	screen_size = get_viewport_rect().size
	
	$StartTimer.start()

func game_over():
	print("Gameover!")
	$StartTimer.stop()
	$PipeTimer.stop()

func new_game():
	score = 0
	$HUD.update_score(score)
	$Bird.start($StartPosition.position)
	$StartTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	pass


func _on_StartTimer_timeout():
	print("start!")
	$PipeTimer.start()

func _on_PipeTimer_timeout():
	score += 1 
	$HUD.update_score(score)
	var pipeInstance = pipe.instance()
	add_child(pipeInstance)
	pipeInstance.position = $PipePosition.position
	
	# between 720 and 480
	pipeInstance.position.y = rand_range(480, 720)
	pipeInstance.linear_velocity = Vector2(-100, 0)


