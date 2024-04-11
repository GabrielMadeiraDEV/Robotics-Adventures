/// @description Inserir descrição aqui
spd=5;
hspd=0;
vspd=0;
grv=0.4;

vidap2=6
globalvar vida2;
vida2=6




// Função para verificar colisão com qualquer objeto na lista
function place_meeting_any(_x, _y, _obj_list) {
    for (var i = 0; i < ds_list_size(_obj_list); i++) {
        if (place_meeting(_x, _y, _obj_list[| i])) {
            return true;
        }
    }
    return false;
}