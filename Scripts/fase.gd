extends Node2D

var pre_bomba = preload("res://Scenes/bomba.tscn")
var tempo = 0
export var ini = 0.5
export var fim = 1
onready var txt_label = $label
var pontos = 0

func _ready():
	pass

func _process(delta):
	txt_label.text = "Pontos: " + str(pontos)
	tempo += delta
	if tempo > rand_range(ini, fim):
		self.criar_bomba()
		tempo = 0

func criar_bomba():  
	var bomba = pre_bomba.instance() # uma cópia
	bomba.position = Vector2(rand_range(30, 490), 0)
	self.add_child(bomba) #add a instância criada...
