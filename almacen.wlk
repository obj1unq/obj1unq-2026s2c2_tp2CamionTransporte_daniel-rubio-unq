import camion.*

object almacen {
	const almacenado = #{}

	method almacenado() = almacenado

	method almacenar(cosa) {
		almacenado.add(cosa)
	}

	method almacenarDe(transporte) {
		almacenado.addAll(transporte.cosas())
		transporte.vaciartransporte()
	}

}