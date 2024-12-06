programa {
// import libraries
inclua biblioteca Util

// global vars
const inteiro tamanho = 8
const cadeia pecaPreta = "◙", pecaBranca = "○", 
controleDoTabuleiroVertical[9] = {"  ", "A", "B", "C", "D", "E", "F", "G", "H"}, 
controleDoTabuleiroHorizontal[8] = {"1", "2", "3", "4", "5", "6", "7", "8"}
cadeia pecaJogador = "", pecaMaquina = "", ultimaJogadaVertical = "1", ultimaJogadaHorizontal = "1", ultimaPecaVertical = "1", ultimaPecaHorizontal = "1", tabuleiro[8][8]
inteiro vez = 11, casaAComer = -1 // 0 = player | 1 = bot
logico continuaJogo = verdadeiro, comerPeca = falso
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
	ultimaPecaVertical = "x"
	ultimaPecaHorizontal = "x"
	ultimaJogadaVertical = "x"
	ultimaJogadaHorizontal = "x"
	
	escreval("Sua Vez...", 2, verdadeiro)
	escreval("Escolha sua peça...", 2, falso)
	enquanto(validaAcao("peca")){ // verificação de conteúdo na casa
		renderizaTabuleiro()
		escreval("Selecione uma peça:", 1, falso)
		escreval("Posição Vertical. A, B, C, D, E, F, G, H...", 0, falso)
		leia(ultimaPecaVertical)
		escreval("Posição Horizontal... 1, 2, 3, 4, 5, 6, 7, 8", 0, falso)
		leia(ultimaPecaHorizontal)
	//	limpa()
		escreval("Peça inválida...", 1, verdadeiro)
		escreval("Escolha sua peça...", 2, falso)
	}
	
	//limpa()
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
		escreval("Posição inválida...", 1, verdadeiro)
		escreval("Faça sua Jogada...", 2, falso)
	}
	escreva("comerPeca >" + comerPeca + "< \n") 
	tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-1][cadeiaParaInteiro(ultimaPecaHorizontal)-1] = " "
	se(comerPeca == verdadeiro){
		tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-2][casaAComer] = " "
	}
	
	tabuleiro[cadeiaParaInteiro(ultimaJogadaVertical)-1][cadeiaParaInteiro(ultimaJogadaHorizontal)-1] = pecaJogador
	comerPeca = falso
	renderizaTabuleiro()
}

// verification player action
funcao logico validaAcao(cadeia tipo){
	//escreva("tipo "+ tipo + "\n")
	se(tipo == "peca"){
		//escreva("enquanto peca" + "\n")
		se(ultimaPecaVertical == "x" ou ultimaPecaHorizontal == "x" ou
		(ultimaPecaVertical != "a" e ultimaPecaVertical != "b" e ultimaPecaVertical != "c" e ultimaPecaVertical != "d" e ultimaPecaVertical != "e" e ultimaPecaVertical != "f" e ultimaPecaVertical != "g" e ultimaPecaVertical != "h") ou
		(ultimaPecaHorizontal != "1" e ultimaPecaHorizontal != "2" e ultimaPecaHorizontal != "3" e ultimaPecaHorizontal != "4" e ultimaPecaHorizontal != "5" e ultimaPecaHorizontal != "6" e ultimaPecaHorizontal != "7" e ultimaPecaHorizontal != "8")){
			retorne verdadeiro
		}
		se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-1][cadeiaParaInteiro(ultimaPecaHorizontal)-1] == pecaJogador){
          	se(cadeiaParaInteiro(ultimaPecaHorizontal) > 1 e cadeiaParaInteiro(ultimaPecaHorizontal) <= 7){
				se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-1-1][cadeiaParaInteiro(ultimaPecaHorizontal)-1+1] == pecaMaquina e
				cadeiaParaInteiro(ultimaPecaHorizontal) < 6){
					se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-1-2][cadeiaParaInteiro(ultimaPecaHorizontal)-1+2] == " "){
						retorne falso
					}
				}
				
				se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-1-1][cadeiaParaInteiro(ultimaPecaHorizontal)-1-1] == pecaMaquina e
				cadeiaParaInteiro(ultimaPecaHorizontal) > 2){
					se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-1-2][cadeiaParaInteiro(ultimaPecaHorizontal)-1-2] == " "){
						retorne falso
					}
				}
          		se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-1-1][cadeiaParaInteiro(ultimaPecaHorizontal)-1+1] == " "){
					retorne falso
				}
				se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-1-1][cadeiaParaInteiro(ultimaPecaHorizontal)-1-1] == " "){
					retorne falso
				}
          	}senao se(cadeiaParaInteiro(ultimaPecaHorizontal) == 1){
          		se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-1-1][cadeiaParaInteiro(ultimaPecaHorizontal)-1+1] == pecaMaquina e
				tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-1-2][cadeiaParaInteiro(ultimaPecaHorizontal)-1+2] == " "){
					retorne falso
				}
				se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-1-1][cadeiaParaInteiro(ultimaPecaHorizontal)-1+1] == " "){
					retorne falso
				}
          	}senao se(cadeiaParaInteiro(ultimaPecaHorizontal) == 8){
          		se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-1-1][cadeiaParaInteiro(ultimaPecaHorizontal)-1-1] == pecaMaquina e
				tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-1-2][cadeiaParaInteiro(ultimaPecaHorizontal)-1-2] == " "){
					retorne falso
				}
				se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-1-1][cadeiaParaInteiro(ultimaPecaHorizontal)-1-1] == " "){
					retorne falso
				}
          	}
          }
	}senao se(tipo == "jogada"){
		escreva("enquanto jogada \n")
		se(ultimaJogadaVertical == "x" ou ultimaJogadaHorizontal == "x" ou
		(ultimaJogadaVertical != "a" e ultimaJogadaVertical != "b" e ultimaJogadaVertical != "c" e ultimaJogadaVertical != "d" e ultimaJogadaVertical != "e" e ultimaJogadaVertical != "f" e ultimaJogadaVertical != "g" e ultimaJogadaVertical != "h") ou
		(ultimaJogadaHorizontal != "1" e ultimaJogadaHorizontal != "2" e ultimaJogadaHorizontal != "3" e ultimaJogadaHorizontal != "4" e ultimaJogadaHorizontal != "5" e ultimaJogadaHorizontal != "6" e ultimaJogadaHorizontal != "7" e ultimaJogadaHorizontal != "8")){
			retorne verdadeiro
		}
		se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-1][cadeiaParaInteiro(ultimaPecaHorizontal)-1] == pecaJogador){
			se(cadeiaParaInteiro(ultimaPecaHorizontal) > 1 e cadeiaParaInteiro(ultimaPecaHorizontal) <= 7){
				//escreva("come direita \n")
				se(cadeiaParaInteiro(ultimaJogadaHorizontal) < 6 e
				tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-2][cadeiaParaInteiro(ultimaPecaHorizontal)-2] == pecaMaquina e
				tabuleiro[cadeiaParaInteiro(ultimaJogadaVertical)-1][cadeiaParaInteiro(ultimaJogadaHorizontal)-1] == " "){
					casaAComer = cadeiaParaInteiro(ultimaPecaHorizontal)-2
					comerPeca = verdadeiro
					retorne falso
				}

				//escreva("come esquerda \n")
				se(cadeiaParaInteiro(ultimaJogadaHorizontal) > 2 e 
				tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-2][cadeiaParaInteiro(ultimaPecaHorizontal)] == pecaMaquina e
				tabuleiro[cadeiaParaInteiro(ultimaJogadaVertical)-1][cadeiaParaInteiro(ultimaJogadaHorizontal)-1] == " "){
					casaAComer = cadeiaParaInteiro(ultimaPecaHorizontal)
					comerPeca = verdadeiro
					retorne falso
				}
          		se(tabuleiro[cadeiaParaInteiro(ultimaJogadaVertical)-1][cadeiaParaInteiro(ultimaJogadaHorizontal)+1] == " "){
					retorne falso
				}
				se(tabuleiro[cadeiaParaInteiro(ultimaJogadaVertical)-1][cadeiaParaInteiro(ultimaJogadaHorizontal)-1] == " "){
					retorne falso
				}
          	}senao se(cadeiaParaInteiro(ultimaPecaHorizontal) == 1){
          		escreva("come direita \n")
          		se(cadeiaParaInteiro(ultimaJogadaHorizontal) > 2 e tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-2][cadeiaParaInteiro(ultimaPecaHorizontal)-2] == pecaMaquina e
				tabuleiro[cadeiaParaInteiro(ultimaJogadaVertical)-1][cadeiaParaInteiro(ultimaJogadaHorizontal)-1] == " "){
					casaAComer = cadeiaParaInteiro(ultimaPecaHorizontal)-2
					comerPeca = verdadeiro
					retorne falso
				}
				escreva("anda direita \n")
				se(tabuleiro[cadeiaParaInteiro(ultimaJogadaVertical)-1][cadeiaParaInteiro(ultimaJogadaHorizontal)-1] == " "){
					retorne falso
				}
          	}senao se(cadeiaParaInteiro(ultimaPecaHorizontal) == 8){
          		escreva("come esquerda \n")
          		se(cadeiaParaInteiro(ultimaJogadaHorizontal) > 6 e tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)-2][cadeiaParaInteiro(ultimaPecaHorizontal)] == pecaMaquina e
				tabuleiro[cadeiaParaInteiro(ultimaJogadaVertical)-1][cadeiaParaInteiro(ultimaJogadaHorizontal)-1] == " "){
					casaAComer = cadeiaParaInteiro(ultimaPecaHorizontal)
					comerPeca = verdadeiro
					retorne falso
				}
				escreva("anda esquerda \n")
				se(tabuleiro[cadeiaParaInteiro(ultimaJogadaVertical)-1][cadeiaParaInteiro(ultimaJogadaHorizontal)-1] == " "){
					retorne falso
				}
          	}
          }
	}
	retorne verdadeiro // continua enquanto
}

// choice bot actions
funcao acaoDaMaquina(){
	ultimaPecaVertical = "x"
	ultimaPecaHorizontal = "x"
	ultimaJogadaVertical = "x"
	ultimaJogadaHorizontal = "x"
	inteiro pecasPossiveis = 0, jogadasPossiveis = 0, pecasPossiveisVertical[64], pecasPossiveisHorizontal[64], jogadasPossiveisVertical[64], jogadasPossiveisHorizontal[64]
	para(inteiro vertical = 1; vertical <= tamanho; vertical++){
          para(inteiro horizontal = 1; horizontal <= tamanho; horizontal++){
          se(tabuleiro[vertical-1][horizontal-1] == pecaMaquina){
          	se(horizontal > 1 e horizontal <= 7){
				se(horizontal < 6 e tabuleiro[vertical-1+1][horizontal-1+1] == pecaJogador){
					se(tabuleiro[vertical-1+2][horizontal-1+2] == " "){
						pecasPossiveisVertical[pecasPossiveis] = vertical+2
						pecasPossiveisHorizontal[pecasPossiveis] = horizontal+2
						pecasPossiveis++
					}
				}
				
				se(horizontal > 2 e tabuleiro[vertical-1+1][horizontal-1-1] == pecaJogador){
					se(tabuleiro[vertical-1+2][horizontal-1-2] == " "){
						pecasPossiveisVertical[pecasPossiveis] = vertical+2
						pecasPossiveisHorizontal[pecasPossiveis] = horizontal-2
						pecasPossiveis++
					}
				}
        	
          		se(tabuleiro[vertical-1+1][horizontal-1+1] == " "){
					pecasPossiveisVertical[pecasPossiveis] = vertical-1
					pecasPossiveisHorizontal[pecasPossiveis] = horizontal+1
					pecasPossiveis++
				}
				se(tabuleiro[vertical-1+1][horizontal-1-1] == " "){
					pecasPossiveisVertical[pecasPossiveis] = vertical-1
					pecasPossiveisHorizontal[pecasPossiveis] = horizontal-1
					pecasPossiveis++
				}
          	}senao se(horizontal == 1){
          		se(tabuleiro[vertical-1+1][horizontal-1+1] == pecaJogador e
				tabuleiro[vertical-1+2][horizontal-1+2] == " "){
					pecasPossiveisVertical[pecasPossiveis] = vertical-2
					pecasPossiveisHorizontal[pecasPossiveis] = horizontal+2
					pecasPossiveis++
				}
				se(tabuleiro[vertical-1+1][horizontal-1+1] == " "){
					pecasPossiveisVertical[pecasPossiveis] = vertical-1
					pecasPossiveisHorizontal[pecasPossiveis] = horizontal+1
					pecasPossiveis++
				}
          	}senao se(horizontal == 8){
          		se(tabuleiro[vertical-1+1][horizontal-1-1] == pecaJogador e
				tabuleiro[vertical-1+2][horizontal-1-2] == " "){
					pecasPossiveisVertical[pecasPossiveis] = vertical-2
					pecasPossiveisHorizontal[pecasPossiveis] = horizontal-2
					pecasPossiveis++
				}
				se(tabuleiro[vertical-1+1][horizontal-1-1] == " "){
					pecasPossiveisVertical[pecasPossiveis] = vertical-1
					pecasPossiveisHorizontal[pecasPossiveis] = horizontal-1
					pecasPossiveis++
				}
          	}
          }
	}
}
	
	//para(inteiro x = 0; x < pecasPossiveis; x++){
	//	escreva("vertical - " + pecasPossiveisVertical[x] + " | " + "horizontal - " + pecasPossiveisHorizontal[x] +  "\n")
	//}
	escreva("peças possíveis - " + pecasPossiveis + "\n")
	inteiro numeroAleatorio = 0
	se(pecasPossiveis > 1){
		numeroAleatorio = Util.sorteia(0, pecasPossiveis-1)
	}
	
	escreva("número aleatório " + numeroAleatorio + "\n")
	
	ultimaPecaVertical = inteiroParaCadeia(pecasPossiveisVertical[numeroAleatorio])
	ultimaPecaHorizontal = inteiroParaCadeia(pecasPossiveisHorizontal[numeroAleatorio])
	
	escreva("ultimaPecaVertical " + ultimaPecaVertical + "\n")
	escreva("ultimaPecaHorizontal " + ultimaPecaHorizontal + "\n \n\n\n\n")

		se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)][cadeiaParaInteiro(ultimaPecaHorizontal)] == pecaMaquina){
			escreva("===========\nprimeiro se\n===========\n")
			se(cadeiaParaInteiro(ultimaPecaVertical) > 1 e cadeiaParaInteiro(ultimaPecaHorizontal) < 7){
				escreva("centro \n")
				escreva("come direita \n")
				se(cadeiaParaInteiro(ultimaJogadaHorizontal) < 6){
					se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)+1][cadeiaParaInteiro(ultimaPecaHorizontal)+1] == pecaJogador){
						se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)+2][cadeiaParaInteiro(ultimaPecaHorizontal)+2] == " "){
						
							jogadasPossiveisVertical[jogadasPossiveis] = cadeiaParaInteiro(ultimaPecaVertical)+2
							jogadasPossiveisHorizontal[jogadasPossiveis] = cadeiaParaInteiro(ultimaPecaHorizontal)+2
							jogadasPossiveis++
						}
					}
				}
				//escreva("come esquerda \n")
				se(cadeiaParaInteiro(ultimaJogadaHorizontal) > 2){
					se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)+1][cadeiaParaInteiro(ultimaPecaHorizontal)-1] == pecaJogador){
						se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)+2][cadeiaParaInteiro(ultimaPecaHorizontal)-2] == " "){
				
							jogadasPossiveisVertical[jogadasPossiveis] = cadeiaParaInteiro(ultimaPecaVertical)+2
							jogadasPossiveisHorizontal[jogadasPossiveis] = cadeiaParaInteiro(ultimaPecaHorizontal)-2
							jogadasPossiveis++
						}
					}
				}
				//escreva("anda direita \n")
          		se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)+1][cadeiaParaInteiro(ultimaPecaHorizontal)+1] == " "){
					
					jogadasPossiveisVertical[jogadasPossiveis] = cadeiaParaInteiro(ultimaPecaVertical)+1
					jogadasPossiveisHorizontal[jogadasPossiveis] = cadeiaParaInteiro(ultimaPecaHorizontal)+1
					jogadasPossiveis++
				}
				//escreva("anda esquerda \n")
				se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)+1][cadeiaParaInteiro(ultimaPecaHorizontal)-1] == " "){
					
					jogadasPossiveisVertical[jogadasPossiveis] = cadeiaParaInteiro(ultimaPecaVertical)+1
					jogadasPossiveisHorizontal[jogadasPossiveis] = cadeiaParaInteiro(ultimaPecaHorizontal)-1
					jogadasPossiveis++
				}
          	}senao se(cadeiaParaInteiro(ultimaPecaHorizontal) == 1){
          		//escreva("esquerda \n")
          		se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)+1][cadeiaParaInteiro(ultimaPecaHorizontal)+1] == pecaJogador e
				tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)+2][cadeiaParaInteiro(ultimaPecaHorizontal)-1+2] == " "){
					
					jogadasPossiveisVertical[jogadasPossiveis] = cadeiaParaInteiro(ultimaPecaVertical)+2
					jogadasPossiveisHorizontal[jogadasPossiveis] = cadeiaParaInteiro(ultimaPecaHorizontal)+2
					jogadasPossiveis++
				}
				se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)+1][cadeiaParaInteiro(ultimaPecaHorizontal)-1] == " "){
					
					jogadasPossiveisVertical[jogadasPossiveis] = cadeiaParaInteiro(ultimaPecaVertical)+1
					jogadasPossiveisHorizontal[jogadasPossiveis] = cadeiaParaInteiro(ultimaPecaHorizontal)+1
					jogadasPossiveis++
				}
          	}senao se(cadeiaParaInteiro(ultimaPecaHorizontal) == 7){
          		//escreva("direita \n")
          		se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)+1][cadeiaParaInteiro(ultimaPecaHorizontal)-1] == pecaJogador e
				tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)+2][cadeiaParaInteiro(ultimaPecaHorizontal)-1-2] == " "){
					
					jogadasPossiveisVertical[jogadasPossiveis] = cadeiaParaInteiro(ultimaPecaVertical)+2
					jogadasPossiveisHorizontal[jogadasPossiveis] = cadeiaParaInteiro(ultimaPecaHorizontal)-2
					jogadasPossiveis++
				}
				se(tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)+1][cadeiaParaInteiro(ultimaPecaHorizontal)-1] == " "){
					
					jogadasPossiveisVertical[jogadasPossiveis] = cadeiaParaInteiro(ultimaPecaVertical)+1
					jogadasPossiveisHorizontal[jogadasPossiveis] = cadeiaParaInteiro(ultimaPecaHorizontal)-1
					jogadasPossiveis++
				}
          	}
          }
	//escreva("\n\n\n\n")
     //para(inteiro x = 0; x < jogadasPossiveis; x++){
	//	escreva("vertical -- " + jogadasPossiveisVertical[x] + "\n")
     //  	escreva("horizontal -- " + jogadasPossiveisHorizontal[x] + "\n")
	//}
	//escreva("jogadas possíveis - " + jogadasPossiveis + "\n")

	numeroAleatorio = 0
	se(jogadasPossiveis > 1){
		numeroAleatorio = Util.sorteia(0, jogadasPossiveis-1)
	}
	//escreva("numeroAleatorio - "+ numeroAleatorio +"\n")
	//escreva("vertical - "+ jogadasPossiveisVertical[numeroAleatorio] +"\n")
	//escreva("horizontal - "+ jogadasPossiveisHorizontal[numeroAleatorio] +"\n")
	ultimaJogadaVertical = inteiroParaCadeia(jogadasPossiveisVertical[numeroAleatorio])
	ultimaJogadaHorizontal = inteiroParaCadeia(jogadasPossiveisHorizontal[numeroAleatorio])
	//escreva("jgoada vertical - " + ultimaJogadaVertical + "\n")
	//escreva("jogada horizontal - " + ultimaJogadaHorizontal + "\n")
	//escreva("ultimaPecaVertical - " + ultimaPecaVertical + "\n")
	//escreva("ultimaPecaHorizontal - " + ultimaPecaHorizontal + "\n")
	//escreva("ultimaJogadaVertical - " + ultimaJogadaVertical + "\n")
	//escreva("ultimaJogadaHorizontal - " + ultimaJogadaHorizontal + "\n")

	se(jogadasPossiveis > 0){
		tabuleiro[cadeiaParaInteiro(ultimaPecaVertical)][cadeiaParaInteiro(ultimaPecaHorizontal)] = " "
		tabuleiro[cadeiaParaInteiro(ultimaJogadaVertical)][cadeiaParaInteiro(ultimaJogadaHorizontal)] = pecaMaquina
	}
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
 * @POSICAO-CURSOR = 9462; 
 * @DOBRAMENTO-CODIGO = [489];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */