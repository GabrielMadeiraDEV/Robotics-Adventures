// Reduz a vida do jogador
// Verifica a invulnerabilidade antes de causar dano
if (invulnerabilidade <= 0) {
   vidap2 -= 1;
   vida2=vidap2;
   invulnerabilidade = 25; // 60 steps é aproximadamente 1 segundo
}

// Atualiza a variável de tempo de invulnerabilidade
if (invulnerabilidade > 0) {
    invulnerabilidade -= 1;
}
