import cosas.*

object camion {
	const property cosas = #{}
		
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

	method cadaCosaEnElCamionTienePesoPar() = cosas.all({cosa => cosa.pesoEsPar()})

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

//------------------------------------------------------------------------------------------------------------------------------------------------------------
	//posibles soluciones

	method cosasCargadasEnCamionDeNivelDePeligrosidad(peligrosidad) = cosas.filter({cosa => cosa.nivelPeligrosidad() > peligrosidad})
	
	method cosasCargadasEnCamionConMasNivelDePeligrosidadQue(cosaARevisar) = self.cosasCargadasEnCamionDeNivelDePeligrosidad(cosaARevisar.nivelPeligrosidad())

//------------------------------------------------------------------------------------------------------------------------------------------------------------

//2.7
method puedeCircularEnRuta(nivelMaximoDePeligrosidad) = !self.tieneExceso() && !self.hayCosaQueSupereNivelDePeligrosidad(nivelMaximoDePeligrosidad)
	
method hayCosaQueSupereNivelDePeligrosidad(nivelDePeligrosidad) = cosas.any({cosa => cosa.nivelPeligrosidad() > nivelDePeligrosidad})

//2.9
method hayCosaQuePeseEntreMinimoYMaximo(minimo, maximo){
	return cosas.any({cosa => cosa.peso() >= minimo && cosa.peso() <= maximo})  //  minimo =< cosa.peso() =< maximo
} 

//2.10
method cosaMasPesada(){
	return cosas.max({cosa => cosa.peso()})
}  

method pesoDeCadaCosa() {
	cosas.map({cosa => cosa.peso()})
}

method cantidadTotalDeBultos() {
	return cosas.sum({cosa=>cosa.cantidadTotalDeBultos()})
}

method sufreAccidente() {
	cosas.forEach({cosa => cosa.accidente()})
  
}

method vaciarCamion() {
  cosas.clear()
}

method trasportar(destino, camino) {
  if (camino.puedeTransportar_(self) ){
    destino.almacenarDeCamion_(self)
  }
}















}