if keyboard_check_released(vk_space){
	if the_march.step = 0{ //clickign this pings the enemy location and ends the turn
		the_march.step=1//march()
		global._ping_alpha = 1
	}
}