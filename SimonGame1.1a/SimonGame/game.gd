extends Node2D

@onready var btnVermelho = $ButtonVermelho
@onready var btnAmarelo = $ButtonAmarelo
@onready var btnAzul = $ButtonAzul
@onready var btnVerde = $ButtonVerde

@onready var title = $RichTextLabel
@onready var gameBlocker = $gameBlocker


var jogando = false
var vezDeJogar = false
var cores = [Color.BLUE, Color.RED, Color.YELLOW, Color.GREEN]
var ordemDoJogo = []
@onready var conexaoBotoes = {Color.BLUE : btnAzul, Color.RED : btnVermelho, Color.YELLOW : btnAmarelo, Color.GREEN : btnVerde}
@onready var highlighted = {btnAzul : Color.LIGHT_BLUE, btnVermelho : Color(1,0.5,0.5,1), btnAmarelo : Color.LIGHT_YELLOW, btnVerde : Color(0.6,1,0.6,1)}

var currentInSequence = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func addToSequence():
	var nColor = cores.pick_random()
	ordemDoJogo.append(nColor)
	return nColor

func gameCycle():
	print("novo ciclo eba")
	visible = true
	await get_tree().create_timer(0.5).timeout
	jogando = true
	addToSequence()
	highlightSequence()
	await get_tree().create_timer(len(ordemDoJogo) - 0.2).timeout
	print("pode jogar")
	currentInSequence = 0
	vezDeJogar = true

	

func highlightSequence():
	vezDeJogar = false
	for ordem in ordemDoJogo:
		var botaoAtual = conexaoBotoes[ordem]
		print(conexaoBotoes)
		botaoAtual.get_child(0).color = highlighted[botaoAtual]
		await get_tree().create_timer(0.5).timeout
		botaoAtual.get_child(0).color = ordem
		await get_tree().create_timer(0.5).timeout
	vezDeJogar = true

func _on_game_button_pressed(btnColor):
	print("botao apertado")
	if vezDeJogar and jogando:
		print(btnColor)
		print(str(ordemDoJogo[currentInSequence]))
		
		var botaoAtual = conexaoBotoes[btnColor]
		botaoAtual.get_child(0).color = highlighted[botaoAtual]
		await get_tree().create_timer(0.1).timeout
		botaoAtual.get_child(0).color = btnColor
		
		
		if btnColor == ordemDoJogo[currentInSequence]:
			currentInSequence += 1
			if !(currentInSequence >= len(ordemDoJogo)):
				print("acertouuu boa")
				
				
			else:
				print("acabou a sequencia")
				vezDeJogar = false
				gameCycle()
		else:
			print("errrouu")
			title.text = "Errou!"
			jogando = false
			gameBlocker.visible = true
			var tween1 = get_tree().create_tween()
			tween1.tween_property(gameBlocker.get_child(1), "modulate", Color(1,1,1,0.9), 30)
			while true:
				var tween = get_tree().create_tween()
				tween.tween_property(gameBlocker.get_child(0), "rotation", 0.5, 1)
				await get_tree().create_timer(1).timeout
				var tween2 = get_tree().create_tween()
				tween2.tween_property(gameBlocker.get_child(0), "rotation", -0.5, 1)
				await get_tree().create_timer(1).timeout
	
