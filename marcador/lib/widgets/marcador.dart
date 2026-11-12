import 'package:flutter/material.dart';

// WIDGET MARCADOR
// Es StatelessWidget porque únicamente muestra los valores
// de los contadores que recibe desde MarcadorScreen.
class Marcador extends StatelessWidget {

  // Puntuación del equipo local.
  final int contador1;

  // Puntuación del equipo visitante.
  final int contador2;

  const Marcador({
    super.key,
    required this.contador1,
    required this.contador2,
  });

  @override
  Widget build(BuildContext context) {

    // COLORES DEL MARCADOR
    const Color fondo = Color(0xFF25272C);
    const Color capsula = Color(0xFF18191D);
    const Color borde = Color(0xFF8A8E99);

    // CONTENEDOR EXTERIOR DEL MARCADOR
    // Padding establece el espacio exterior.
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: Container(
        height: 75,

        // Decoración del contenedor
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: fondo,
          border: Border.all(
            color: borde,
            width: 1.5,
          ),
        ),

        // Centra el contenido dentro del contenedor.
        alignment: Alignment.center,

        // FILA PRINCIPAL
        // Distribuye los nombres de los equipos y sus puntuaciones.
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            // Círculo azul y texto LOCAL
            Row(
              children: const [
                SizedBox(width: 15),
                Icon(
                  Icons.circle,
                  color: Colors.blue,
                  size: 12,
                ),
                SizedBox(width: 5),
                Text(
                  "LOCAL",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),

            // CÁPSULA CENTRAL DE PUNTUACIONES
            Container(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: capsula,
                ),

                // FILA DE PUNTUACIONES
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const SizedBox(width: 15),

                    // Puntos del equipo local.
                    Text(
                      "$contador1",
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    // Separador entre las puntuaciones.
                    const SizedBox(width: 20),

                    const Text(
                      "VS",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    // Separador entre las puntuaciones.
                    const SizedBox(width: 20),

                    // Puntos del equipo visitante.
                    Text(
                      "$contador2",
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(width: 15),
                  ],
                ),
              ),
            ),

            // Círculo rojo y texto VISITA
            Row(
              children: const [
                Text(
                  "VISITA",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.circle,
                  color: Colors.red,
                  size: 12,
                ),
                SizedBox(width: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}