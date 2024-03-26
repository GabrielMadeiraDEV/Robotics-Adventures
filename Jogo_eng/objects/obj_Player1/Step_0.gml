#region Controles
var key_right = keyboard_check(ord("D"));
var key_left = keyboard_check(ord("A"));
var key_down = keyboard_check(ord("S"));
var key_jump = keyboard_check(ord("W"));
#endregion
// Lista de objetos para colisão
var collision_objects = ds_list_create();
ds_list_add(collision_objects, obj_wall);
ds_list_add(collision_objects, obj_Player2);
ds_list_add(collision_objects, obj_Wood); // Adicione todos os objetos desejados

#region Movimentação
var _move = key_right - key_left;
hspd = _move * spd;
if (!place_meeting_any(x + hspd, y, collision_objects)) {
    x += hspd;
}

if (vspd < 10) vspd += grv; // Limita a velocidade de queda

// Colisão vertical
if (place_meeting_any(x, y + vspd,collision_objects)) {
    while (!place_meeting_any(x, y + sign(vspd), collision_objects)) {
        y += sign(vspd);
    }
    vspd = 0;
}
y += vspd;


#endregion

// Variáveis de estado
var on_ground = place_meeting_any(x, y + 1, collision_objects);
var is_jumping = false;
var move_delay = 0; // Temporizador para atrasar a transição para a animação de inatividade

// Lógica de pulo
if (key_jump && on_ground) {
    vspd = -15;
    is_jumping = true;
}

// Atualização de estado
if (on_ground && vspd == 0) {
    is_jumping = false;
    if (move_delay == 0 && !key_left && !key_right) {
        move_delay = 2; // Inicia o temporizador quando o personagem toca o chão sem movimento horizontal
    }
}

// Atualização do temporizador
if (move_delay > 0 && !key_left && !key_right) {
    move_delay -= 1; // Decrementa o temporizador se não houver entrada de movimento horizontal
}

// Lógica de animação
if (is_jumping || vspd < 0) {
    sprite_index = spr_p1jump;
    image_xscale = (hspd < 0) ? -1 : 1;
} else if (!is_jumping && vspd > 0) {
    sprite_index = spr_p1idle;
    image_xscale = (hspd < 0) ? -1 : 1;
} 
    

else {
	if(on_ground){
        sprite_index = spr_p1idle;
        image_xscale = 1;
	}
	if (key_right&&on_ground) {
        sprite_index = spr_player1move;
        image_xscale = 1;
    } else if (key_left&&on_ground) {
        sprite_index = spr_player1move;
        image_xscale = -1;
    } 
    }
// Redimensionamento dos sprites
var desired_height = 164;
var yscale = desired_height / sprite_get_height(sprite_index);
image_yscale = yscale;
