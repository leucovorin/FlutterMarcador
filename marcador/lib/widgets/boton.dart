import 'package:flutter/material.dart';

import '../themes/app_theme.dart';

// WIDGET BOTON
// Es un StatefulWidget que representa los botones para modificar
// la puntuación de cada equipo.
class Boton extends StatefulWidget {

  // Puntuación actual del equipo.
  final int contador;

  // Función que comunica al widget padre el nuevo valor del contador.
  final ValueChanged<int> onChanged;

  // Color principal de los botones superior e inferior.
  final Color colorFondo;

  // Color secundario utilizado en el marcador central y el texto inferior.
  final Color colorFondo2;

  // Texto que identifica al equipo (LOCAL o VISITA).
  final String textoBoton;

  const Boton( {
    super.key,
    required this.contador,
    required this.onChanged,
    required this.colorFondo,
    required this.colorFondo2,
    required this.textoBoton
  });

  @override
  State<Boton> createState() => _BotonState();
}

class _BotonState extends State<Boton> {

  @override
  Widget build(BuildContext context) {

    // CONTENEDOR PRINCIPAL
    // SizedBox establece el ancho del conjunto de botones.
    return SizedBox(
        width: 180,
        child: Column(

          // Los elementos ocupan todo el ancho disponible.
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // BOTÓN SUPERIOR: SUMAR PUNTOS
            // Al pulsarlo, aumenta en uno la puntuación del equipo.
            FilledButton(
                style: AppTheme.botonSuperior.copyWith(
                  // Aplica el color recibido desde el widget padre.
                  backgroundColor: WidgetStatePropertyAll(widget.colorFondo),
                ),

                // Envía al widget padre el contador incrementado.
                onPressed: () => widget.onChanged(widget.contador + 1),

                // Símbolo + que representa la acción de sumar.
                child: Text("+",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 100,
                        fontWeight: FontWeight(280)
                    )
                )
            ),

            // MARCADOR CENTRAL
            // Muestra la puntuación actual del equipo.
            Container(
                height: 300,
                alignment: Alignment.center,

                // Aplica el segundo color recibido.
                color: widget.colorFondo2,

                // Convierte el contador en texto para mostrarlo.
                child: Text(widget.contador.toString() ,
                    style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight(600),
                        color: Colors.white)
                )
            ),

            // BOTÓN INFERIOR: RESTAR PUNTOS
            // Al pulsarlo, resta un punto si el contador es mayor que cero.
            FilledButton(
                style: AppTheme.botonInferior.copyWith(
                  // Aplica el color principal del botón.
                  backgroundColor: WidgetStatePropertyAll(widget.colorFondo),
                ),

                // Comprueba que la puntuación sea mayor que cero
                // antes de permitir restar un punto.
                onPressed: () => {
                  if(widget.contador > 0) {
                    widget.onChanged(widget.contador - 1)
                  }
                },

                // Símbolo — que representa la acción de restar.
                child: Text("—",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight(400),
                        color: Colors.white)
                )
            ),

            // IDENTIFICACIÓN DEL EQUIPO
            // Contenedor inferior que muestra el nombre del equipo.
            Container(

              // Utiliza los estilos definidos en AppTheme.
              decoration: AppTheme.textoInferior.copyWith(
                color: widget.colorFondo2,
              ),

              height: 30,
              alignment: Alignment.center,

              // Muestra el texto recibido desde el widget padre.
              child: Text("${widget.textoBoton}", style: TextStyle(color: Colors.white, fontWeight: FontWeight(700), fontSize: 18)),
            )
          ],
        )
    );

  }

}