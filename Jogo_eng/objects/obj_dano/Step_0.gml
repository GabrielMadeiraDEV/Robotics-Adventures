var dano_list = ds_list_create();
ds_list_add(dano_list, obj_obs1); // Adicione todos os objetos que você quer verificar
// Percorre a lista de objetos
for (var i = 0; i < ds_list_size(dano_list); i++) {
    var obj = dano_list[| i];
    var player = instance_place(x, y, obj);

    if (player != noone) {
        if (invulnerabilidade <= 0.1) {
            if (player.object_index == obj_Player1) {
                vidap1 -= 1;
                vida1 = vidap1;
            } else if (player.object_index == obj_Player2) {
                vidap2 -= 1;
                vida2 = vidap2;
            }
            invulnerabilidade = 1.8; 
        } else if (invulnerabilidade > 0.1) {
            invulnerabilidade -= 1;
        }
    }
}