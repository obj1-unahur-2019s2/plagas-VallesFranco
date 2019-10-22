class Plaga {
var property poblacion = 0

	method transmiteEnfermedades() = poblacion >= 10
	method aumentarPoblacion(valor) { poblacion *= valor }
	method atacar(elemento) { self.aumentarPoblacion(1.1); elemento.recibirAtaque(self) }
}

class Cucaracha inherits Plaga {
var property pesoPromedio = 0

	method nivelDanio() = poblacion / 2
	override method transmiteEnfermedades() { return pesoPromedio >= 10 and super() }
	override method atacar(elemento) { super(elemento); pesoPromedio += 2 }
}

class Pulga inherits Plaga {
	method nivelDanio() = poblacion * 2
}

class Garrapata inherits Pulga  {
	override method atacar(elemento) { self.aumentarPoblacion(1.2); elemento.recibirAtaque(self) }
}

class Mosquito inherits Plaga {
	method nivelDanio() = poblacion
	override method transmiteEnfermedades() { return poblacion % 3 == 0 and super() }
}
