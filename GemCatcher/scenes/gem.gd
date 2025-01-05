extends Area2D

@export var speed: float = 100

var limitY: float = 0.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var bounds = get_viewport_rect()
	limitY = bounds.end.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += speed * delta
	if position.y >= limitY:
		set_process(false)  #por si tenes llamadas diferidas pendientes o signal.
		queue_free()  # no es INSTANTANEO, libera cuando puede ya liberarse el nodo.
