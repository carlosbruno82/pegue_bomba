extends Area2D

export var speed = 200
var t_smoke = 0

onready var pre_smoke = preload("res://Scenes/smoke.tscn")
onready var pre_fumaca = preload("res://Scenes/fumaca.tscn")
onready var pre_explosao = preload("res://Scenes/explosao.tscn")

func _ready():
	pass

func _process(delta):
	t_smoke += delta
	if t_smoke > (rand_range(0.1, 0.2)):
		criar_smoke()
		t_smoke = 0	
	
	self.position.y += speed * delta
	if self.position.y > 700:
		self.queue_free()


func _on_bomba_body_entered(body):
	if body.name == "player":
		self.queue_free()
		get_parent().pontos += 10 
		emitir_fumaca()


func _on_bomba_area_entered(area):
	if area.name == "chao":
		self.queue_free()
		self.get_parent().pontos -= 10
		emitir_explosao()

func criar_smoke():
	var smoke = pre_smoke.instance()
	smoke.position = position + Vector2(rand_range(-16, -25 ), -20)
	get_parent().add_child(smoke)

func emitir_fumaca():
	var fumaca = pre_fumaca.instance()
	fumaca.position = self.position
	get_parent().add_child(fumaca)

func emitir_explosao():
	var explosao = pre_explosao.instance()
	explosao.position = self.position
	get_parent().add_child(explosao)
