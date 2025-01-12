extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer


const GRAVITY: float = 1000
const POWER: float  = -350

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	velocity.y += GRAVITY * delta
	
	fly()
	
	move_and_slide()
	
	if is_on_floor() or is_on_ceiling():
		die()
	
func fly() -> void:
	if Input.is_action_just_pressed("Fly"):
		animation_player.play("power")
		velocity.y = POWER


func die()-> void:
	set_physics_process(false)
	animated_sprite_2d.stop()
