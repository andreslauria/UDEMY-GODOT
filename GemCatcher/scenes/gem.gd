extends Area2D

class_name Gem #le damos un nobre a la clase para que las propiedades y metodos propios aparezca en el intellisense.

signal on_gem_off_screen

@export var speed: float = 100

var limitY: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var bounds = get_viewport_rect()
	limitY = bounds.end.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += speed * delta
	if position.y > limitY:
		on_gem_off_screen.emit() #emito la senial creada arriba cuando la gema sale de la pantalla
		set_process(false)
		queue_free()
	
