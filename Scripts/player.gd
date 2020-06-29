extends KinematicBody2D

export var speed = 300
onready var spr_player = $sprite

func _ready():
	pass

func _process(delta):
	var dir = Vector2()
	if Input.is_action_pressed("left"):
		dir.x = -1
		spr_player.flip_h = true
		$shape.position.x = -24.618
		
	if Input.is_action_pressed("right"):
		dir.x = 1
		spr_player.flip_h = false
		$shape.position.x = 22.618
		
	move_and_slide(dir * speed)

func _physics_process(delta):
	if position.x <= 63:
		position.x = 63
	if position.x >= 450:
		position.x = 450	
