extends Control

@onready var letterText = get_node("LetterText")
@onready var pieceImage = get_node("PieceImage")
@onready var image = get_node("LetterImage")

func update_score():
	letterText.text = str(Global.letter_pieces) + str("/4")

func update_letters():
	image.visible = true
	letterText.visible = false
	pieceImage.visible = false
	
