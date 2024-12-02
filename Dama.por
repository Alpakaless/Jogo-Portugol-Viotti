programa {
// import libraries
inclua biblioteca Util

// global vars
const inteiro tamanho = 8
const cadeia pecaPreta = "◙", pecaBranca = "○", 
controleDoTabuleiroVertical[9] = {"  ", "A", "B", "C", "D", "E", "F", "G", "H"}, 
controleDoTabuleiroHorizontal[8] = {"1", "2", "3", "4", "5", "6", "7", "8"}
cadeia pecaJogador = "", pecaMaquina = "", ultimaJogadaVertical = "1", ultimaJogadaHorizontal = "1", ultimaPecaVertical = "1", ultimaPecaHorizontal = "1", tabuleiro[8][8]
inteiro vez = 11 // 0 = player | 1 = bot
logico continuaJogo = verdadeiro
// start aplication
funcao inicio(){
	escolhePeca()
	enquanto(continuaJogo){
		se(vez == 0){
			escolheAcao()
			vez = 1
		}senao{
			acaoDaMaquina()
			vez = 0
		}
	}
}

// get player and bot pieces
funcao escolhePeca(){
	cadeia peca = ""
	enquanto(peca == "" e (peca != "1" ou peca != "2")){
		escreval("Selecione suas peças...", 2, verdadeiro)
		escreval("1) Brancas ○", 1, falso)
		escreval("2) Pretas ◙", 1, falso)
		leia(peca)
	}
	se(cadeiaParaInteiro(peca) == 1){
		pecaJogador = "○"
		pecaMaquina = "◙"
		vez = 0
	}senao{
		pecaJogador = "◙"
		pecaMaquina = "○"
		vez = 1
	}

	para(inteiro vertical = 0; vertical < tamanho; vertical++){
          para(inteiro horizontal = 0; horizontal < tamanho; horizontal++){
            se(vertical < 3){
              peca = pecaMaquina
            }senao se(vertical > 4){
              peca = pecaJogador
            }senao{
              peca = " "
            }
            se(vertical % 2 == 0){
                se(horizontal % 2 != 0){
                  tabuleiro[vertical][horizontal] = peca
                }senao{
                  tabuleiro[vertical][horizontal] = " "
                }
              }senao{
                se(horizontal % 2 == 0){
                  tabuleiro[vertical][horizontal] = peca
                }senao{
                  tabuleiro[vertical][horizontal] = " "
                }
              }
          }
        }
        limpa()
}

// render the board
funcao renderizaTabuleiro(){
	para(inteiro vertical = 0; vertical <= tamanho; vertical++){
          escreva(controleDoTabuleiroVertical[vertical])
          para(inteiro horizontal = 0; horizontal < tamanho; horizontal++){
            se(vertical == 0){
                escreva("  " + controleDoTabuleiroHorizontal[horizontal] + " ")
              }senao{
                  escreva(" | ")
                  escreva(tabuleiro[vertical - 1][horizontal])
                  se(horizontal == 7){
                      escreva(" | ")
                  }
              }
          }
          escreva("\n")
        }
	escreva("\n")
}

// choice player actions
funcao escolheAcao(){
	ultimaPecaVertical = "1"
	ultimaPecaHorizontal = "1"
	ultimaJogadaVertical = "1"
	ultimaJogadaHorizontal = "1"
	escreval("Sua Vez...", 2, verdadeiro)
	escreval("Escolha sua peça...", 2, verdadeiro)
	enquanto(validaAcao("peca")){ // verificação de conteúdo na casa
		escreval("Ultima Peça Selecionada: \n Posição Vertical " + ultimaPecaVertical + " | Posição Horizontal " + ultimaPecaHorizontal, 2, falso)
		renderizaTabuleiro()
		escreval("Selecione uma peça:", 1, falso)
		escreval("Posição Vertical. A, B, C, D, E, F, G, H...", 0, falso)
		leia(ultimaPecaVertical)
		escreval("Posição Horizontal... 1, 2, 3, 4, 5, 6, 7, 8", 0, falso)
		leia(ultimaPecaHorizontal)
		limpa()
		
		escreval("Peça inválida...", 1, verdadeiro)
		escreval("Escolha sua peça...", 2, falso)
	}
	limpa()
	escreval("Sua Vez...", 2, falso)
	escreval("Faça sua Jogada...", 2, verdadeiro)

	enquanto(validaAcao("jogada")){
		escreval("Peça selecionada: \n Posição Vertical " + ultimaPecaVertical + " | Posição Horizontal " + ultimaPecaHorizontal, 2, falso)
		escreval("Ultima Jogada: \n Posição Vertical " + ultimaJogadaVertical + " | Posição Horizontal " + ultimaJogadaHorizontal, 2, falso)
		renderizaTabuleiro()
		escreval("Selecione uma casa:", 1, falso)
		escreval("Posição Vertical. A, B, C, D, E, F, G, H...", 0, falso)
		leia(ultimaJogadaVertical)
		escreval("Posição Horizontal... 1, 2, 3, 4, 5, 6, 7, 8", 0, falso)
		leia(ultimaJogadaHorizontal)
		limpa()
		escreval("Posição inválida...", 1, verdadeiro)
		escreval("Faça sua Jogada...", 2, falso)
	}
	limpa()
	tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-1][cadeiaParaInteiro(ultimaPecaHorizontal)-1] = " "
	tabuleiro[cadeiaParaInteiro(ultimaJogadaVertical)-1][cadeiaParaInteiro(ultimaJogadaHorizontal)-1] = pecaJogador
	
}

// verification player action
funcao logico validaAcao(cadeia tipo){
	se(tipo == "peca"){
		se((cadeiaParaInteiro(ultimaPecaVertical) < 1 e cadeiaParaInteiro(ultimaPecaVertical) > 7) ou // verificação de limite do tabuleiro vertical
			(cadeiaParaInteiro(ultimaPecaHorizontal) < 1 e cadeiaParaInteiro(ultimaPecaHorizontal) > 7) ou // verificação de limite do tabuleiro horizontal
			tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-1][cadeiaParaInteiro(ultimaPecaHorizontal)-1] != pecaJogador){ // verificação de peça !== peça do jogador
				retorne verdadeiro // mantem enquanto
			}senao{
				retorne falso // encerra enquanto
			}	
	}senao se(tipo == "jogada"){
		se((cadeiaParaInteiro(ultimaJogadaVertical) < 1 e cadeiaParaInteiro(ultimaJogadaVertical) > 7) ou // verificação de limite do tabuleiro vertical
			(cadeiaParaInteiro(ultimaJogadaHorizontal) < 1 e cadeiaParaInteiro(ultimaJogadaHorizontal) > 7) ou // verificação de limite do tabuleiro horizontal
			(cadeiaParaInteiro(ultimaPecaVertical) == 1 e  cadeiaParaInteiro(ultimaJogadaVertical) <= 1) ou // verificação de limite minimo do tabuleiro vertical
			(cadeiaParaInteiro(ultimaPecaVertical) == 8 e  cadeiaParaInteiro(ultimaJogadaVertical) >= 8) ou // verificação de limite maximo do tabuleiro vertical
			(cadeiaParaInteiro(ultimaPecaHorizontal) == 1 e  cadeiaParaInteiro(ultimaJogadaHorizontal) <= 1) ou // verificação de limite minimo do tabuleiro horizontal
			(cadeiaParaInteiro(ultimaPecaHorizontal) == 8 e  cadeiaParaInteiro(ultimaJogadaHorizontal) >= 8) ou // verificação de limite maximo do tabuleiro horizontal
			((cadeiaParaInteiro(ultimaPecaVertical)+1 != cadeiaParaInteiro(ultimaJogadaVertical) e // verificação da distancia Peça <--> Jogada
			cadeiaParaInteiro(ultimaPecaVertical)-1 != cadeiaParaInteiro(ultimaJogadaVertical)) e
			(cadeiaParaInteiro(ultimaPecaHorizontal)-1 != cadeiaParaInteiro(ultimaJogadaHorizontal) e //
			cadeiaParaInteiro(ultimaPecaHorizontal)+1 != cadeiaParaInteiro(ultimaJogadaHorizontal))) ou //
			(tabuleiro[cadeiaParaInteiro(ultimaJogadaVertical)-1][cadeiaParaInteiro(ultimaJogadaHorizontal)-1] != " ")) // verificação do conteúdo
			{
			retorne verdadeiro // mantem enquanto
		}senao{
			retorne falso // encerra enquanto
			}
	}senao {
		retorne verdadeiro
	}
}

// verification bot action
funcao logico validaMaquinaAcao(cadeia tipo){
	se(tipo == "peca"){
		se((cadeiaParaInteiro(ultimaPecaVertical) < 1 e cadeiaParaInteiro(ultimaPecaVertical) > 7) ou // verificação de limite do tabuleiro vertical
			(cadeiaParaInteiro(ultimaPecaHorizontal) < 1 e cadeiaParaInteiro(ultimaPecaHorizontal) > 7) ou // verificação de limite do tabuleiro horizontal
			tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-1][cadeiaParaInteiro(ultimaPecaHorizontal)-1] != pecaMaquina){ // verificação de peça !== peça do jogador
				retorne verdadeiro // mantem enquanto
			}senao{
				retorne falso // encerra enquanto
			}	
	}senao se(tipo == "jogada"){
		se((cadeiaParaInteiro(ultimaJogadaVertical) < 1 e cadeiaParaInteiro(ultimaJogadaVertical) > 7) ou // verificação de limite do tabuleiro vertical
			(cadeiaParaInteiro(ultimaJogadaHorizontal) < 1 e cadeiaParaInteiro(ultimaJogadaHorizontal) > 7) ou // verificação de limite do tabuleiro horizontal
			(cadeiaParaInteiro(ultimaPecaVertical) == 1 e  cadeiaParaInteiro(ultimaJogadaVertical) <= 1) ou // verificação de limite minimo do tabuleiro vertical
			(cadeiaParaInteiro(ultimaPecaVertical) == 8 e  cadeiaParaInteiro(ultimaJogadaVertical) >= 8) ou // verificação de limite maximo do tabuleiro vertical
			(cadeiaParaInteiro(ultimaPecaHorizontal) == 1 e  cadeiaParaInteiro(ultimaJogadaHorizontal) <= 1) ou // verificação de limite minimo do tabuleiro horizontal
			(cadeiaParaInteiro(ultimaPecaHorizontal) == 8 e  cadeiaParaInteiro(ultimaJogadaHorizontal) >= 8) ou // verificação de limite maximo do tabuleiro horizontal
			((cadeiaParaInteiro(ultimaPecaVertical)+1 != cadeiaParaInteiro(ultimaJogadaVertical) e // verificação da distancia Peça <--> Jogada
			cadeiaParaInteiro(ultimaPecaVertical)-1 != cadeiaParaInteiro(ultimaJogadaVertical)) e
			(cadeiaParaInteiro(ultimaPecaHorizontal)-1 != cadeiaParaInteiro(ultimaJogadaHorizontal) e //
			cadeiaParaInteiro(ultimaPecaHorizontal)+1 != cadeiaParaInteiro(ultimaJogadaHorizontal))) ou //
			(tabuleiro[cadeiaParaInteiro(ultimaJogadaVertical)-1][cadeiaParaInteiro(ultimaJogadaHorizontal)-1] != " ")) // verificação do conteúdo
			{ 
			retorne verdadeiro // mantem enquanto
		}senao{
			retorne falso // encerra enquanto
			}
	}senao {
		retorne verdadeiro
	}
}

funcao acaoDaMaquina(){
	ultimaPecaVertical = "1"
	ultimaPecaHorizontal = "1"
	ultimaJogadaVertical = "1"
	ultimaJogadaHorizontal = "1"
	enquanto(validaMaquinaAcao("peca")){ // verificação de conteúdo na casa
		ultimaPecaVertical = inteiroParaCadeia(Util.sorteia(1, 7))
		ultimaPecaHorizontal = inteiroParaCadeia(Util.sorteia(1, 7))
	}
	enquanto(validaMaquinaAcao("jogada")){
		ultimaJogadaVertical = inteiroParaCadeia(Util.sorteia(1, 7))
		ultimaJogadaHorizontal = inteiroParaCadeia(Util.sorteia(1, 7))
	}
	tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-1][cadeiaParaInteiro(ultimaPecaHorizontal)-1] = " "
	tabuleiro[cadeiaParaInteiro(ultimaJogadaVertical)-1][cadeiaParaInteiro(ultimaJogadaHorizontal)-1] = pecaMaquina
}

// convert string to integer
funcao inteiro cadeiaParaInteiro(cadeia texto){
	se(texto == "1" ou texto == "a" ou texto == "A"){
        retorne 1
      }senao se(texto == "2" ou texto == "b" ou texto == "B"){
        retorne 2
      }senao se(texto == "3" ou texto == "c" ou texto == "C"){
        retorne 3
      }senao se(texto == "4" ou texto == "d" ou texto == "D"){
        retorne 4
      }senao se(texto == "5" ou texto == "e" ou texto == "E"){
        retorne 5
      }senao se(texto == "6" ou texto == "f" ou texto == "F"){
        retorne 6
      }senao se(texto == "7" ou texto == "g" ou texto == "G"){
        retorne 7
      }senao se(texto == "8" ou texto == "h" ou texto == "H"){
        retorne 8
      }senao se(texto == "9" ou texto == "i" ou texto == "I"){
        retorne 9
      }senao{
        retorne 11
      }	
}

// convert integer to string
funcao cadeia inteiroParaCadeia(inteiro numero){
	se(numero == 1){
        retorne "1"
      }senao se(numero == 2){
        retorne "2"
      }senao se(numero == 3){
        retorne "3"
      }senao se(numero == 4){
        retorne "4"
      }senao se(numero == 5){
        retorne "5"
      }senao se(numero == 6){
        retorne "6"
      }senao se(numero == 7){
        retorne "7"
      }senao se(numero == 8){
        retorne "8"
      }senao se(numero == 9){
        retorne "9"
      }senao se(numero == 10){
        retorne "10"
      }senao{
        retorne "11"
      }	
}


// easily text format
funcao escreval(cadeia texto, inteiro quantidade, logico formatado){
	cadeia textoComQuebraDeLinha = ""

	se(formatado){
		textoComQuebraDeLinha += "================================================ \n"
	}
	
	textoComQuebraDeLinha += texto + "\n"
	
	se(formatado){
		textoComQuebraDeLinha += "================================================ \n"
	}
	para(inteiro i = 1; i <= quantidade; i++){
		textoComQuebraDeLinha += "\n"
	}
	
	escreva(textoComQuebraDeLinha)
}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 9540; 
 * @DOBRAMENTO-CODIGO = [243, 271];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */