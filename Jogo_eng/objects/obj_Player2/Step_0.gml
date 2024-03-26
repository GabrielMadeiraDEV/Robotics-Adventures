/// @description Movimento

#region Controles
var key_right = keyboard_check(vk_right); // Move para a direita
var key_left = keyboard_check(vk_left); // Move para a esquerda
var key_down = keyboard_check(vk_down); // Agacha
var key_jump = keyboard_check(vk_up); // Pula
#endregion


// Lista de objetos para colisão
var collision_objects = ds_list_create();
ds_list_add(collision_objects, obj_wall);
ds_list_add(collision_objects, obj_Player1);
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
    // Pulo
    sprite_index = spr_p2jump;
    image_xscale = (hspd < 0) ? -1 : 1;
} else if (!is_jumping && vspd > 0) {
    // Queda
    sprite_index = spr_p2idle;
    image_xscale = (hspd < 0) ? -1 : 1;
} else if (on_ground) {
    if (key_right) {
        // Movimento para a direita
        sprite_index = spr_player2move;
        image_xscale = 1;
    } else if (key_left) {
        // Movimento para a esquerda
        sprite_index = spr_player2move;
        image_xscale = -1;
    } else {
        // Parado
        sprite_index = spr_p2idle;
       image_xscale=-1
    }
}

// Redimensionamento dos sprites
var desired_height = 164;
var yscale = desired_height / sprite_get_height(sprite_index);
image_yscale = yscale;
