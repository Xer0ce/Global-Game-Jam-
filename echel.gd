# Script pour l'échelle Area2D
extends Area2D

func _on_body_entered(body):
	if body is CharacterBody2D:  # Vérifiez si l'area est bien votre personnage
		body.on_echelle = true

func _on_body_exited(body):
	if body is CharacterBody2D:  # Vérifiez si l'area est bien votre personnage
		body.on_echelle = false
