extends Area2D

@export var health_component : HealthComponent

func damage(attack: Attack):
	if health_component:
		attack.attack()
