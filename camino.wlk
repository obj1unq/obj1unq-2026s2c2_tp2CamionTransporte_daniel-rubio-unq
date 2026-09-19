import camion.*
import almacen.*

object caminosVecinales {
  	var pesoMaximoPermitido = 0
	
	method pesoMaximoPermitido(_pesoMaximoPermitido) {pesoMaximoPermitido = _pesoMaximoPermitido}
	
	method puedeSoportarElViaje(camion) = camion.pesoTotal() < pesoMaximoPermitido
}


object ruta9 {
    method puedeSoportarElViaje(camion) = camion.puedeCircularEnRuta(20)

}