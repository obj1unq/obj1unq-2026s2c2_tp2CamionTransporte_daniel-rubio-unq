import camion.*

object almacen {
	const almacenado = #{}

	method almacenado() = almacenado

	method almacenar(cosa) {
		almacenado.add(cosa)
	}

	method almacenarDeCamion_(camion) {
		almacenado.addAll(camion.cosas())
		camion.vaciarCamion()
	}

}