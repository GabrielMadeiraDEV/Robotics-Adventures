/// @description Movimento

#region Controles
var key_right = keyboard_check(ord("D")); // Move para a direita
var key_left = keyboard_check(ord("A")); // Move para a esquerda
var key_down = keyboard_check(ord("S")); // Agacha
var key_jump = keyboard_check(ord("W")); // Pula
#endregion

#region Movimentação
var _move = key_right - key_left;
hspd = _move * spd;
vspd += grv;


// Verifica a colisão na direção vertical
if (place_meeting(x, y + vspd, obj_wall)) {
    while (!place_meeting(x, y + sign(vspd), obj_wall)) {
        y += sign(vspd);
    }
    vspd = 0;
}
y += vspd;

// Verifica a colisão na direção horizontal
if (place_meeting(x + hspd, y, obj_wall)) {
    while (!place_meeting(x + sign(hspd), y, obj_wall)) {
        x += sign(hspd);
    }
    hspd = 0;
}
x += hspd;

if (place_meeting(x, y + 1, obj_wall) && key_jump) {
    vspd -= 8;	
}
#endregion

#region Sprites
// Definir a largura e a altura desejadas
var desired_width = 64; // Substitua 64 pelo valor que você deseja
var desired_height = 64; // Substitua 64 pelo valor que você deseja

// Definir a escala desejada
var xscale = desired_width / sprite_get_width(sprite_index);
var yscale = desired_height / sprite_get_height(sprite_index);

// Aplicar a escala
image_xscale = xscale;
image_yscale = yscale;


// Alterar o sprite com base na velocidade horizontal (hspd)
if (hspd == 0) {
    sprite_index = spr_player1idlle; // Muda para o sprite de inatividade/} else if (hspd > 0) {
   
} else {
     sprite_index = spr_player1move; // Muda para o sprite de andar para a direita
}
#endregion
// Verifica se a vida do jogador chegou a 0

//idle animation :)
#region
if(keyboard_check(vk_anykey)){
	current_time = tempultpress;
	}
if(current_time - tempultpress>= templimpress){
	image_speed = 1;
}



