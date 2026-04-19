extends Node

func hit(dealer : Unit, target : Unit) -> void:
	var damage = randi_range(dealer.damage_lower, dealer.damage_upper)
	damage -= target.armor
	
	if randi()%100 < dealer.critical:
		damage *= 2
	
	if damage > 0:
		if target.stats.health_current - damage <= 0:
			target.stats.health_current = 0
			target.change_state("death")
		else:
			target.stats.health_current -= damage
			
			if dealer == Global.player:
				target.focus = dealer
				target.call_for_help(dealer)
				
				if not target.state.name == "chase":
					target.change_state("chase")
		
		if dealer == Global.player:
			Global.ui.instantiate_damage_popup(damage, target)
