extends Node2D

@export var speed: float = 200
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= speed * delta
	check_off_screen()


func check_off_screen() -> void:
	if position.x < -500:
		queue_free()

func on_screen_exited() -> void: #esta senial no siempre se emite o recibe, va a depender si esta renderizando o no la pantalla..
	queue_free()
