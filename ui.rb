def boas_vindas
	puts "Bem vindo ao jogo foge foge."
	puts "Qual seu nome?"
	nome=gets.strip
	puts "\n\n\n"
	puts "começaremos o jogo para você #{nome}"
	nome
end

def desenha(mapa)
	puts mapa
end

def pede_movimento 
	puts "Para onde deseja ir?"
	movimento = gets.strip
end