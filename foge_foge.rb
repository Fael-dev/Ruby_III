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
	movimentos = movimentos[direcao]
	heroi[0] += movimentos[0]
	heroi[1] += movimentos[1]
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

def joga(nome)
	mapa = le_mapa 1
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
	end
end

def inicia_jogo
	nome = boas_vindas
	joga nome
end