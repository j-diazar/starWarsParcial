import habitantes.*

class Planeta {
	const property habitantes = []
	var property museos = 0
	var property longitudMurallas = 0
	
	method agregar(habitante){
		habitantes.add(habitante)
	}
	
	method sacar(habitante){
		habitantes.remove(habitante)
	}
	
	method delegacionDiplomatica(){
		return habitantes.filter({h => h.esDestacado()})
	}
	
	method valorInicialDefensa(){
		return habitantes.count({h => h.potencia() >= 30})
	}
	
	method esCulto(){
		return museos >= 2 and habitantes.all({h => h.inteligencia() >= 10})
	}
	
	method potenciaReal(){
		return habitantes.sum({h => h.potencia()})
	}
	
	method construirMurallas(cantidad){
		longitudMurallas = longitudMurallas + cantidad
	}
	
	method fundarMuseo(){
		museos = museos + 1
	}
	
	method potenciaAparente(){
		return habitantes.max({h => h.potencia()}).potencia() * habitantes.size()
	}
	
	method necesitaReforzarse(){
		return self.potenciaAparente()/self.potenciaReal() >= 2
	}
	
	method recibirTributos(){
		habitantes.forEach({h=> h.darTributoA(self)})
	}
	
	method habitantesValiosos(){
		return habitantes.filter({h=> h.valor() >= 40})
	}
	
	method apaciguarA(planeta){
		habitantes.forEach({h=> h.darTributoA(planeta)})
	}
}