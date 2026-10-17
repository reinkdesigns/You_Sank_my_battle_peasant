#macro field_buffer 5
#macro boss_unit 5
#macro normal_unit 2

x=global.march_posistion[10].x
y=global.march_posistion[10].y

monster = 4
_x=x
_x_last = _x
_y = y
_y_last = _y

movement = 2
_start_speed = 5
attack_range = 3

_speed = _start_speed
_size = boss_unit

m_pos=10

facing=-1

count = 0
last_count = 0

image_speed = .5
dest_x=x
dest_y=y
max_distance = 50

child_unit = instance_create_layer(x,y,"Unit_Field",obj_enemy_field)

child_unit.parent_unit = id
child_unit.image_speed = image_speed

march = function(){
	if m_pos>movement m_pos = m_pos - movement else m_pos = 1
    dest_x = global.march_posistion[m_pos].x;
    dest_y = global.march_posistion[m_pos].y;
}

attack = function(){
	if m_pos<= attack_range{
	count = 4
	//do attack stuff
	}


}

alarm_set(0,5)