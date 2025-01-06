extends Node2D

@export var gem_scene: PackedScene #Para instanciar las escenas, como un prefab

const EXPLODE = preload("res://assets/explode.wav") #exporta, precarga en el juego los assets con ctrl y arrastrar


@onready var label: Label = $Label  #con ctrl y arrastrando el nodo ya crea la variable onready para linkear nodos
@onready var timer: Timer = $Timer
@onready var paddle: Paddle = $Paddle
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var score: int = 0

func _ready() -> void:
	spawn_gem()


@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass


func spawn_gem() -> void:
	var new_gem: Gem = gem_scene.instantiate()
	var xpos: float = randf_range(70,1100)
	var speed: float = randf_range(100, 250)
	new_gem.position = Vector2(xpos,-50)
	new_gem.speed = speed
	new_gem.on_gem_off_screen.connect(game_over) #conecto la gema a la senial creada, y creo la llamada a la funcion game_over()
	add_child(new_gem)
	

func stop_all() -> void:
	timer.stop()
	audio_stream_player.stop()
	audio_stream_player.stream = EXPLODE
	audio_stream_player.play()
	
	var childrens = get_children()
	for child in childrens:
		child.set_process(false)
		

func game_over() -> void:
	stop_all()

func _on_timer_timeout() -> void:
	spawn_gem()

func _on_paddle_area_entered(area: Area2D) -> void:
	score += 1
	#$Label.text = str(score) #no es buena idea hacerlo asi..por uqe si tengo que conectar muchos nodos en distintos lados y despues cambio el nombre
	label.text = str(score)
	paddle.play_sound()
	area.queue_free()
