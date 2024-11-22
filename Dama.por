programa
{
    // Jogo de Damas em Portugol

    // Variaveis globais
    inteiro indexVertical, indexHorizontal, corSelecionada, ultimaPecaDoJogadorSelecionadaVertical, ultimaPecaDoJogadorSelecionadaHorizontal, tamanho = 8
    cadeia tabuleiro[8][8] // Matriz que representa o tabuleiro com as pecas
    cadeia controleDoTabuleiroVertical[8] = {"   ", "A", "B", "C", "D", "E", "F", "G", "H"}
    cadeia controleDoTabuleiroHorizontal[7] = {"1", "2", "3", "4", "5", "6", "7", "8"}
    cadeia  pecaJogador, pecaMaquina, pecaPreta = "◙", pecaBranca = "○"
  // função de inicio

  funcao inicio(){
    corSelecionada = selecaoDeCor()

    escreva ("Iniciando o jogo... \n\n")
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
      cadeia cor = ""
      inteiro numero
        enquanto(cor != "0" e cor != "1"){
          escreva("Escolha suas peças \n")
          escreva("0) ○ Brancas \n")
          escreva("1) ◙ Pretas \n")
          leia(cor)
          limpa()
        }
        numero = converteTextoParaNumero(cor)
        definePecas(numero)
      retorne numero
    }
    funcao definePecas(inteiro numero){
      cadeia peca
      se(numero == 0){
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
    }
    funcao selecaoDaPeca(){
      escreva("Selecão de peça... \n")
      pegarindexVerticalPorLetra()
      limpa()
      enquanto(tabuleiro[indexVertical][indexHorizontal - 1] != pecaJogador){
        renderizaTabuleiro()
        escreva("Você não tem nenhuma peça nessa posição... \n")
        pegarindexVerticalPorLetra()
        limpa()
      }
      selecaoDaAcao()
    }
    funcao selecaoDaAcao(){
      ultimaPecaDoJogadorSelecionadaVertical = indexVertical
      ultimaPecaDoJogadorSelecionadaHorizontal = indexHorizontal
      inteiro acao
      enquanto(acao != 0 e acao != 1){
        escreva("selecione a ação: \n")
        escreva("0) mover \n")
        se((tabuleiro[indexVertical+1][indexHorizontal+1] == pecaMaquina e (tabuleiro[indexVertical+2][indexHorizontal+2] == " " ou tabuleiro[indexVertical+2][indexHorizontal-2] == " "))){
          escreva("1) comer \n")
        }
        leia(acao)
      }
      se(acao == 1){

      }senao{
        escreva("Escolha a casa para mover \n")
        enquanto(tabuleiro[indexVertical][indexHorizontal - 1] != " "){
        escreva("Essa casa já está ocupada... \n")
        pegarindexVerticalPorLetra()
      }
      }
    }

    funcao acaoDaMaquina(){

    }

    funcao pegarindexVerticalPorLetra(){
      cadeia posicaoVertical
      enquanto(indexVertical != 0 e indexVertical != 1 e indexVertical != 2 e indexVertical != 3 e indexVertical != 4 e indexVertical != 5 e indexVertical != 6 e indexVertical != 7){
         escreva("posição vertical \n")
        leia(posicaoVertical)
        escreva("posição Horizontal \n")
        leia(indexHorizontal)
        indexVertical = converteTextoParaNumero(posicaoVertical)
        escreva(indexVertical)
        se(indexVertical == 11){
          escreva("Posição inválida \n")
        }
      }
    }

    funcao inteiro converteTextoParaNumero(cadeia texto){
      se(texto == "0" ou texto == "a" ou texto == "A"){
        retorne 0
      }senao se(texto == "1" ou texto == "b" ou texto == "B"){
        retorne 1
      }senao se(texto == "2" ou texto == "c" ou texto == "C"){
        retorne 2
      }senao se(texto == "3" ou texto == "d" ou texto == "D"){
        retorne 3
      }senao se(texto == "4" ou texto == "e" ou texto == "E"){
        retorne 4
      }senao se(texto == "5" ou texto == "f" ou texto == "F"){
        retorne 5
      }senao se(texto == "6" ou texto == "g" ou texto == "G"){
        retorne 6
      }senao se(texto == "7" ou texto == "h" ou texto == "H"){
        retorne 7
      }senao se(texto == "8" ou texto == "i" ou texto == "I"){
        retorne 8
      }senao se(texto == "9" ou texto == "j" ou texto == "J"){
        retorne 9
      }senao{
        retorne 11
      }
    }

    funcao pulaLinha(inteiro quantidade){
      para(inteiro i = 1; i <= quantidade; i++){
        escreva("\n")     
      }
    }
}