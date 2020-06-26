extends Node2D

export var xp_to_lvlup = 4
var current_xp = 0

func _ready():
	$HeartsUI.hearts = $YSort/Player/Hurtbox.health
	$HeartsUI.max_hearts = $YSort/Player/Hurtbox.max_health
	for enemy in $YSort/Enemies.get_children():
		if enemy.interactable:
			enemy.get_node("Hurtbox").connect("no_health", self, "_on_Enemy_dead")

func _on_Player_health_changed(value):
	$HeartsUI.hearts = value

func _on_Enemy_dead():
	$YSort/Player/Hurtbox.health += 1
	current_xp += 1
	if current_xp == xp_to_lvlup:
		$YSort/Player/Hurtbox.max_health += 1
		$HeartsUI.max_hearts += 1
	else:
		$HeartsUI.hearts += 1
