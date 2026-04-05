extends Node

func hit(dealer : Unit, target : Unit) -> void:
	var damage = dealer.damage - target.armor
	
	if damage > 0:
		if target.health_current - damage <= 0:
			target.health_current = 0
			target.change_state("death")
		else:
			target.health_current -= damage
			
			if dealer == Global.player:
				target.focus = dealer
				target.call_for_help(dealer)
				
				if not target.state.name == "chase":
					target.change_state("chase")
		
		if dealer == Global.player:
			Global.ui.instantiate_damage_popup(damage, target)
