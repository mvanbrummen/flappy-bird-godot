extends RigidBody2D

signal hit

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _ready():
		set_linear_velocity(Vector2(0, get_linear_velocity().y))
		set_process_input(true)
		pass

func _process(delta):
		if get_linear_velocity().y > 0:
				set_angular_velocity(0.5)
		pass

func flap():
		set_linear_velocity(Vector2(get_linear_velocity().x, -200))
		set_angular_velocity(-0.5)
		$Flap.play()
		pass
		
func _input(event):
	if event.is_action_pressed("jump"):
		flap()


func _on_Bird_body_entered(body):
	print("Bird entered")
	hide()  # Player disappears after being hit.
	emit_signal("hit")
	$CollisionShape2D.set_deferred("disabled", true)
