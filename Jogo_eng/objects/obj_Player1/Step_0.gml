#region Controles
var key_right = keyboard_check(ord("D"));
var key_left = keyboard_check(ord("A"));
var key_down = keyboard_check(ord("S"));
var key_jump = keyboard_check(ord("W"));
#endregion

#region Movimentação
var _move = key_right - key_left;
hspd = _move * spd;
if (!place_meeting(x + hspd, y, obj_wall)) {
    x += hspd;
}

if (vspd < 10) vspd += grv; // Limita a velocidade de queda

// Colisão vertical
if (place_meeting(x, y + vspd, obj_wall)) {
    while (!place_meeting(x, y + sign(vspd), obj_wall)) {
        y += sign(vspd);
    }
    vspd = 0;
}
y += vspd;

// Pulo
if (place_meeting(x, y + 1, obj_wall) && key_jump) {
    vspd = -8;
}
#endregion

#region Sprites
// Atualiza o sprite do jogador baseado na direção do movimento
if (key_right) {
    sprite_index = spr_player1move; // Sprite de movimento para a direita
    image_xscale = 1; // Sem espelhamento
} else if (key_left) {
    sprite_index = spr_player1move; // Sprite de movimento para a esquerda
    image_xscale = -1; // Espelhamento horizontal
} //else if (key_down) {
   // sprite_index = spr_player1move; // Substitua por um sprite de agachar, se houver
    // Não esqueça de ajustar a colisão para o estado agachado
//}
else {
    sprite_index = spr_p1idlle; // Sprite de inatividade
    image_xscale = 1; // Sem espelhamento
}

// Redimensionamento dos sprites
//var desired_width = 164;
var desired_height = 164;
//var xscale = desired_width / sprite_get_width(sprite_index);
var yscale = desired_height / sprite_get_height(sprite_index);
//image_xscale *= xscale;
image_yscale = yscale;
#endregion
