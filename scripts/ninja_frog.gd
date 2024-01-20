class_name NinjaFrog
extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

@export var SPEED: float = 150
@export var JUMP: float = 250
#@export var GRAVITY: float = 300.0
var GRAVITY: float = ProjectSettings.get("physics/2d/default_gravity")

func _ready() -> void:
	pass

func _physics_process(delta):
	var dir = Input.get_axis("left", "right")
	var anim = "idle"

	if not is_on_floor():
		velocity.y += GRAVITY * delta
		#anim = "jump" if velocity.y < 0 else "fall"
		if velocity.y > 0:
			anim = "fall"
		else:
			anim = "jump"
		
	else:
		#anim = "idle" if dir == 0 else "run"
		if dir == 0:
			anim = "idle"
		else:
			anim = "run"
			animated_sprite_2d.flip_h = dir < 0
			
		if Input.is_action_just_pressed("jump"):
			velocity.y = -JUMP
			audio_stream_player_2d.play()
	
	velocity.x = SPEED * dir	
	velocity.y = min(velocity.y, GRAVITY)
	
	move_and_slide()
	
	animated_sprite_2d.play(anim)
		
