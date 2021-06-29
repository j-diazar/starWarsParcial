import planeta.*

class Persona {
	var property edad = 0
	var property potencia = 20
	var inteligencia = 0
	var valor = 0
	
	method potencia(){
		return potencia
	}
	
	method inteligencia(){
		if (edad.between(20,40)){inteligencia = 12} else {inteligencia = 8}
		return inteligencia
	}
	
	method esDestacado(){ return edad == 25 or edad == 35}
	
	method darTributoA(planeta){}
	
	method valor(){
		valor = potencia + inteligencia
		return valor
	}
	
}

class Atleta inherits Persona{
	var property masaMuscular = 4
	var property tecnicasConocidas = 2
	
	override method potencia(){
		return super() + masaMuscular * tecnicasConocidas
	}
	
	override method esDestacado(){
		return super() or tecnicasConocidas > 5
	}
	
	method entrenar(dias){ 
		masaMuscular = masaMuscular + 1 * (dias/5)
	}
	
	method aprenderTecnica(){
		tecnicasConocidas = tecnicasConocidas + 1
	} 
	
	override method darTributoA(planeta){
		planeta.construirMurallas(2)
	}
}

class Docente inherits Persona{
	var property cantidadCursos = 0
	
	override method inteligencia(){ return super() + cantidadCursos *2 }
	
	override method esDestacado(){ return cantidadCursos > 3}
	
	override method darTributoA(planeta){
		planeta.fundarMuseo()
	}
	
	override method valor(){
		return super() + 5
	}
}

class Soldado inherits Persona{
	const property armas = []
	
	override method potencia(){
		return super() + armas.sum({a => a.potenciaQueOtorga(self)})
	}
	
	override method darTributoA(planeta){
		planeta.construirMurallas(5)
	}
	
	method agregar(arma){
		armas.add(arma)
	}
	
	method sacar(arma){
		armas.remove(arma)
	}
}

class Pistolete{
	var property largo = 0
	
	method potenciaQueOtorga(soldado){
		if(soldado.edad() > 30){ return largo * 3 } 
			else{ return largo * 2}
	}
}

class Espadon{
	var property peso = 0
	
	method potenciaQueOtorga(soldado){
		if(soldado.edad() < 40){ return peso / 2 } 
			else{ return 6 }
	}
}