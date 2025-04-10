extends Node

var is_grandma_solved = false
var is_kela_solved = false
var current_planet = 0
var letter_pieces = 0
var is_allowed_to_move = true

var queue_number = 49

var letters = []

func reset_game():
	is_grandma_solved = false
	is_kela_solved = false
	current_planet = 0
	letter_pieces = 0
	is_allowed_to_move = true
	queue_number = 49
	letters = []
