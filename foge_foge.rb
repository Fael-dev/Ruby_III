require_relative "ui"

def le_mapa(numero)
	arquivo = "mapa#{numero}.txt"
  texto = File.read arquivo
  mapa = texto.split "\n"
end

def encontra_jogador(mapa)
	heroi = "H"
	mapa.each_with_index do |linha_atual, linha|
		coluna_heroi = linha_atual.index heroi 
		if coluna_heroi
			return [linha, coluna_heroi]
		end
	end
	# NÃO ACHEI
end

def calcula_nova_posicao(heroi, direcao)
	heroi = heroi.dup
	movimentos = {
		"W" => [-1, 0],
		"S" => [+1, 0],
		"A" => [0, -1],
		"D" => [0, +1]
	}
	movimento = movimentos[direcao]
	heroi[0] += movimento[0]
	heroi[1] += movimento[1]
	heroi
	
end

def posicao_valida?(mapa, posicao)
	linhas = mapa.size
	colunas = mapa[0].size
	estourou_linhas = posicao[0] < 0 || posicao[0] >= linhas
	estourou_colunas = posicao[1] < 0 || posicao[1] >= colunas

	if estourou_linhas || estourou_colunas
  	return false
  end

	if mapa[posicao[0]][posicao[1]] == "X"
		return false
	end
	true
end

def move_fantasmas mapa
    fantasma = "F"
    mapa.each_with_index do |linha_atual, linha|
        linha_atual.chars.each_with_index do |caracter_atual, caracter|
            eh_fantasma = caracter_atual == fantasma
            if eh_fantasma
                move_fantasma mapa,[linha,caracter]
            end
        end
    end
end

def move_fantasma (mapa, posicao)
    posicoes = posicoes_validas_a_partir_de mapa, posicao
    return if posicoes.empty?
    nova_posicao = posicoes[0]

    mapa[posicao[0]][posicao[1]] = " "
    mapa[nova_posicao[0]][nova_posicao[1]] = "F"
end

def posicoes_validas_a_partir_de(mapa, posicao)
    posicoes = []

    baixo = [posicao[0] + 1, posicao[1]]
    if posicao_valida? mapa, baixo
        posicoes << baixo
    end

    direita = [posicao[0], posicao[1] + 1]
    if posicao_valida? mapa,direita
        posicoes << direita
    end

    cima = [posicao[0] - 1, posicao[1]]
    if posicao_valida? mapa,cima
        posicoes << cima
    end

    esquerda = [posicao[0], posicao[1] - 1]
    if posicao_valida? mapa,esquerda
        posicoes << esquerda
    end

    posicoes
end

def joga(nome)
	mapa = le_mapa 2
	while true
		desenha mapa
		direcao = pede_movimento
		heroi = encontra_jogador mapa
		nova_posicao = calcula_nova_posicao heroi, direcao
    
    if !posicao_valida? mapa, nova_posicao
    	next
    end
    
		mapa[heroi[0]][heroi[1]] = " "
		mapa[nova_posicao[0]][nova_posicao[1]] = "H"
		move_fantasmas mapa
	end
end

def inicia_jogo
	nome = boas_vindas
	joga nome
end