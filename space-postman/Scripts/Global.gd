extends Node

var is_grandma_solved = false
var is_kela_solved = false
var current_planet = 0

var queue_number = 49

var letters = []

func reset_game():
	is_grandma_solved = false
	is_kela_solved = false
	current_planet = 0
	queue_number = 0
	letters = []
