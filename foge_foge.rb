require_relative "ui"

def le_mapa(numero)
	arquivo = "mapa#{numero}.txt"
  texto = File.read arquivo
  mapa = texto.split "\n"
end

def encontra_jogador(mapa)
	heroi = "H"
	for linha = 1..(mapa.size-1)
		lina_atual = mapa[linha]
		for coluna = 0..(linha_atual.size-1)
			heroi_esta_aqui = linha_atual[coluna] == heroi
			if heroi_esta_aqui
				# ACHEI O JOGADOR
			end
		end
	end
	# NÃO ACHEI
end

def joga(nome)
	mapa = le_mapa 1

	while true
		desenha mapa
		direcao = pede_movimento
	end
end

def inicia_jogo
	nome = boas_vindas
	joga nome
end