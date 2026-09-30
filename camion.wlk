import cosas.*

object camion {
	const cosas = #{}

	method cosas() = cosas  // al ser const no se puede modificar desde afuera.
		
	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa){
		self.validarDescarga(unaCosa)
		cosas.remove(unaCosa)
	}
	
	method validarCarga(unaCosa) {
		if(self.estaCargadoEnCamion(unaCosa)){
			self.error("No se puede cargar "+ unaCosa + "debido a que ya se encuentra en el camion") 
		}
	}
	
	method validarDescarga(unaCosa) {
		if(!self.estaCargadoEnCamion(unaCosa)){
			self.error("No se puede descargar "+ unaCosa + "debido a que no se encuentra en el camion") 
		}
	}
	
	method estaCargadoEnCamion(cosa) = cosas.contains(cosa)

	
	method hayAlgoQuePesa(peso) {
		return cosas.any({cosa => cosa.peso() == peso})
	}

	method pesoTotal() {
	   return 1000 + cosas.sum({cosa => cosa.peso()})
    }

	method tieneExceso() {
      return self.pesoTotal() > 2500
    }

	method nivelPeligrosidad(nivelPeligrosidad) {
		return(cosas.find({cosa => cosa.nivelPeligrosidad() == nivelPeligrosidad}))
	}


	method cosasCargadasEnCamionDeNivelDePeligrosidad(peligrosidad) = cosas.filter({cosa => cosa.nivelPeligrosidad() > peligrosidad})
	
	method cosasCargadasEnCamionConMasNivelDePeligrosidadQue(cosaARevisar) = self.cosasCargadasEnCamionDeNivelDePeligrosidad(cosaARevisar.nivelPeligrosidad())

//2.7
	method puedeCircularEnRuta(nivelMaximoDePeligrosidad) = !self.tieneExceso() && !self.hayCosaQueSupereNivelDePeligrosidad(nivelMaximoDePeligrosidad)
	
	method hayCosaQueSupereNivelDePeligrosidad(nivelDePeligrosidad) = cosas.any({cosa => cosa.nivelPeligrosidad() > nivelDePeligrosidad})

//2.9
	method hayCosaQuePeseEntreMinimoYMaximo(minimo, maximo){
	return cosas.any({ cosa => cosa.peso().between(minimo, maximo) })  
} 

//2.10
	method cosaMasPesada(){
	return cosas.max({cosa => cosa.peso()})
}  

	method pesoDeCadaCosa() {
		return cosas.map({cosa => cosa.peso()})
	}

	method cantidadTotalDeBultos() {
		return cosas.sum({cosa=>cosa.cantidadDeBultos()})
	}

	method sufreAccidente() {
		cosas.forEach({cosa => cosa.accidente()})
	}

	method vaciartransporte() {
	cosas.clear()
	}

	method transportar(destino, camino) {
		self.validarViaje(camino)
		destino.almacenarDe(self)
	}

	method validarViaje(camino) {
		if (!camino.puedeSoportarElViaje(self)) {
			self.error("No se puede realizar el transporte")
		}
	}
	method cadaCosaEnElCamionTienePesoPar() = cosas.all({cosa => cosa.peso().even()})

}