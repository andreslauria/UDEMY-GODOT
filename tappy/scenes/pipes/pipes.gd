extends Node2D

class_name Pipes


const OFF_SCREEN: float = -500.0

func _process(delta: float) -> void:
	position.x -= GameManager.SCROLL_SPEED * delta
	check_off_screen()


func check_off_screen() -> void:
	if position.x < OFF_SCREEN:
		queue_free()

func on_screen_exited() -> void: #esta senial no siempre se emite o recibe, va a depender si esta renderizando o no la pantalla..
	queue_free()
