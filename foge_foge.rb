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
	nova_posicao = heroi.dup
	case direcao
			when "W"
				nova_posicao[0] -= 1
			when "S"
				nova_posicao[0] += 1
			when "A"
				nova_posicao[1] -= 1
			when "D"
				nova_posicao[1] += 1
		end
		nova_posicao
end

def joga(nome)
	mapa = le_mapa 1
	while true
		desenha mapa
		direcao = pede_movimento
		heroi = encontra_jogador mapa
		nova_posicao = calcula_nova_posicao heroi, direcao
    
    if nova_posicao[0] < 0
    	next
    end

    if nova_posicao[1] < 0
    	next
    end

    if nova_posicao[0] >= mapa.size
    	next
    end

    if nova_posicao[1] >= mapa[0].size
    	next
    end

		if mapa[nova_posicao[0]][nova_posicao[1]] == "X"
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