bemvindo = -> (nome) {
	puts "Bem vindo #{nome}"
}

minhafuncao = bemvindo
minhafuncao.call("Rafael")