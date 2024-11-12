programa
{
    // Jogo de Damas em Portugol

    // Variaveis globais
    inteiro tabuleiro[8][8] // Matriz que representa o tabuleiro com as pecas
    inteiro TAMANHO <- 8 // Tamanho do tabuleiro (8x8)

    // Inicializa o tabuleiro com as pecas na posicao inicial
    procedimento inicializarTabuleiro()
    {
        inteiro i, j
        para i de 0 ate TAMANHO - 1 faca
        {
            para j de 0 ate TAMANHO - 1 faca
            {
                se (i < 3) e ((i + j) % 2 != 0) entao // Pecas do jogador 1 (parte superior)
                {
                    tabuleiro[i][j] <- 1
                }
                senao_se (i >= TAMANHO - 3) e ((i + j) % 2 != 0) entao // Pecas do jogador 2 (parte inferior)
                {
                    tabuleiro[i][j] <- 2
                }
                senao
                {
                    tabuleiro[i][j] <- 0 // Espaco vazio
                }
            }
        }
    }

    // Exibe o tabuleiro na tela
    procedimento exibirTabuleiro()
    {
        inteiro i, j
        para i de 0 ate TAMANHO - 1 faca
        {
            para j de 0 ate TAMANHO - 1 faca
            {
                escolha (tabuleiro[i][j])
                    caso 1:
                        escreva(" O ")
                    caso 2:
                        escreva(" X ")
                    caso contrario:
                        escreva(" . ")
                fim_escolha
            }
            escreva("\n")
        }
    }

    // Verifica se o movimento e valido
    funcao logico movimentoValido(inteiro xOrigem, inteiro yOrigem, inteiro xDestino, inteiro yDestino, inteiro jogador)
    {
        // Verifica se o destino esta dentro dos limites e se esta vazio
        se (xDestino < 0 ou xDestino >= TAMANHO ou yDestino < 0 ou yDestino >= TAMANHO) entao
        {
            retorne falso
        }
        se (tabuleiro[xDestino][yDestino] != 0) entao
        {
            retorne falso
        }

        // Logica para permitir movimentos apenas para frente
        se (jogador == 1 e xDestino < xOrigem) entao
        {
            retorne falso
        }
        se (jogador == 2 e xDestino > xOrigem) entao
        {
            retorne falso
        }

        // Caso o movimento seja valido
        retorne verdadeiro
    }

    // Movimenta a peca se o movimento for valido
    procedimento moverPeca(inteiro xOrigem, inteiro yOrigem, inteiro xDestino, inteiro yDestino)
    {
        tabuleiro[xDestino][yDestino] <- tabuleiro[xOrigem][yOrigem] // Move a peca para o destino
        tabuleiro[xOrigem][yOrigem] <- 0 // Limpa a posicao de origem
    }

    // Funcao principal do jogo
    procedimento jogar()
    {
        inteiro xOrigem, yOrigem, xDestino, yDestino
        inteiro jogador <- 1 // Jogador inicial (1 para 'O', 2 para 'X')

        inicializarTabuleiro() // Configura o tabuleiro no inicio do jogo

        enquanto verdadeiro faca
        {
            limparTela()
            exibirTabuleiro()
            escreva("\nJogador ", jogador, ", e a sua vez.\n")

            // Recebe as coordenadas de origem e destino
            escreva("Digite a linha e coluna da peca que deseja mover (ex: 2 3): ")
            leia(xOrigem, yOrigem)
            escreva("Digite a linha e coluna do destino (ex: 3 4): ")
            leia(xDestino, yDestino)

            // Verifica se o movimento e valido e faz a jogada
            se (movimentoValido(xOrigem, yOrigem, xDestino, yDestino, jogador)) entao
            {
                moverPeca(xOrigem, yOrigem, xDestino, yDestino)
                
                // Troca de jogador
                se jogador == 1 entao
                {
                    jogador <- 2
                }
                senao
                {
                    jogador <- 1
                }
            }
            senao
            {
                escreva("\nMovimento invalido! Tente novamente.\n")
            }
        }
    }

    // Execucao do jogo
    jogar()
}
