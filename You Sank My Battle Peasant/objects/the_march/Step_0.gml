all_busy = false
//with obj_enemy_field if busy other.all_busy = true
with obj_enemy_march if busy other.all_busy = true



if (step == 1)
{
    if (all_busy) exit;

    var i = resolve_index;

    var _ground_unit = instance_position(
        global.march_posistion[i].x,
        global.march_posistion[i].y,
        obj_enemy_march
    );

    var _float_unit = instance_position(
        global.march_posistion_float[i].x,
        global.march_posistion_float[i].y,
        obj_enemy_march
    );

    // Process one unit at a time.
    if (instance_exists(_ground_unit))
    {
        with (_ground_unit)
        {
            march()
        }

        if (all_busy) exit;
    }

    if (instance_exists(_float_unit))
    {
        with (_float_unit)
        {
            march()
        }

        if (all_busy) exit;
    }

    resolve_index++;
}


if (step == 2)
{
    if (all_busy) exit;

    var i = resolve_index;

    var _ground_unit = instance_position(
        global.march_posistion[i].x,
        global.march_posistion[i].y,
        obj_enemy_march
    );

    var _float_unit = instance_position(
        global.march_posistion_float[i].x,
        global.march_posistion_float[i].y,
        obj_enemy_march
    );

    if (instance_exists(_ground_unit))
    {
        with (_ground_unit)
        {
            attack()
        }

        if (all_busy) exit;
    }

    if (instance_exists(_float_unit))
    {
        with (_float_unit)
        {
            attack()
        }

        if (all_busy) exit;
    }

    resolve_index++;
}

if resolve_index >= array_length(global.march_posistion) && !all_busy {
	resolve_index = 0
	step ++
}

if (step == 3) {
	step = 0
	wild_magic_holder.wm_spr = call_wild_magic()
	next_spell_reload()
	click_controller.wild=0
}