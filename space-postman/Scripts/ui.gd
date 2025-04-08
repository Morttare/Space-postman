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
	
func vagrant_letter():
	letterText.text = str("2")
	letterText.visible = true

func clean():
	letterText.visible = false
	image.visible = false

func final_boss():
	letterText.text = str("10000000000000000000000")
	letterText.visible = true
	image.visible = true
