object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
	
	method pesoEsPar() = self.peso() % 2 == 0

	method cantidadDeBultos() {
		return 1
	}
method accidente() {}
}

object arenaAGranel{
	var peso = 0
	
	method peso(_peso) {peso = _peso}
	method peso() = peso
	
	method nivelPeligrosidad() = 1
	
	method pesoEsPar() = self.peso() % 2 == 0

	method cantidadDeBultos() {
		return 1
	}
	method accidente() {
			 peso = peso +20 
	}
}

object paqueteDeLadrillos{
	var ladrillos = 0
	
	method ladrillos(_ladrillos) {ladrillos = _ladrillos}
	
	method peso() = ladrillos * self.pesoDeLadrillo()
	method nivelPeligrosidad() = 2
	
	method pesoDeLadrillo() = 2
	
	method pesoEsPar() = self.peso() % 2 == 0

	method cantidadDeBultos() {
		return if (ladrillos <= 100){
				1
			}else{ 
				if (ladrillos <= 300 ){
				2
			}else{
			3}}
	}
	method accidente() {
		if(ladrillos > 12){
			self.ladrillos(ladrillos - 12)
		}
		else{
			self.ladrillos(0)
		}
		}

}

object residuosRadiactivos{
	var peso = 0

	method peso(_peso) {peso = _peso}
	method peso() = peso
	
	method nivelPeligrosidad() = 200
	
	method pesoEsPar() = self.peso() % 2 == 0

	method cantidadDeBultos() {
		return 1
	}
	method accidente() {
		peso = peso +20
	  
	}


}

object bateriaAntiaerea{
	var misiles = conMisiles 
	
	method misiles(_misiles) {misiles = _misiles}

	method peso() = misiles.peso()
	method nivelPeligrosidad() = misiles.peligrosidad()
	
	method pesoEsPar() = self.peso() % 2 == 0

	method cantidadDeBultos() {
		return misiles.bultos()
	  
	}
	method accidente() {
		misiles = sinMisiles
	  
	}

}

//objetos que son usados en bateriaAntiaerea:
object conMisiles{
	method peso() = 300
	method peligrosidad() = 100
	method bultos() {
	  return 2
	}
}
object sinMisiles{
	method peso() = 200
	method peligrosidad() = 0

	method bultos() {
		return 1
	  
	}
}
//Aca finaliza

object bumblebee{
	var transformacion = transformadoEnAuto
	
	method transformacion(_transformacion) {transformacion = _transformacion}

	method peso() = 800
	method nivelPeligrosidad() = transformacion.peligrosidad()
	
	method pesoEsPar() = self.peso() % 2 == 0

	method cantidadDeBultos() {
		return 2
	}
	method accidente() {
		transformacion = transformacion.siguiente()
	}
}

//objetos que son usados en bumblebee
object transformadoEnAuto{
	method peligrosidad() = 15
	method siguiente() = transformadoEnRobot
}
object transformadoEnRobot{
	method peligrosidad() = 30
	method siguiente() = transformadoEnAuto
}

object contenedorPortuario{
	const contenidos = #{}
	method agregarContenido(contenidoAAgregar) { contenidos.add(contenidoAAgregar) }

	method peso() = self.pesoDelContenedorPortuario() + self.pesoDeLoContenido()
	method pesoDelContenedorPortuario() = 100
	method pesoDeLoContenido() = contenidos.sum({cosa => cosa.peso()})
	
	method nivelPeligrosidad() = if(contenidos.isEmpty()){0} else{self.peligrosidadDelContenidoMasPeligroso()}
	
	method peligrosidadDelContenidoMasPeligroso() = contenidos.map({cosa => cosa.nivelPeligrosidad()}).max()

	method pesoEsPar() = self.peso() % 2 == 0

	method cantidadDeBultos() {
		return 1 + self.cantidadDeBultosQueTieneAdentro()
	}

	method cantidadDeBultosQueTieneAdentro() {
		return contenidos.sum({cosa => cosa.cantidadDeBultos()})
	}
	method accidente() {
		contenidos.forEach({cosa => cosa.accidente()})
	}

}

object embalajeDeSeguridad {
  var envuelto = bateriaAntiaerea

	method envuelto(_envuelto) {
		envuelto = _envuelto 
	
	}
	method peso() {
		return envuelto.peso()
	}

	method nivelPeligrosidad() {
		return envuelto.nivelPeligrosidad() / 2
	}
	method pesoEsPar() = self.peso() % 2 == 0

	method cantidadDeBultos() {
		return 2
	}

	method accidente() {
	
	}

}

















