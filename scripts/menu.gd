extends Node2D

func _on_start_button_pressed() -> void:
	await get_tree().create_timer(0.1).timeout 
	get_tree().change_scene_to_file("res://scenes/level.tscn")

func _on_settings_button_pressed() -> void:
	await get_tree().create_timer(0.1).timeout 
	get_tree().change_scene_to_file("res://scenes/settings.tscn")

func _on_quit_button_pressed() -> void:
	await get_tree().create_timer(0.1).timeout 
	get_tree().quit()
