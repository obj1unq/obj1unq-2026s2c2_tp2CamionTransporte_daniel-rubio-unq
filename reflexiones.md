# Camión de cosas

Trabajo práctico en Wollok: un camión que transporta distintas cosas, las valida, las lleva por un camino y las deposita en un almacén.

## Polimorfismo

### ¿Qué nombre tiene el tipo de los objetos polimórficos?

El tipo se llama **`Cosa`**. Es el tipo de todo lo que el camión puede cargar, es decir, todo lo transportable.

### ¿Qué mensajes componen ese tipo?

Todos los objetos que el camión puede cargar son del tipo `Cosa`, porque entienden los mensajes:

- `peso()`
- `nivelPeligrosidad()`
- `cantidadDeBultos()`
- `accidente()`

Cada objeto resuelve estos mensajes de manera distinta.

### ¿Qué objetos son los emisores de los mensajes polimórficos?

Los emisores son los objetos que le mandan mensajes del tipo `Cosa` a otros objetos:

- **`camion`**: les manda `peso()`, `nivelPeligrosidad()`, `cantidadDeBultos()` y `accidente()` a cada una de las cosas que carga.
- **`contenedorPortuario`**: les manda `peso()`, `nivelPeligrosidad()`, `cantidadDeBultos()` y `accidente()` a las cosas que tiene adentro.
- **`embalajeDeSeguridad`**: le manda `peso()` y `nivelPeligrosidad()` a la cosa que envuelve.
