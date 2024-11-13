programa
{
    // Jogo de Damas em Portugol

    // Variaveis globais
    inteiro corSelecionada
    cadeia tabuleiro[8][8] // Matriz que representa o tabuleiro com as pecas
    inteiro tamanho = 8 // Tamanho do tabuleiro (8x8)
    cadeia controleDoTabuleiroVertical[8] = {"   ", "A", "B", "C", "D", "E", "F", "G", "H"}
    cadeia controleDoTabuleiroHorizontal[7] = {"1", "2", "3", "4", "5", "6", "7", "8"}
    cadeia pecaPreta = "◙"
    cadeia pecaBranca = "○"
    cadeia pecaJogador, pecaMaquina
  // função de inicio

  funcao inicio(){
    corSelecionada = selecaoDeCor()

    escreva ("Iniciando o jogo... \n")
    atualizaTabuleiro()
    renderizaTabuleiro()

    se(corSelecionada == 0){
        escreva("Você começa  \n")

        selecaoDaPeca()
      }senao{
        escreva("A maquina começa  \n")
        acaoDaMaquina()
      }
  }


    // Inicializa o tabuleiro com as pecas na posicao inicial
    funcao renderizaTabuleiro()
    {

        para(inteiro vertical = 0; vertical <= tamanho; vertical++){
          escreva(controleDoTabuleiroVertical[vertical])
          para(inteiro horizontal = 0; horizontal < tamanho; horizontal++){
            se(vertical == 0){
                escreva(" " + controleDoTabuleiroHorizontal[horizontal] + "  ")
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
    }
    funcao atualizaTabuleiro(){
    }
    funcao inteiro selecaoDeCor(){
      inteiro cor
      cadeia peca
      enquanto(cor != 0 e cor != 1){
        escreva("Escolha suas peças \n")
        escreva("0) ○ Brancas \n")
        escreva("1) ◙ Pretas \n")
        leia(cor)
      }
      se(cor == 0){
          pecaJogador = pecaBranca
          pecaMaquina = pecaPreta
        }senao{
          pecaJogador = pecaPreta
          pecaMaquina = pecaBranca
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
        escreva(tabuleiro)
      retorne cor
    }

    funcao selecaoDaPeca(){
      caracter posicaoVertical
      inteiro indexVertical, indexHorizontal
      escreva("Selecão de peça... \n")
      escreva("posição vertical \n")
      leia(posicaoVertical)
      escreva("posição Horizontal \n")
      leia(indexHorizontal)
      enquanto(posicaoVertical != "a" e posicaoVertical != "A" e  posicaoVertical != "b" e  posicaoVertical != "B" e  posicaoVertical != "c" e  posicaoVertical != "C" e  posicaoVertical != "d" e  posicaoVertical != "D" e  posicaoVertical != "e" e  posicaoVertical != "E" e  posicaoVertical != "f" e  posicaoVertical != "F" e  posicaoVertical != "g" e  posicaoVertical != "G" e  posicaoVertical != "h" e  posicaoVertical != "H"){
      escolha(posicaoVertical){
        caso "a" ou "A":
          indexVertical = 0
        pare
        caso "b" ou "B":
          indexVertical = 1
        pare
        caso "c" ou "C":
          indexVertical = 2
        pare
        caso "d" ou "D":
          indexVertical = 3
        pare
        caso "e" ou "E":
          indexVertical = 4
        pare
        caso "f" ou "F":
          indexVertical = 5
        pare
        caso "g" ou "G":
          indexVertical = 6
        pare
        caso "h" ou "H":
          indexVertical = 7
        pare

        caso contrario:
        escreva("Posição invalida")
      }
      }
      enquanto(tabuleiro[indexVertical][indexHorizontal - 1] != pecaJogador){
        escreva("Você não tem nenhuma peça nessa posição... \n")
      escreva("posição vertical \n")
      leia(posicaoVertical)
      escreva("posição Horizontal \n")
      leia(indexHorizontal)
      escolha(posicaoVertical){
        caso "a" ou "A":
          indexVertical = 0
        pare
        caso "b" ou "B":
          indexVertical = 1
        pare
        caso "c" ou "C":
          indexVertical = 2
        pare
        caso "d" ou "D":
          indexVertical = 3
        pare
        caso "e" ou "E":
          indexVertical = 4
        pare
        caso "f" ou "F":
          indexVertical = 5
        pare
        caso "g" ou "G":
          indexVertical = 6
        pare
        caso "h" ou "H":
          indexVertical = 7
        pare
      }
      }
      selecaoDaAcao(indexVertical, indexHorizontal - 1)
    }
    funcao selecaoDaAcao(){

    }

    funcao acaoDaMaquina(){

    }
}