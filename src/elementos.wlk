class Hogar {
var property nivelMugre = 0
var property confort = 0

	method esBueno() = nivelMugre <= confort / 2
	method recibirAtaque(plaga) {
		nivelMugre += plaga.nivelDanio()
	}
}

class Huerta {
var property capacidadProduccion = 0
const property nivel = nivelDeHuerta.nivelProdu()

	method esBueno() {
		return capacidadProduccion > nivelDeHuerta.nivelProdu() 
	}
	method recibirAtaque(plaga) {
		capacidadProduccion -= plaga.nivelDanio() * 0.1
		if(plaga.transmiteEnfermedades()) {
			capacidadProduccion -= 10
		}
	}	
}

object nivelDeHuerta {
var property nivel = 0
	
	method nivelProdu() = nivel
}

class Mascota {
var property nivelSalud = 0
	
	method esBueno() = nivelSalud > 250
	method recibirAtaque(plaga) {
		if(plaga.transmiteEnfermedades()) {
			nivelSalud = 0.max(nivelSalud -= plaga.nivelDanio())
		}
	}	
}

class Barrio {
const property elementos = []

	method agregarElemento(elemento) {elementos.add(elemento)}
	method sacarElemento(elemento) {elementos.remove(elemento)}
	method esCopado() {
		return elementos.count{e => e.esBueno()} > elementos.count{e => not e.esBueno()}	
	}
}