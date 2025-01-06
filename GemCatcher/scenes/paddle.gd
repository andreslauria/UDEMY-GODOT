extends Area2D

class_name Paddle

@export var speed: float = 1000
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Right"):
		position.x += speed * delta
	if Input.is_action_pressed("Left"):
		position.x -= speed * delta

#	var input_amount: float = Input.get_axis("Left","Right")
#	position.x += speed*delta*input_amount

func play_sound() ->void:
	audio_stream_player.play()
